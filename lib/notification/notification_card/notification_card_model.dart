import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/is_empty/is_empty_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'notification_card_widget.dart' show NotificationCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationCardModel extends FlutterFlowModel<NotificationCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for isEmpty component.
  late IsEmptyModel isEmptyModel;

  @override
  void initState(BuildContext context) {
    isEmptyModel = createModel(context, () => IsEmptyModel());
  }

  @override
  void dispose() {
    isEmptyModel.dispose();
  }
}
