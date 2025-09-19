import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_profile_model.dart';
export 'change_profile_model.dart';

class ChangeProfileWidget extends StatefulWidget {
  const ChangeProfileWidget({super.key});

  static String routeName = 'ChangeProfile';
  static String routePath = 'changeProfile';

  @override
  State<ChangeProfileWidget> createState() => _ChangeProfileWidgetState();
}

class _ChangeProfileWidgetState extends State<ChangeProfileWidget> {
  late ChangeProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeProfileModel());

    // set default value langsung
    _model.textController1 ??=
        TextEditingController(text: FFAppState().currentUser.name);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: FFAppState().currentUser.email);
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.secondaryAppBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SecondaryAppBarWidget(
                    appbarTitle: 'Ubah Profil',
                    isBackEnable: true,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia = await selectMedia(
                                maxWidth: 1080.00,
                                maxHeight: 1080.00,
                                imageQuality: 100,
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_changeProfilePhoto = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_changeProfilePhoto =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_changeProfilePhoto =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              _model.changePhotoResponse =
                                  await UpdateProfileImageCall.call(
                                jwt: currentAuthenticationToken,
                                userId: FFAppState().currentUser.id,
                                image:
                                    _model.uploadedLocalFile_changeProfilePhoto,
                              );

                              if ((_model.changePhotoResponse?.succeeded ??
                                  false)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Berhasil mengubah foto',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.raleway(),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).success,
                                  ),
                                );
                                // update foto dengan cache-buster
                                FFAppState().updateCurrentUserStruct(
                                  (e) => e
                                    ..image = functions
                                            .buildPhotoProfileUrl(getJsonField(
                                              (_model.changePhotoResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.image''',
                                            ).toString())
                                            .toString() +
                                        '?v=${DateTime.now().millisecondsSinceEpoch}',
                                );
                                FFAppState().update(() {});
                              } else {
                                debugPrint(
                                    "Change photo error: ${_model.changePhotoResponse?.jsonBody}");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Gagal mengunggah foto',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.raleway(),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            child: Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: const BoxDecoration(),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      height: 200.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        functions.profilImage(
                                            FFAppState().currentUser.image)!,
                                        key: ValueKey(
                                            FFAppState().currentUser.image),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Color(0xA2FFFFFF),
                                      size: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 275.0,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text('Nama Lengkap',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Raleway',
                                          )),
                                    ),
                                    SizedBox(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Masukkan nama lengkap',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.raleway(),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: (val) {
                                          if (val == null ||
                                              val.trim().isEmpty) {
                                            return 'Nama tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 10.0))
                                      .addToEnd(const SizedBox(height: 25.0)),
                                ),
                              ),
                              Container(
                                width: 275.0,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text('Email',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Raleway',
                                          )),
                                    ),
                                    SizedBox(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model.textController2,
                                        focusNode: _model.textFieldFocusNode2,
                                        autofocus: false,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.raleway(),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 10.0))
                                      .addToEnd(const SizedBox(height: 25.0)),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (!_model.formKey.currentState!
                                      .validate()) {
                                    return;
                                  }

                                  _model.changeNameResponse =
                                      await UpdateProfileNameCall.call(
                                    name: _model.textController1.text.trim(),
                                    jwt: currentAuthenticationToken,
                                    userId: FFAppState().currentUser.id,
                                  );

                                  if ((_model.changeNameResponse?.succeeded ??
                                      false)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Berhasil menyimpan perubahan',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.raleway(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    );
                                    FFAppState().updateCurrentUserStruct(
                                      (e) => e
                                        ..name = getJsonField(
                                          (_model.changeNameResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.name''',
                                        ).toString(),
                                    );
                                    FFAppState().update(() {});

                                    context
                                        .pushNamed(ProfilePageWidget.routeName);
                                  } else {
                                    debugPrint(
                                        "Change name error: ${_model.changeNameResponse?.jsonBody}");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Gagal mengganti nama',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.raleway(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Simpan Perubahan',
                                options: FFButtonOptions(
                                  width: 275.0,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .buttonPrimary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.raleway(),
                                        color: Colors.white,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 25.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
