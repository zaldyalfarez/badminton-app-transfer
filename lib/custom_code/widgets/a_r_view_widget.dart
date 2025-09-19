// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:ar_flutter_plugin_2/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin_2/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_2/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_2/models/ar_node.dart';
import 'package:ar_flutter_plugin_2/datatypes/config_planedetection.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARViewWidget extends StatefulWidget {
  const ARViewWidget({
    super.key,
    this.width,
    this.height,
    this.fileName,
  });

  final double? width;
  final double? height;
  final String? fileName;

  @override
  State<ARViewWidget> createState() => _ARViewWidgetState();
}

class _ARViewWidgetState extends State<ARViewWidget> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ARView(
        onARViewCreated: onARViewCreated,
        planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: null,
      showWorldOrigin: false,
    );

    arObjectManager.onInitialize();

    Future.delayed(const Duration(seconds: 3), () => _addObject());
  }

  Future<void> _addObject() async {
    final name = widget.fileName;

    if (name == null || name.isEmpty) {
      return;
    }

    final String fullUrl =
        "https://api-badminton.arsitek-kode.com/public/3d/$name";

    final newNode = ARNode(
      type: NodeType.webGLB,
      uri: fullUrl,
      scale: vector.Vector3(1.0, 1.0, 1.0),
      position: vector.Vector3(0.0, 0.0, -1.0),
      rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0),
    );

    bool? didAdd = await arObjectManager.addNode(newNode);
  }
}
