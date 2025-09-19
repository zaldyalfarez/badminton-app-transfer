import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_answer_button_model.dart';
export 'quiz_answer_button_model.dart';

class QuizAnswerButtonWidget extends StatefulWidget {
  const QuizAnswerButtonWidget({
    super.key,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.soalId,
    required this.ujianId,
  });

  final String? optionA;
  final String? optionB;
  final String? optionC;
  final String? optionD;
  final int? soalId;
  final int? ujianId;

  @override
  State<QuizAnswerButtonWidget> createState() => _QuizAnswerButtonWidgetState();
}

class _QuizAnswerButtonWidgetState extends State<QuizAnswerButtonWidget> {
  late QuizAnswerButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizAnswerButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.choosenAnswer = null;
            safeSetState(() {});
            _model.choosenAnswer = 'A';
            safeSetState(() {});
            FFAppState().addToIsExam(IsExamStruct(
              id: widget!.soalId,
              answer: _model.choosenAnswer,
            ));
            safeSetState(() {});
            _model.responseJawabSoalA = await JawabSoalCall.call(
              jwt: currentAuthenticationToken,
              userUjianId: FFAppState().userUjianId,
              soalId: widget!.soalId,
              answer: _model.choosenAnswer,
            );

            if (!(_model.responseJawabSoalA?.succeeded ?? true)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Gagal mengirim jawaban',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).error,
                ),
              );
            }

            safeSetState(() {});
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).cardPrimary,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'A'
                    ? Color(0xFF2563EB)
                    : Color(0x00000000),
                width: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'A'
                    ? 4.0
                    : 0.0,
              ),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'A',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.optionA,
                              'optionA',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.choosenAnswer = null;
            safeSetState(() {});
            _model.choosenAnswer = 'B';
            safeSetState(() {});
            FFAppState().addToIsExam(IsExamStruct(
              id: widget!.soalId,
              answer: _model.choosenAnswer,
            ));
            safeSetState(() {});
            _model.responseJawabSoalB = await JawabSoalCall.call(
              jwt: currentAuthenticationToken,
              userUjianId: FFAppState().userUjianId,
              soalId: widget!.soalId,
              answer: _model.choosenAnswer,
            );

            if (!(_model.responseJawabSoalB?.succeeded ?? true)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Gagal mengirim jawaban',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).error,
                ),
              );
            }

            safeSetState(() {});
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).cardSecondary,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'B'
                    ? Color(0xFF2563EB)
                    : Color(0x00000000),
                width: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'B'
                    ? 4.0
                    : 0.0,
              ),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'B',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.optionB,
                              'optionB',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.choosenAnswer = null;
            safeSetState(() {});
            _model.choosenAnswer = 'C';
            safeSetState(() {});
            FFAppState().addToIsExam(IsExamStruct(
              id: widget!.soalId,
              answer: _model.choosenAnswer,
            ));
            safeSetState(() {});
            _model.responseJawabSoalC = await JawabSoalCall.call(
              jwt: currentAuthenticationToken,
              userUjianId: FFAppState().userUjianId,
              soalId: widget!.soalId,
              answer: _model.choosenAnswer,
            );

            if (!(_model.responseJawabSoalC?.succeeded ?? true)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Gagal mengirim jawaban',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).error,
                ),
              );
            }

            safeSetState(() {});
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).cardTertiary,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'C'
                    ? Color(0xFF2563EB)
                    : Color(0x00000000),
                width: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'C'
                    ? 4.0
                    : 0.0,
              ),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'C',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.optionC,
                              'optionC',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.choosenAnswer = null;
            safeSetState(() {});
            _model.choosenAnswer = 'D';
            safeSetState(() {});
            FFAppState().addToIsExam(IsExamStruct(
              id: widget!.soalId,
              answer: _model.choosenAnswer,
            ));
            safeSetState(() {});
            _model.responseJawabSoalD = await JawabSoalCall.call(
              jwt: currentAuthenticationToken,
              userUjianId: FFAppState().userUjianId,
              soalId: widget!.soalId,
              answer: _model.choosenAnswer,
            );

            if (!(_model.responseJawabSoalD?.succeeded ?? true)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Gagal mengirim jawaban',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).error,
                ),
              );
            }

            safeSetState(() {});
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).cardQuarternary,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'D'
                    ? Color(0xFF2563EB)
                    : Color(0x00000000),
                width: FFAppState()
                            .isExam
                            .where((e) => e.id == widget!.soalId)
                            .toList()
                            .lastOrNull
                            ?.answer ==
                        'D'
                    ? 4.0
                    : 0.0,
              ),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'D',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.optionD,
                              'optionD',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
