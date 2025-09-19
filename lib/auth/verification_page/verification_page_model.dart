import '/auth/auth_heading/auth_heading_widget.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'verification_page_widget.dart' show VerificationPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationPageModel extends FlutterFlowModel<VerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Resend Verification)] action in VerificationPage widget.
  ApiCallResponse? responseRequestVerification;
  // Model for AuthHeading component.
  late AuthHeadingModel authHeadingModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'OTP is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 6) {
      return 'Maximum 6 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Resend Verification)] action in Text widget.
  ApiCallResponse? responseResendVerification;
  // Stores action output result for [Backend Call - API (Verification)] action in Button widget.
  ApiCallResponse? responseVerification;

  @override
  void initState(BuildContext context) {
    authHeadingModel = createModel(context, () => AuthHeadingModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    authHeadingModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
