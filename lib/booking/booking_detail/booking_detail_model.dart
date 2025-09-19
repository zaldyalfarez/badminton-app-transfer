import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'booking_detail_widget.dart' show BookingDetailWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingDetailModel extends FlutterFlowModel<BookingDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Coach Update Booking)] action in Button widget.
  ApiCallResponse? responseTolakBooking;
  // Stores action output result for [Backend Call - API (Coach Update Booking)] action in Button widget.
  ApiCallResponse? responseTerimaBooking;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel = createModel(context, () => SecondaryAppBarModel());
  }

  @override
  void dispose() {
    secondaryAppBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
