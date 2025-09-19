import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/navigation_bar/navigation_bar_widget.dart';
import '/global_component/primary_app_bar/primary_app_bar_widget.dart';
import '/loading_state/statistic_card_loading/statistic_card_loading_widget.dart';
import '/statistic/statistic_card/statistic_card_widget.dart';
import 'dart:ui';
import 'statistic_page_widget.dart' show StatisticPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatisticPageModel extends FlutterFlowModel<StatisticPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PrimaryAppBar component.
  late PrimaryAppBarModel primaryAppBarModel;
  // Models for StatisticCard dynamic component.
  late FlutterFlowDynamicModels<StatisticCardModel> statisticCardModels;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    primaryAppBarModel = createModel(context, () => PrimaryAppBarModel());
    statisticCardModels = FlutterFlowDynamicModels(() => StatisticCardModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    primaryAppBarModel.dispose();
    statisticCardModels.dispose();
    navigationBarModel.dispose();
  }
}
