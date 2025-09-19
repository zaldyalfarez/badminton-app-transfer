import '/auth/auth_footer_login/auth_footer_login_widget.dart';
import '/auth/auth_heading/auth_heading_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for AuthHeading component.
  late AuthHeadingModel authHeadingModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email  is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Forgot Password)] action in Button widget.
  ApiCallResponse? responseForgotPassword;
  // Model for AuthFooterLogin component.
  late AuthFooterLoginModel authFooterLoginModel;

  @override
  void initState(BuildContext context) {
    authHeadingModel = createModel(context, () => AuthHeadingModel());
    textControllerValidator = _textControllerValidator;
    authFooterLoginModel = createModel(context, () => AuthFooterLoginModel());
  }

  @override
  void dispose() {
    authHeadingModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    authFooterLoginModel.dispose();
  }
}
