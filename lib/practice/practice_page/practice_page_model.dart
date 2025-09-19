import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/global_component/secondary_app_bar/secondary_app_bar_widget.dart';
import '/loading_state/practice_page_loading/practice_page_loading_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'practice_page_widget.dart' show PracticePageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PracticePageModel extends FlutterFlowModel<PracticePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SecondaryAppBar component.
  late SecondaryAppBarModel secondaryAppBarModel;

  @override
  void initState(BuildContext context) {
    secondaryAppBarModel = createModel(context, () => SecondaryAppBarModel());
  }

  @override
  void dispose() {
    secondaryAppBarModel.dispose();
  }
}
