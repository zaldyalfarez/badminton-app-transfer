import '/booking/add_schedule_button/add_schedule_button_widget.dart';
import '/booking/schedule_card/schedule_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/navigation_bar/navigation_bar_widget.dart';
import '/global_component/primary_app_bar/primary_app_bar_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'schedule_page_model.dart';
export 'schedule_page_model.dart';

class SchedulePageWidget extends StatefulWidget {
  const SchedulePageWidget({super.key});

  static String routeName = 'SchedulePage';
  static String routePath = 'schedulePage';

  @override
  State<SchedulePageWidget> createState() => _SchedulePageWidgetState();
}

class _SchedulePageWidgetState extends State<SchedulePageWidget> {
  late SchedulePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchedulePageModel());
  }

  @override
  void dispose() {
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
      child: PopScope(
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
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      175.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.primaryAppBarModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PrimaryAppBarWidget(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Jadwal Anda',
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
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
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
                          wrapWithModel(
                            model: _model.scheduleCardModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ScheduleCardWidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (FFAppState().currentUser.role == 'user')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 124.0),
                    child: wrapWithModel(
                      model: _model.addScheduleButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AddScheduleButtonWidget(),
                    ),
                  ),
                wrapWithModel(
                  model: _model.navigationBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavigationBarWidget(
                    activePage: 'BookingPage',
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
