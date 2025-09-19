import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import '/loading_state/practice_page_loading/practice_page_loading_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_page_model.dart';
export 'practice_page_model.dart';

class PracticePageWidget extends StatefulWidget {
  const PracticePageWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'PracticePage';
  static String routePath = 'practicePage';

  @override
  State<PracticePageWidget> createState() => _PracticePageWidgetState();
}

class _PracticePageWidgetState extends State<PracticePageWidget> {
  late PracticePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: FutureBuilder<ApiCallResponse>(
              future: GetLatihanByIdCall.call(
                id: widget!.id,
                jwt: currentAuthenticationToken,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return PracticePageLoadingWidget();
                }
                final listViewGetLatihanByIdResponse = snapshot.data!;

                return ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.secondaryAppBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SecondaryAppBarWidget(
                        appbarTitle: getJsonField(
                          listViewGetLatihanByIdResponse.jsonBody,
                          r'''$.data.kategori''',
                        ).toString(),
                        isBackEnable: true,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    getJsonField(
                                      listViewGetLatihanByIdResponse.jsonBody,
                                      r'''$.data.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  if (getJsonField(
                                    listViewGetLatihanByIdResponse.jsonBody,
                                    r'''$.data.ar''',
                                  ))
                                    FlutterFlowIconButton(
                                      borderRadius: 10.0,
                                      buttonSize: 50.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .buttonPrimary,
                                      icon: FaIcon(
                                        FontAwesomeIcons.cube,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 26.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          AugmentedRealityWidget.routeName,
                                          queryParameters: {
                                            'practiceName': serializeParam(
                                              getJsonField(
                                                listViewGetLatihanByIdResponse
                                                    .jsonBody,
                                                r'''$.data.name''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'modelAR': serializeParam(
                                              getJsonField(
                                                listViewGetLatihanByIdResponse
                                                    .jsonBody,
                                                r'''$.data.arModel''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                            FlutterFlowYoutubePlayer(
                              url: getJsonField(
                                listViewGetLatihanByIdResponse.jsonBody,
                                r'''$.data.video''',
                              ).toString(),
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 225.0,
                              autoPlay: false,
                              looping: true,
                              mute: false,
                              showControls: true,
                              showFullScreen: true,
                              strictRelatedVideos: true,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      getJsonField(
                                        listViewGetLatihanByIdResponse.jsonBody,
                                        r'''$.data.deskripsi''',
                                      ).toString(),
                                      textAlign: TextAlign.justify,
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
                                            fontSize: 16.0,
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
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
