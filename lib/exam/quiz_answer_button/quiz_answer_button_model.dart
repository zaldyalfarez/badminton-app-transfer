import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'quiz_answer_button_widget.dart' show QuizAnswerButtonWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizAnswerButtonModel extends FlutterFlowModel<QuizAnswerButtonWidget> {
  ///  Local state fields for this component.

  String? choosenAnswer;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Jawab Soal)] action in Container widget.
  ApiCallResponse? responseJawabSoalA;
  // Stores action output result for [Backend Call - API (Jawab Soal)] action in Container widget.
  ApiCallResponse? responseJawabSoalB;
  // Stores action output result for [Backend Call - API (Jawab Soal)] action in Container widget.
  ApiCallResponse? responseJawabSoalC;
  // Stores action output result for [Backend Call - API (Jawab Soal)] action in Container widget.
  ApiCallResponse? responseJawabSoalD;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
