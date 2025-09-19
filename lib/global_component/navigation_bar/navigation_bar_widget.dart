import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_model.dart';
export 'navigation_bar_model.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({
    super.key,
    String? activePage,
  }) : this.activePage = activePage ?? 'null';

  final String activePage;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late NavigationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 85.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).navbarColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(HomePageWidget.routeName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.home,
                      color: widget!.activePage == 'HomePage'
                          ? FlutterFlowTheme.of(context).active
                          : FlutterFlowTheme.of(context).unactive,
                      size: 20.0,
                    ),
                    Text(
                      'Beranda',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget!.activePage == 'HomePage'
                                ? FlutterFlowTheme.of(context).active
                                : FlutterFlowTheme.of(context).unactive,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(SearchPageWidget.routeName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.search,
                      color: widget!.activePage == 'SearchPage'
                          ? FlutterFlowTheme.of(context).active
                          : FlutterFlowTheme.of(context).unactive,
                      size: 20.0,
                    ),
                    Text(
                      'Pencarian',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget!.activePage == 'SearchPage'
                                ? FlutterFlowTheme.of(context).active
                                : FlutterFlowTheme.of(context).unactive,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(StatisticPageWidget.routeName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.chartBar,
                      color: widget!.activePage == 'StatisticPage'
                          ? FlutterFlowTheme.of(context).active
                          : FlutterFlowTheme.of(context).unactive,
                      size: 20.0,
                    ),
                    Text(
                      'Statistik',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget!.activePage == 'StatisticPage'
                                ? FlutterFlowTheme.of(context).active
                                : FlutterFlowTheme.of(context).unactive,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(SchedulePageWidget.routeName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidCalendarAlt,
                      color: widget!.activePage == 'BookingPage'
                          ? FlutterFlowTheme.of(context).active
                          : FlutterFlowTheme.of(context).unactive,
                      size: 20.0,
                    ),
                    Text(
                      'Jadwal',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget!.activePage == 'BookingPage'
                                ? FlutterFlowTheme.of(context).active
                                : FlutterFlowTheme.of(context).unactive,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(ProfilePageWidget.routeName);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.userAlt,
                      color: widget!.activePage == 'ProfilePage'
                          ? FlutterFlowTheme.of(context).active
                          : FlutterFlowTheme.of(context).unactive,
                      size: 20.0,
                    ),
                    Text(
                      'Profil',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget!.activePage == 'ProfilePage'
                                ? FlutterFlowTheme.of(context).active
                                : FlutterFlowTheme.of(context).unactive,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
