import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'is_empty_model.dart';
export 'is_empty_model.dart';

class IsEmptyWidget extends StatefulWidget {
  const IsEmptyWidget({
    super.key,
    String? isEmptyMessage,
  }) : this.isEmptyMessage = isEmptyMessage ?? 'Data Kosong';

  final String isEmptyMessage;

  @override
  State<IsEmptyWidget> createState() => _IsEmptyWidgetState();
}

class _IsEmptyWidgetState extends State<IsEmptyWidget> {
  late IsEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IsEmptyModel());
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
      child: Text(
        widget!.isEmptyMessage,
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.raleway(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
