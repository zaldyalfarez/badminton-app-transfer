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
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'exam_page_model.dart';
export 'exam_page_model.dart';

class ExamPageWidget extends StatefulWidget {
  const ExamPageWidget({
    super.key,
    required this.ujianId,
    required this.ujianName,
    required this.ujianDurasi,
  });

  final int? ujianId;
  final String? ujianName;
  final int? ujianDurasi;

  static String routeName = 'ExamPage';
  static String routePath = 'examPage';

  @override
  State<ExamPageWidget> createState() => _ExamPageWidgetState();
}

class _ExamPageWidgetState extends State<ExamPageWidget> {
  late ExamPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExamPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.responseGetSoal = await GetAllSoalByUjianIdCall.call(
        id: widget!.ujianId,
        jwt: currentAuthenticationToken,
      );

      if ((_model.responseGetSoal?.succeeded ?? true)) {
        _model.dataList = getJsonField(
          (_model.responseGetSoal?.jsonBody ?? ''),
          r'''$.data''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        _model.totalSoal = functions.countQuestion(getJsonField(
          (_model.responseGetSoal?.jsonBody ?? ''),
          r'''$.data''',
          true,
        ));
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        context.safePop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gagal  memuat ujian',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.raleway(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 300),
        callback: (timer) async {
          _model.timerController.onStartTimer();
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await SubmitUjianCall.call(
        jwt: currentAuthenticationToken,
        userUjianid: FFAppState().userUjianId,
      );

      if ((_model.responseGetSoal?.succeeded ?? true)) {
        context.pushNamed(ExamResultWidget.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gagal submit, silahkan ulangi',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          drawer: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Builder(
                  builder: (context) {
                    final loopJumlahSoal = _model.dataList.toList();

                    return Wrap(
                      spacing: 8.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(loopJumlahSoal.length,
                          (loopJumlahSoalIndex) {
                        final loopJumlahSoalItem =
                            loopJumlahSoal[loopJumlahSoalIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await _model.pageViewController?.animateToPage(
                              loopJumlahSoalIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).buttonPrimary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  loopJumlahSoalItem,
                                  r'''$.id''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                if (_model.isLoading == false)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.secondaryAppBarModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: SecondaryAppBarWidget(
                              appbarTitle: widget!.ujianName!,
                              isBackEnable: false,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .buttonPrimary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.listUl,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 75.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .buttonPrimary,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowTimer(
                                      initialTime: functions
                                          .convertSecToMs(widget!.ujianDurasi)!,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timerController,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) safeSetState(() {});
                                      },
                                      onEnded: () async {
                                        await SubmitUjianCall.call(
                                          jwt: currentAuthenticationToken,
                                          userUjianid: FFAppState().userUjianId,
                                        );

                                        if ((_model
                                                .responseGetSoal?.succeeded ??
                                            true)) {
                                          context.pushNamed(
                                              ExamResultWidget.routeName);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Gagal submit, silahkan ulangi',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.raleway(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final loopSoal = _model.dataList.toList();

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 725.0,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: PageView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(0,
                                                min(0, loopSoal.length - 1))),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: loopSoal.length,
                                    itemBuilder: (context, loopSoalIndex) {
                                      final loopSoalItem =
                                          loopSoal[loopSoalIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (getJsonField(
                                                  loopSoalItem,
                                                  r'''$.image''',
                                                ) !=
                                                null)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 200.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF2D3F55),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          functions
                                                              .buildSoalImageUrl(
                                                                  getJsonField(
                                                                loopSoalItem,
                                                                r'''$.image''',
                                                              ).toString())
                                                              .toString(),
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          fit: BoxFit.contain,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                1.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (getJsonField(
                                                  loopSoalItem,
                                                  r'''$.video''',
                                                ) !=
                                                null)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        FlutterFlowVideoPlayer(
                                                      path: getJsonField(
                                                        loopSoalItem,
                                                        r'''$.video''',
                                                      ).toString(),
                                                      videoType:
                                                          VideoType.network,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      autoPlay: false,
                                                      looping: true,
                                                      showControls: true,
                                                      allowFullScreen: true,
                                                      allowPlaybackSpeedMenu:
                                                          false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      getJsonField(
                                                        loopSoalItem,
                                                        r'''$.question''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .raleway(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .quizAnswerButtonModels
                                                  .getModel(
                                                getJsonField(
                                                  loopSoalItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                loopSoalIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: QuizAnswerButtonWidget(
                                                key: Key(
                                                  'Keylui_${getJsonField(
                                                    loopSoalItem,
                                                    r'''$.id''',
                                                  ).toString()}',
                                                ),
                                                optionA: getJsonField(
                                                  loopSoalItem,
                                                  r'''$.optionA''',
                                                ).toString(),
                                                optionB: getJsonField(
                                                  loopSoalItem,
                                                  r'''$.optionB''',
                                                ).toString(),
                                                optionC: getJsonField(
                                                  loopSoalItem,
                                                  r'''$.optionC''',
                                                ).toString(),
                                                optionD: getJsonField(
                                                  loopSoalItem,
                                                  r'''$.optionD''',
                                                ).toString(),
                                                soalId: getJsonField(
                                                  loopSoalItem,
                                                  r'''$.id''',
                                                ),
                                                ujianId: widget!.ujianId!,
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                if ((_model.pageViewCurrentIndex != 0) &&
                    (_model.isLoading == false))
                  Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await _model.pageViewController?.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          width: 135.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).buttonSecondary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Sebelumnya',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if ((_model.pageViewCurrentIndex == _model.totalSoal) &&
                    (_model.isLoading == false))
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await SubmitUjianCall.call(
                            jwt: currentAuthenticationToken,
                            userUjianid: FFAppState().userUjianId,
                          );

                          if ((_model.responseGetSoal?.succeeded ?? true)) {
                            context.pushNamed(ExamResultWidget.routeName);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Gagal submit, silahkan ulangi',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }

                          FFAppState().isExam = [];
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 135.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).success,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Selesai',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if ((_model.pageViewCurrentIndex != _model.totalSoal) &&
                    (_model.isLoading == false))
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          width: 135.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).buttonPrimary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Selanjutnya',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_model.isLoading == true)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.secondaryAppBarModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: SecondaryAppBarWidget(
                          appbarTitle: widget!.ujianName!,
                          isBackEnable: false,
                        ),
                      ),
                      Expanded(
                        child: wrapWithModel(
                          model: _model.examPageLoadingModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ExamPageLoadingWidget(),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
