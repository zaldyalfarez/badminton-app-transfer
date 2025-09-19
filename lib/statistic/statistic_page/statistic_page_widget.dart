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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'statistic_page_model.dart';
export 'statistic_page_model.dart';

class StatisticPageWidget extends StatefulWidget {
  const StatisticPageWidget({super.key});

  static String routeName = 'StatisticPage';
  static String routePath = 'statisticPage';

  @override
  State<StatisticPageWidget> createState() => _StatisticPageWidgetState();
}

class _StatisticPageWidgetState extends State<StatisticPageWidget> {
  late StatisticPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        // ✅ Tambahan agar hardware back disable
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.primaryAppBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryAppBarWidget(),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Statistik',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Diperbarui pada ',
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat("yMd", getCurrentTimestamp),
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: GetAllUjianCall.call(
                            jwt: currentAuthenticationToken,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return StatisticCardLoadingWidget();
                            }
                            final columnGetAllUjianResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final listUjian = getJsonField(
                                  columnGetAllUjianResponse.jsonBody,
                                  r'''$.data''',
                                ).toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(listUjian.length,
                                      (listUjianIndex) {
                                    final listUjianItem =
                                        listUjian[listUjianIndex];
                                    return wrapWithModel(
                                      model:
                                          _model.statisticCardModels.getModel(
                                        getJsonField(
                                          listUjianItem,
                                          r'''$.id''',
                                        ).toString(),
                                        listUjianIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: StatisticCardWidget(
                                        key: Key(
                                          'Keyz9p_${getJsonField(
                                            listUjianItem,
                                            r'''$.id''',
                                          ).toString()}',
                                        ),
                                        judulUjian: getJsonField(
                                          listUjianItem,
                                          r'''$.name''',
                                        ).toString(),
                                        ujianId: getJsonField(
                                          listUjianItem,
                                          r'''$.id''',
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(height: 10.0)),
                                );
                              },
                            );
                          },
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToEnd(SizedBox(height: 150.0)),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.navigationBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavigationBarWidget(
                    activePage: 'StatisticPage',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
