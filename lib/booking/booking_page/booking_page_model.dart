import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import '/loading_state/coach_form_loading/coach_form_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'booking_page_widget.dart' show BookingPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingPageModel extends FlutterFlowModel<BookingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - API (User Add Booking)] action in Button widget.
  ApiCallResponse? responseBooking;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel = createModel(context, () => SecondaryAppBarModel());
  }

  @override
  void dispose() {
    secondaryAppBarModel.dispose();
  }
}
