import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_schedule_button_model.dart';
export 'add_schedule_button_model.dart';

class AddScheduleButtonWidget extends StatefulWidget {
  const AddScheduleButtonWidget({super.key});

  @override
  State<AddScheduleButtonWidget> createState() =>
      _AddScheduleButtonWidgetState();
}

class _AddScheduleButtonWidgetState extends State<AddScheduleButtonWidget> {
  late AddScheduleButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddScheduleButtonModel());
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
      child: FFButtonWidget(
        onPressed: () async {
          context.pushNamed(BookingPageWidget.routeName);
        },
        text: 'Buat Janji',
        options: FFButtonOptions(
          width: 150.0,
          height: 50.0,
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).buttonPrimary,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.raleway(
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: Colors.white,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
