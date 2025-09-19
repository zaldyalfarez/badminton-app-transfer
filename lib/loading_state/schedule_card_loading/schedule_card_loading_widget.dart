import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'schedule_card_loading_model.dart';
export 'schedule_card_loading_model.dart';

class ScheduleCardLoadingWidget extends StatefulWidget {
  const ScheduleCardLoadingWidget({super.key});

  @override
  State<ScheduleCardLoadingWidget> createState() =>
      _ScheduleCardLoadingWidgetState();
}

class _ScheduleCardLoadingWidgetState extends State<ScheduleCardLoadingWidget>
    with TickerProviderStateMixin {
  late ScheduleCardLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleCardLoadingModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
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
      'containerOnPageLoadAnimation6': AnimationInfo(
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
      'containerOnPageLoadAnimation7': AnimationInfo(
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
      'containerOnPageLoadAnimation8': AnimationInfo(
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
      'containerOnPageLoadAnimation9': AnimationInfo(
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
      'containerOnPageLoadAnimation10': AnimationInfo(
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
      'containerOnPageLoadAnimation11': AnimationInfo(
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
      'containerOnPageLoadAnimation12': AnimationInfo(
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).baseSkeleton,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                        ],
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: 75.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation4']!),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).baseSkeleton,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation5']!),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation6']!),
                        ],
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: 75.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation7']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation8']!),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).baseSkeleton,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation9']!),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation10']!),
                        ],
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: 75.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation11']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation12']!),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ],
            ),
          ),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
