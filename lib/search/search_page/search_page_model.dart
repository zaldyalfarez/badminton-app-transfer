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
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> dataLatihan = [];
  void addToDataLatihan(dynamic item) => dataLatihan.add(item);
  void removeFromDataLatihan(dynamic item) => dataLatihan.remove(item);
  void removeAtIndexFromDataLatihan(int index) => dataLatihan.removeAt(index);
  void insertAtIndexInDataLatihan(int index, dynamic item) =>
      dataLatihan.insert(index, item);
  void updateDataLatihanAtIndex(int index, Function(dynamic) updateFn) =>
      dataLatihan[index] = updateFn(dataLatihan[index]);

  String? searchName = 'null';

  String? searchCategory = 'null';

  String? passingParam;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (Start Ujian)] action in Container widget.
  ApiCallResponse? startUjianResponse;
  // Model for isEmpty component.
  late IsEmptyModel isEmptyModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    isEmptyModel = createModel(context, () => IsEmptyModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    isEmptyModel.dispose();
    navigationBarModel.dispose();
  }
}
