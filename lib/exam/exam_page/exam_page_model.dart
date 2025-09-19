import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/exam/quiz_answer_button/quiz_answer_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import '/loading_state/exam_page_loading/exam_page_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'exam_page_widget.dart' show ExamPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ExamPageModel extends FlutterFlowModel<ExamPageWidget> {
  ///  Local state fields for this page.

  int? totalSoal;

  List<dynamic> dataList = [];
  void addToDataList(dynamic item) => dataList.add(item);
  void removeFromDataList(dynamic item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, dynamic item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(dynamic) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get All  Soal By Ujian Id)] action in ExamPage widget.
  ApiCallResponse? responseGetSoal;
  InstantTimer? instantTimer;
  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel1;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for QuizAnswerButton dynamic component.
  late FlutterFlowDynamicModels<QuizAnswerButtonModel> quizAnswerButtonModels;
  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel2;
  // Model for ExamPageLoading component.
  late ExamPageLoadingModel examPageLoadingModel;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel1 = createModel(context, () => SecondaryAppBarModel());
    quizAnswerButtonModels =
        FlutterFlowDynamicModels(() => QuizAnswerButtonModel());
    secondaryAppBarModel2 = createModel(context, () => SecondaryAppBarModel());
    examPageLoadingModel = createModel(context, () => ExamPageLoadingModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    secondaryAppBarModel1.dispose();
    timerController.dispose();
    quizAnswerButtonModels.dispose();
    secondaryAppBarModel2.dispose();
    examPageLoadingModel.dispose();
  }
}
