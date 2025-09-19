import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_page_loading_model.dart';
export 'practice_page_loading_model.dart';

class PracticePageLoadingWidget extends StatefulWidget {
  const PracticePageLoadingWidget({super.key});

  @override
  State<PracticePageLoadingWidget> createState() =>
      _PracticePageLoadingWidgetState();
}

class _PracticePageLoadingWidgetState extends State<PracticePageLoadingWidget>
    with TickerProviderStateMixin {
  late PracticePageLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticePageLoadingModel());

    animationsMap.addAll({
      'secondaryAppBarOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).textSkeleton,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).shimmerEffect,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).shimmerEffect,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).shimmerEffect,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).shimmerEffect,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).shimmerEffect,
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: wrapWithModel(
            model: _model.secondaryAppBarModel,
            updateCallback: () => safeSetState(() {}),
            child: SecondaryAppBarWidget(
              appbarTitle: 'Loading...',
              isBackEnable: true,
            ),
          ).animateOnPageLoad(
              animationsMap['secondaryAppBarOnPageLoadAnimation']!),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 200.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ],
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 10.0,
                        buttonSize: 50.0,
                        fillColor: FlutterFlowTheme.of(context).buttonPrimary,
                        icon: FaIcon(
                          FontAwesomeIcons.cube,
                          color: FlutterFlowTheme.of(context).info,
                          size: 26.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 225.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).baseSkeleton,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).textSkeleton,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 200.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).textSkeleton,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation4']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 275.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).textSkeleton,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation5']!),
                      ],
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
