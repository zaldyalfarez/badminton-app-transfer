import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'statistic_detail_loading_widget.dart' show StatisticDetailLoadingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatisticDetailLoadingModel
    extends FlutterFlowModel<StatisticDetailLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel = createModel(context, () => SecondaryAppBarModel());
  }

  @override
  void dispose() {
    secondaryAppBarModel.dispose();
  }
}
