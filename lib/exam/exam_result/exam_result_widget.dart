import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/loading_state/exam_result_loading/exam_result_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'exam_result_model.dart';
export 'exam_result_model.dart';

class ExamResultWidget extends StatefulWidget {
  const ExamResultWidget({
    super.key,
    this.userUjianId,
  });

  final int? userUjianId;

  static String routeName = 'ExamResult';
  static String routePath = 'examResult';

  @override
  State<ExamResultWidget> createState() => _ExamResultWidgetState();
}

class _ExamResultWidgetState extends State<ExamResultWidget> {
  late ExamResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExamResultModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: SkorCall.call(
        jwt: currentAuthenticationToken,
        id: FFAppState().userUjianId != 0
            ? FFAppState().userUjianId
            : widget.userUjianId,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: const ExamResultLoadingWidget(),
          );
        }
        final examResultSkorResponse = snapshot.data!;

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
              body: SafeArea(
                top: true,
                bottom: true,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 75.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Grades-cuate.svg',
                                      width: 250.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: const BoxDecoration(),
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: Text(
                                              'Nilai Kamu',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.raleway(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        fontSize: 28.0,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                examResultSkorResponse.jsonBody,
                                                r'''$.data.skor''',
                                              ).toString(),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.raleway(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayMedium
                                                                  .fontWeight,
                                                        ),
                                                        fontSize: 64.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: LinearPercentIndicator(
                                        percent: functions
                                            .getScorePercentage(getJsonField(
                                          examResultSkorResponse.jsonBody,
                                          r'''$.data.skor''',
                                        )),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.85,
                                        lineHeight: 20.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .cardQuarternary,
                                        center: Text(
                                          'Benar ${(((getJsonField(examResultSkorResponse.jsonBody, r'''$.data.skor''') * getJsonField(examResultSkorResponse.jsonBody, r'''$.data.jumlahSoal''')) / 100).round())} dari ${getJsonField(
                                            examResultSkorResponse.jsonBody,
                                            r'''$.data.jumlahSoal''',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                color:
                                                    Colors.black, // balik hitam
                                                fontSize: 12.0,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(10.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 100.0,
                                        decoration: const BoxDecoration(),
                                        alignment: const AlignmentDirectional(
                                            0.0, -1.0),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, -1.0),
                                          child: Text(
                                            functions.getUjianFeedback(
                                              getJsonField(
                                                examResultSkorResponse.jsonBody,
                                                r'''$.data.skor''',
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.raleway(),
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 25.0)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(HomePageWidget.routeName);
                                  FFAppState().userUjianId = 0;
                                  safeSetState(() {});
                                },
                                text: 'Kembali ke Beranda',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .buttonPrimary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.raleway(),
                                        color: Colors.white,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
