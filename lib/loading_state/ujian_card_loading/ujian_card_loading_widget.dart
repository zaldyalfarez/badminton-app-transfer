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
import 'ujian_card_loading_model.dart';
export 'ujian_card_loading_model.dart';

class UjianCardLoadingWidget extends StatefulWidget {
  const UjianCardLoadingWidget({super.key});

  @override
  State<UjianCardLoadingWidget> createState() => _UjianCardLoadingWidgetState();
}

class _UjianCardLoadingWidgetState extends State<UjianCardLoadingWidget>
    with TickerProviderStateMixin {
  late UjianCardLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UjianCardLoadingModel());

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
      'containerOnPageLoadAnimation4': AnimationInfo(
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
      'containerOnPageLoadAnimation8': AnimationInfo(
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
    });
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 200.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).baseSkeleton,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Container(
                        width: 125.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                          Container(
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation4']!),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Container(
                        width: 75.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation5']!),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).baseSkeleton,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Container(
                        width: 125.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation6']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation7']!),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation8']!),
                          Container(
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).textSkeleton,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation9']!),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Container(
                        width: 75.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textSkeleton,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation10']!),
                    ),
                  ],
                ),
              ),
            ),
          ].divide(SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
