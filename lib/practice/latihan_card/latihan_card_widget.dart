import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_state/latihan_card_loading/latihan_card_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'latihan_card_model.dart';
export 'latihan_card_model.dart';

class LatihanCardWidget extends StatefulWidget {
  const LatihanCardWidget({super.key});

  @override
  State<LatihanCardWidget> createState() => _LatihanCardWidgetState();
}

class _LatihanCardWidgetState extends State<LatihanCardWidget> {
  late LatihanCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatihanCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: GetAllLatihanCall.call(
          jwt: currentAuthenticationToken,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              child: LatihanCardLoadingWidget(),
            );
          }
          final rowGetAllLatihanResponse = snapshot.data!;

          return Builder(
            builder: (context) {
              final latihan = getJsonField(
                rowGetAllLatihanResponse.jsonBody,
                r'''$.data''',
              ).toList().take(3).toList();

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(latihan.length, (latihanIndex) {
                    final latihanItem = latihan[latihanIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          PracticePageWidget.routeName,
                          queryParameters: {
                            'id': serializeParam(
                              getJsonField(
                                latihanItem,
                                r'''$.id''',
                              ),
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: 200.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: functions.getRandomCardColor(),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    functions
                                        .buildPracticeThumbnailUrl(getJsonField(
                                          latihanItem,
                                          r'''$.thumbnail''',
                                        ).toString())
                                        .toString(),
                                    width: 90.0,
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 50.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    latihanItem,
                                    r'''$.name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                latihanItem,
                                r'''$.isCompleted''',
                              ))
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 1.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions.formatMenitToTimeString(
                                                getJsonField(
                                              latihanItem,
                                              r'''$.durasi''',
                                            )),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.raleway(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                    if (getJsonField(
                                      latihanItem,
                                      r'''$.ar''',
                                    ))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Text(
                                            'AR',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).divide(SizedBox(width: 15.0)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
