import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_loading_model.dart';
export 'notification_loading_model.dart';

class NotificationLoadingWidget extends StatefulWidget {
  const NotificationLoadingWidget({super.key});

  @override
  State<NotificationLoadingWidget> createState() =>
      _NotificationLoadingWidgetState();
}

class _NotificationLoadingWidgetState extends State<NotificationLoadingWidget> {
  late NotificationLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Icon(
        Icons.notifications_none_rounded,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 32.0,
      ),
    );
  }
}
