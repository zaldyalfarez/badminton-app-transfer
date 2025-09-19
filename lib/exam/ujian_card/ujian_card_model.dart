import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_state/ujian_card_loading/ujian_card_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ujian_card_widget.dart' show UjianCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UjianCardModel extends FlutterFlowModel<UjianCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Start Ujian)] action in Container widget.
  ApiCallResponse? startUjianResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
