import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_state/ujian_card_loading/ujian_card_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ujian_card_model.dart';
export 'ujian_card_model.dart';

class UjianCardWidget extends StatefulWidget {
  const UjianCardWidget({super.key});

  @override
  State<UjianCardWidget> createState() => _UjianCardWidgetState();
}

class _UjianCardWidgetState extends State<UjianCardWidget> {
  late UjianCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UjianCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetAllUjianCall.call(
        jwt: currentAuthenticationToken,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return UjianCardLoadingWidget();
        }
        final rowGetAllUjianResponse = snapshot.data!;

        final ujian = getJsonField(
          rowGetAllUjianResponse.jsonBody,
          r'''$.data''',
        ).toList().take(3).toList();

        if (ujian.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 160, // tinggi container untuk card
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 0, right: 16),
            scrollDirection: Axis.horizontal,
            itemCount: ujian.length,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final ujianItem = ujian[index];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    ExamPageWidget.routeName,
                    queryParameters: {
                      'ujianId': serializeParam(
                        getJsonField(ujianItem, r'''$.id'''),
                        ParamType.int,
                      ),
                      'ujianName': serializeParam(
                        getJsonField(ujianItem, r'''$.name''').toString(),
                        ParamType.String,
                      ),
                      'ujianDurasi': serializeParam(
                        getJsonField(ujianItem, r'''$.durasi'''),
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );

                  _model.startUjianResponse = await StartUjianCall.call(
                    jwt: currentAuthenticationToken,
                    ujianId: getJsonField(ujianItem, r'''$.id'''),
                  );

                  if ((_model.startUjianResponse?.succeeded ?? true)) {
                    FFAppState().userUjianId = StartUjianCall.startUjianId(
                      (_model.startUjianResponse?.jsonBody ?? ''),
                    )!;
                    safeSetState(() {});
                  }

                  safeSetState(() {});
                },
                child: Container(
                  width: 200.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: functions.getRandomCardColor(),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              functions
                                  .buildExamThumbnailUrl(getJsonField(
                                    ujianItem,
                                    r'''$.thumbnail''',
                                  ).toString())
                                  .toString(),
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.png',
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 50.0, 0.0),
                          child: Text(
                            getJsonField(
                              ujianItem,
                              r'''$.name''',
                            ).toString(),
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
                        if (getJsonField(
                          ujianItem,
                          r'''$.isCompleted''',
                        ))
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 32.0,
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    getJsonField(
                                      ujianItem,
                                      r'''$.level''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.raleway(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
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
              );
            },
          ),
        );
      },
    );
  }
}
