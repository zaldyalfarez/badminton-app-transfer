import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_state/notification_loading/notification_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_app_bar_model.dart';
export 'primary_app_bar_model.dart';

class PrimaryAppBarWidget extends StatefulWidget {
  const PrimaryAppBarWidget({super.key});

  @override
  State<PrimaryAppBarWidget> createState() => _PrimaryAppBarWidgetState();
}

class _PrimaryAppBarWidgetState extends State<PrimaryAppBarWidget> {
  late PrimaryAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryAppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 75.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      functions.profilImage(FFAppState().currentUser.image)!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFAppState().currentUser.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
            FutureBuilder<ApiCallResponse>(
              future: GetNotifikasiCall.call(
                jwt: currentAuthenticationToken,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return NotificationLoadingWidget();
                }
                final stackGetNotifikasiResponse = snapshot.data!;

                return Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(NotificationPageWidget.routeName);
                        },
                        child: Icon(
                          Icons.notifications_none_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 32.0,
                        ),
                      ),
                    ),
                    if ((stackGetNotifikasiResponse.statusCode == 200
                            ? functions.getHasUnread(getJsonField(
                                stackGetNotifikasiResponse.jsonBody,
                                r'''$.data''',
                                true,
                              )!)
                            : false) ??
                        true)
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 26.0, 0.0, 0.0),
                          child: Icon(
                            Icons.circle,
                            color: Color(0xFF5BCE5A),
                            size: 12.0,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ].divide(SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
