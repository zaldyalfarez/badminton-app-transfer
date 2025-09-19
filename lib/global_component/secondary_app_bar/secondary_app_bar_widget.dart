import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secondary_app_bar_model.dart';
export 'secondary_app_bar_model.dart';

class SecondaryAppBarWidget extends StatefulWidget {
  const SecondaryAppBarWidget({
    super.key,
    String? appbarTitle,
    bool? isBackEnable,
  })  : this.appbarTitle = appbarTitle ?? 'AppBarTitle',
        this.isBackEnable = isBackEnable ?? true;

  final String appbarTitle;
  final bool isBackEnable;

  @override
  State<SecondaryAppBarWidget> createState() => _SecondaryAppBarWidgetState();
}

class _SecondaryAppBarWidgetState extends State<SecondaryAppBarWidget> {
  late SecondaryAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondaryAppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 275.0,
                decoration: BoxDecoration(),
                child: Text(
                  widget!.appbarTitle,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ),
            if (widget!.isBackEnable)
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
