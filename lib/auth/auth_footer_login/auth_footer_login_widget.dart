import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_footer_login_model.dart';
export 'auth_footer_login_model.dart';

class AuthFooterLoginWidget extends StatefulWidget {
  const AuthFooterLoginWidget({super.key});

  @override
  State<AuthFooterLoginWidget> createState() => _AuthFooterLoginWidgetState();
}

class _AuthFooterLoginWidgetState extends State<AuthFooterLoginWidget> {
  late AuthFooterLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthFooterLoginModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah mempunyai akun?',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(LoginPageWidget.routeName);
                },
                child: Text(
                  'Masuk',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(LoginPageWidget.routeName);
                },
                child: Icon(
                  Icons.chevron_right,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
