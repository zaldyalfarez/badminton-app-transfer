import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'practice_page_loading_widget.dart' show PracticePageLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PracticePageLoadingModel
    extends FlutterFlowModel<PracticePageLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel = createModel(context, () => SecondaryAppBarModel());
  }

  @override
  void dispose() {
    secondaryAppBarModel.dispose();
  }
}
