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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'statistic_history_model.dart';
export 'statistic_history_model.dart';

class StatisticHistoryWidget extends StatefulWidget {
  const StatisticHistoryWidget({
    super.key,
    required this.ujianId,
  });

  final int? ujianId;

  static String routeName = 'StatisticHistory';
  static String routePath = 'statisticHistory';

  @override
  State<StatisticHistoryWidget> createState() => _StatisticHistoryWidgetState();
}

class _StatisticHistoryWidgetState extends State<StatisticHistoryWidget> {
  late StatisticHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticHistoryModel());
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.secondaryAppBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SecondaryAppBarWidget(
                    appbarTitle: 'Riwayat Ujian',
                    isBackEnable: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: GetHistoryUjianCall.call(
                      jwt: currentAuthenticationToken,
                      ujianId: widget!.ujianId,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return StatisticHistoryLoadingWidget();
                      }
                      final columnGetHistoryUjianResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final listHistory = GetHistoryUjianCall.ujianList(
                                columnGetHistoryUjianResponse.jsonBody,
                              )?.toList() ??
                              [];

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listHistory.length,
                                (listHistoryIndex) {
                              final listHistoryItem =
                                  listHistory[listHistoryIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ExamResultWidget.routeName,
                                    queryParameters: {
                                      'userUjianId': serializeParam(
                                        getJsonField(
                                          listHistoryItem,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.statisticCardHistoryModels
                                      .getModel(
                                    getJsonField(
                                      listHistoryItem,
                                      r'''$.id''',
                                    ).toString(),
                                    listHistoryIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: StatisticCardHistoryWidget(
                                    key: Key(
                                      'Keyvc3_${getJsonField(
                                        listHistoryItem,
                                        r'''$.id''',
                                      ).toString()}',
                                    ),
                                    ujianTitle: getJsonField(
                                      listHistoryItem,
                                      r'''$.ujian.name''',
                                    ).toString(),
                                    selesaiAt: functions
                                        .formatDateToDDMMYYYY(getJsonField(
                                      listHistoryItem,
                                      r'''$.selesaiAt''',
                                    ).toString()),
                                    userUjianId: getJsonField(
                                      listHistoryItem,
                                      r'''$.id''',
                                    ).toString(),
                                  ),
                                ),
                              );
                            }).divide(SizedBox(height: 10.0)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ]
                  .divide(SizedBox(height: 25.0))
                  .addToEnd(SizedBox(height: 150.0)),
            ),
          ),
        ),
      ),
    );
  }
}
