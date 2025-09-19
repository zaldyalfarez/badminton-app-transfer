import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'statistic_card_model.dart';
export 'statistic_card_model.dart';

class StatisticCardWidget extends StatefulWidget {
  const StatisticCardWidget({
    super.key,
    required this.judulUjian,
    required this.ujianId,
  });

  final String? judulUjian;
  final int? ujianId;

  @override
  State<StatisticCardWidget> createState() => _StatisticCardWidgetState();
}

class _StatisticCardWidgetState extends State<StatisticCardWidget> {
  late StatisticCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          StatisticDetailWidget.routeName,
          queryParameters: {
            'ujianId': serializeParam(
              widget!.ujianId,
              ParamType.int,
            ),
            'ujianTitle': serializeParam(
              widget!.judulUjian,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 140.0,
        decoration: BoxDecoration(
          color: functions.getRandomCardColor(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    functions.getRandomThumbnailStatistic()!,
                    width: 110.0,
                    height: 110.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      width: 110.0,
                      height: 110.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 70.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget!.judulUjian,
                            'judulUjian',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
