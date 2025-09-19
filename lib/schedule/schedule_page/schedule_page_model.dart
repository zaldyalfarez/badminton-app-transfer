import '/booking/add_schedule_button/add_schedule_button_widget.dart';
import '/booking/schedule_card/schedule_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/navigation_bar/navigation_bar_widget.dart';
import '/global_component/primary_app_bar/primary_app_bar_widget.dart';
import 'dart:ui';
import 'schedule_page_widget.dart' show SchedulePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchedulePageModel extends FlutterFlowModel<SchedulePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PrimaryAppBar component.
  late PrimaryAppBarModel primaryAppBarModel;
  // Model for ScheduleCard component.
  late ScheduleCardModel scheduleCardModel;
  // Model for AddScheduleButton component.
  late AddScheduleButtonModel addScheduleButtonModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    primaryAppBarModel = createModel(context, () => PrimaryAppBarModel());
    scheduleCardModel = createModel(context, () => ScheduleCardModel());
    addScheduleButtonModel =
        createModel(context, () => AddScheduleButtonModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    primaryAppBarModel.dispose();
    scheduleCardModel.dispose();
    addScheduleButtonModel.dispose();
    navigationBarModel.dispose();
  }
}
