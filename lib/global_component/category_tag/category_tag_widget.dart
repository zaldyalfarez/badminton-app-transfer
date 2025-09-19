import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_state/category_tag_loading/category_tag_loading_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_tag_model.dart';
export 'category_tag_model.dart';

class CategoryTagWidget extends StatefulWidget {
  const CategoryTagWidget({super.key});

  @override
  State<CategoryTagWidget> createState() => _CategoryTagWidgetState();
}

class _CategoryTagWidgetState extends State<CategoryTagWidget> {
  late CategoryTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryTagModel());
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: FutureBuilder<ApiCallResponse>(
          future: GetKategoriCall.call(
            jwt: currentAuthenticationToken,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return CategoryTagLoadingWidget();
            }
            final wrapGetKategoriResponse = snapshot.data!;

            return Builder(
              builder: (context) {
                final kategori = getJsonField(
                  wrapGetKategoriResponse.jsonBody,
                  r'''$.data''',
                ).toList();

                return Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: List.generate(kategori.length, (kategoriIndex) {
                    final kategoriItem = kategori[kategoriIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          SearchPageWidget.routeName,
                          queryParameters: {
                            'passingFilter': serializeParam(
                              getJsonField(
                                kategoriItem,
                                r'''$.kategori''',
                              ).toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 5.0, 8.0, 5.0),
                          child: Text(
                            getJsonField(
                              kategoriItem,
                              r'''$.kategori''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
