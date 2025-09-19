import '/auth/auth_footer_login/auth_footer_login_widget.dart';
import '/auth/auth_heading/auth_heading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AuthHeading component.
  late AuthHeadingModel authHeadingModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for AuthFooterLogin component.
  late AuthFooterLoginModel authFooterLoginModel;

  @override
  void initState(BuildContext context) {
    authHeadingModel = createModel(context, () => AuthHeadingModel());
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    authFooterLoginModel = createModel(context, () => AuthFooterLoginModel());
  }

  @override
  void dispose() {
    authHeadingModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    authFooterLoginModel.dispose();
  }
}
