import '/auth/auth_footer_login/auth_footer_login_widget.dart';
import '/auth/auth_heading/auth_heading_widget.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for AuthHeading component.
  late AuthHeadingModel authHeadingModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textFieldTextController1;
  String? Function(BuildContext, String?)? textFieldTextController1Validator;
  String? _textFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    if (!RegExp('^[a-zA-Z\\s]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textFieldTextController2;
  String? Function(BuildContext, String?)? textFieldTextController2Validator;
  String? _textFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textFieldTextController3;
  late bool textFieldVisibility;
  String? Function(BuildContext, String?)? textFieldTextController3Validator;
  String? _textFieldTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Register)] action in Button widget.
  ApiCallResponse? registerResponse;
  // Model for AuthFooterLogin component.
  late AuthFooterLoginModel authFooterLoginModel;

  @override
  void initState(BuildContext context) {
    authHeadingModel = createModel(context, () => AuthHeadingModel());
    textFieldTextController1Validator = _textFieldTextController1Validator;
    textFieldTextController2Validator = _textFieldTextController2Validator;
    textFieldVisibility = false;
    textFieldTextController3Validator = _textFieldTextController3Validator;
    authFooterLoginModel = createModel(context, () => AuthFooterLoginModel());
  }

  @override
  void dispose() {
    authHeadingModel.dispose();
    textFieldFocusNode1?.dispose();
    textFieldTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    textFieldTextController2?.dispose();

    textFieldFocusNode3?.dispose();
    textFieldTextController3?.dispose();

    authFooterLoginModel.dispose();
  }
}
