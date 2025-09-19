import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import '/loading_state/statistic_history_loading/statistic_history_loading_widget.dart';
import '/statistic/statistic_card_history/statistic_card_history_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'statistic_history_widget.dart' show StatisticHistoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatisticHistoryModel extends FlutterFlowModel<StatisticHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel;
  // Models for StatisticCardHistory dynamic component.
  late FlutterFlowDynamicModels<StatisticCardHistoryModel>
      statisticCardHistoryModels;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel = createModel(context, () => SecondaryAppBarModel());
    statisticCardHistoryModels =
        FlutterFlowDynamicModels(() => StatisticCardHistoryModel());
  }

  @override
  void dispose() {
    secondaryAppBarModel.dispose();
    statisticCardHistoryModels.dispose();
  }
}
