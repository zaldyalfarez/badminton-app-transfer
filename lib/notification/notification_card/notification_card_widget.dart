import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/is_empty/is_empty_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_card_model.dart';
export 'notification_card_model.dart';

class NotificationCardWidget extends StatefulWidget {
  const NotificationCardWidget({super.key});

  @override
  State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget> {
  late NotificationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetNotifikasiCall.call(
        jwt: currentAuthenticationToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).info,
                ),
              ),
            ),
          );
        }
        final columnGetNotifikasiResponse = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) {
                final dataNotif = GetNotifikasiCall.dataNotifikasi(
                      columnGetNotifikasiResponse.jsonBody,
                    )?.toList() ??
                    [];

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(dataNotif.length, (dataNotifIndex) {
                    final dataNotifItem = dataNotif[dataNotifIndex];
                    return Visibility(
                      visible: columnGetNotifikasiResponse.statusCode == 200
                          ? true
                          : false,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            BookingDetailWidget.routeName,
                            queryParameters: {
                              'id': serializeParam(
                                getJsonField(
                                  dataNotifItem,
                                  r'''$.bookingCoachId''',
                                ),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          await UpdateNotifikasiCall.call(
                            jwt: currentAuthenticationToken,
                            id: getJsonField(
                              dataNotifItem,
                              r'''$.id''',
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).buttonSecondary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      dataNotifItem,
                                      r'''$.message''',
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).divide(
                    SizedBox(height: 10.0),
                    filterFn: (dataNotifIndex) {
                      final dataNotifItem = dataNotif[dataNotifIndex];
                      return columnGetNotifikasiResponse.statusCode == 200
                          ? true
                          : false;
                    },
                  ),
                );
              },
            ),
            if (columnGetNotifikasiResponse.statusCode == 404 ? true : false)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.isEmptyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: IsEmptyWidget(
                      isEmptyMessage: 'Notifikasi Kosong',
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
