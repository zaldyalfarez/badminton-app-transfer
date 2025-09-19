import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/global_component/is_empty/is_empty_widget.dart';
import '/global_component/navigation_bar/navigation_bar_widget.dart';
import '/loading_state/category_tag_loading/category_tag_loading_widget.dart';
import '/loading_state/search_card_loading/search_card_loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({
    super.key,
    String? passingFilter,
  }) : this.passingFilter = passingFilter ?? 'null';

  final String passingFilter;

  static String routeName = 'SearchPage';
  static String routePath = 'searchPage';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.passingParam = widget!.passingFilter;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        175.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                _model.searchName = _model.textController.text;
                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Cari latihan',
                                hintStyle: FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 32.0,
                                ),
                              ),
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Kategori',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    if ((_model.searchName != 'null') ||
                                        (_model.searchCategory != 'null') ||
                                        (_model.searchName == null ||
                                            _model.searchName == ''))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                SearchPageWidget.routeName);
                                          },
                                          child: Text(
                                            'Hapus Filter',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Wrap(
                                      spacing: 8.0,
                                      runSpacing: 10.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: GetKategoriCall.call(
                                              jwt: currentAuthenticationToken,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return CategoryTagLoadingWidget();
                                              }
                                              final choiceChipsGetKategoriResponse =
                                                  snapshot.data!;

                                              return FlutterFlowChoiceChips(
                                                options: (getJsonField(
                                                  choiceChipsGetKategoriResponse
                                                      .jsonBody,
                                                  r'''$.data[:].kategori''',
                                                  true,
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!
                                                    .map((label) =>
                                                        ChipData(label))
                                                    .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() =>
                                                      _model.choiceChipsValue =
                                                          val?.firstOrNull);
                                                  _model.searchCategory =
                                                      _model.choiceChipsValue;
                                                  safeSetState(() {});
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.raleway(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .selected,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  iconColor: Color(0x00000000),
                                                  iconSize: 16.0,
                                                  elevation: 0.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .selected,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.raleway(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  iconColor: Color(0x00000000),
                                                  iconSize: 16.0,
                                                  elevation: 0.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                chipSpacing: 8.0,
                                                rowSpacing: 8.0,
                                                multiselect: false,
                                                initialized:
                                                    _model.choiceChipsValue !=
                                                        null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [_model.passingParam!],
                                                ),
                                                wrapped: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 15.0)),
                            ),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FutureBuilder<ApiCallResponse>(
                              future: GetSearchCall.call(
                                jwt: currentAuthenticationToken,
                                kategori: valueOrDefault<String>(
                                  _model.searchCategory,
                                  'null',
                                ),
                                nama: valueOrDefault<String>(
                                  _model.searchName,
                                  'null',
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: SearchCardLoadingWidget(),
                                  );
                                }
                                final listViewGetSearchResponse =
                                    snapshot.data!;

                                return ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    if (getJsonField(
                                          listViewGetSearchResponse.jsonBody,
                                          r'''$.data.latihan''',
                                        ) !=
                                        null)
                                      Builder(
                                        builder: (context) {
                                          final loopLatihanKategori = functions
                                                  .getUniqueCategories(
                                                      getJsonField(
                                                    listViewGetSearchResponse
                                                        .jsonBody,
                                                    r'''$.data.latihan''',
                                                  ))
                                                  ?.toList() ??
                                              [];

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                loopLatihanKategori.length,
                                                (loopLatihanKategoriIndex) {
                                              final loopLatihanKategoriItem =
                                                  loopLatihanKategori[
                                                      loopLatihanKategoriIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          loopLatihanKategoriItem
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .raleway(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 28.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final loopLatihanData =
                                                              GetSearchCall
                                                                      .dataLatihan(
                                                                    listViewGetSearchResponse
                                                                        .jsonBody,
                                                                  )?.toList() ??
                                                                  [];

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  loopLatihanData
                                                                      .length,
                                                                  (loopLatihanDataIndex) {
                                                                final loopLatihanDataItem =
                                                                    loopLatihanData[
                                                                        loopLatihanDataIndex];
                                                                return Visibility(
                                                                  visible:
                                                                      getJsonField(
                                                                            loopLatihanDataItem,
                                                                            r'''$.kategori''',
                                                                          ) ==
                                                                          loopLatihanKategoriItem,
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        PracticePageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'id':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              loopLatihanDataItem,
                                                                              r'''$.id''',
                                                                            ),
                                                                            ParamType.int,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: functions
                                                                            .getRandomCardColor(),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, 1.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  functions
                                                                                      .buildPracticeThumbnailUrl(getJsonField(
                                                                                        loopLatihanDataItem,
                                                                                        r'''$.thumbnail''',
                                                                                      ).toString())
                                                                                      .toString(),
                                                                                  width: 90.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    width: 90.0,
                                                                                    height: 90.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  loopLatihanDataItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.raleway(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 20.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            if (getJsonField(
                                                                              loopLatihanDataItem,
                                                                              r'''$.isCompleted''',
                                                                            ))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      borderRadius: BorderRadius.circular(50.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(6.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions.formatMenitToTimeString(getJsonField(
                                                                                            loopLatihanDataItem,
                                                                                            r'''$.durasi''',
                                                                                          )),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.raleway(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if (getJsonField(
                                                                                    loopLatihanDataItem,
                                                                                    r'''$.ar''',
                                                                                  ))
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        borderRadius: BorderRadius.circular(50.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(6.0),
                                                                                        child: Text(
                                                                                          'AR',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.raleway(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(
                                                                SizedBox(
                                                                    width:
                                                                        15.0),
                                                                filterFn:
                                                                    (loopLatihanDataIndex) {
                                                                  final loopLatihanDataItem =
                                                                      loopLatihanData[
                                                                          loopLatihanDataIndex];
                                                                  return getJsonField(
                                                                        loopLatihanDataItem,
                                                                        r'''$.kategori''',
                                                                      ) ==
                                                                      loopLatihanKategoriItem;
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).divide(SizedBox(height: 25.0)),
                                          );
                                        },
                                      ),
                                    if (getJsonField(
                                          listViewGetSearchResponse.jsonBody,
                                          r'''$.data.ujian''',
                                        ) !=
                                        null)
                                      Builder(
                                        builder: (context) {
                                          final loopUjianLevel = functions
                                                  .getUniqueLevel(getJsonField(
                                                    listViewGetSearchResponse
                                                        .jsonBody,
                                                    r'''$.data.ujian''',
                                                  ))
                                                  ?.toList() ??
                                              [];

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                loopUjianLevel.length,
                                                (loopUjianLevelIndex) {
                                              final loopUjianLevelItem =
                                                  loopUjianLevel[
                                                      loopUjianLevelIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Ujian',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .raleway(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        28.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              loopUjianLevelItem
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .raleway(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        28.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 7.0)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final loopUjianData =
                                                              GetSearchCall
                                                                      .dataUjian(
                                                                    listViewGetSearchResponse
                                                                        .jsonBody,
                                                                  )?.toList() ??
                                                                  [];

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  loopUjianData
                                                                      .length,
                                                                  (loopUjianDataIndex) {
                                                                final loopUjianDataItem =
                                                                    loopUjianData[
                                                                        loopUjianDataIndex];
                                                                return Visibility(
                                                                  visible:
                                                                      getJsonField(
                                                                            loopUjianDataItem,
                                                                            r'''$.level''',
                                                                          ) ==
                                                                          loopUjianLevelItem,
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ExamPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'ujianId':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              loopUjianDataItem,
                                                                              r'''$.id''',
                                                                            ),
                                                                            ParamType.int,
                                                                          ),
                                                                          'ujianName':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              loopUjianDataItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'ujianDurasi':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              loopUjianDataItem,
                                                                              r'''$.durasi''',
                                                                            ),
                                                                            ParamType.int,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      _model.startUjianResponse =
                                                                          await StartUjianCall
                                                                              .call(
                                                                        jwt:
                                                                            currentAuthenticationToken,
                                                                        ujianId:
                                                                            getJsonField(
                                                                          loopUjianDataItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                      );

                                                                      if ((_model
                                                                              .startUjianResponse
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        FFAppState().userUjianId =
                                                                            getJsonField(
                                                                          (_model.startUjianResponse?.jsonBody ??
                                                                              ''),
                                                                          r'''$.id''',
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: functions
                                                                            .getRandomCardColor(),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, 1.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  functions
                                                                                      .buildExamThumbnailUrl(getJsonField(
                                                                                        loopUjianDataItem,
                                                                                        r'''$.thumbnail''',
                                                                                      ).toString())
                                                                                      .toString(),
                                                                                  width: 90.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    width: 90.0,
                                                                                    height: 90.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  loopUjianDataItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.raleway(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 20.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      borderRadius: BorderRadius.circular(50.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(6.0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          loopUjianDataItem,
                                                                                          r'''$.level''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.raleway(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(
                                                                SizedBox(
                                                                    width:
                                                                        15.0),
                                                                filterFn:
                                                                    (loopUjianDataIndex) {
                                                                  final loopUjianDataItem =
                                                                      loopUjianData[
                                                                          loopUjianDataIndex];
                                                                  return getJsonField(
                                                                        loopUjianDataItem,
                                                                        r'''$.level''',
                                                                      ) ==
                                                                      loopUjianLevelItem;
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).divide(SizedBox(height: 25.0)),
                                          );
                                        },
                                      ),
                                    if ((getJsonField(
                                              listViewGetSearchResponse
                                                  .jsonBody,
                                              r'''$.data.latihan''',
                                            ) ==
                                            null) ||
                                        (getJsonField(
                                              listViewGetSearchResponse
                                                  .jsonBody,
                                              r'''$.data.ujian''',
                                            ) ==
                                            null))
                                      wrapWithModel(
                                        model: _model.isEmptyModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: IsEmptyWidget(),
                                      ),
                                  ].divide(SizedBox(height: 25.0)),
                                );
                              },
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 25.0)),
                    ),
                    wrapWithModel(
                      model: _model.navigationBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavigationBarWidget(
                        activePage: 'SearchPage',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
