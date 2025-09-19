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
import 'category_tag_loading_model.dart';
export 'category_tag_loading_model.dart';

class CategoryTagLoadingWidget extends StatefulWidget {
  const CategoryTagLoadingWidget({super.key});

  @override
  State<CategoryTagLoadingWidget> createState() =>
      _CategoryTagLoadingWidgetState();
}

class _CategoryTagLoadingWidgetState extends State<CategoryTagLoadingWidget>
    with TickerProviderStateMixin {
  late CategoryTagLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryTagLoadingModel());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 10.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.down,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).baseSkeleton,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Container(
                    width: 80.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textSkeleton,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                ),
              ],
            ),
          ),
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).baseSkeleton,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Container(
                    width: 80.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textSkeleton,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
              ],
            ),
          ),
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).baseSkeleton,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Container(
                    width: 80.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textSkeleton,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation3']!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
