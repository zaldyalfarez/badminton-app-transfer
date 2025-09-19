import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/navigation_bar/navigation_bar_widget.dart';
import '/global_component/primary_app_bar/primary_app_bar_widget.dart';
import '/notification/notification_card/notification_card_widget.dart';
import 'dart:ui';
import 'notification_page_widget.dart' show NotificationPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationPageModel extends FlutterFlowModel<NotificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PrimaryAppBar component.
  late PrimaryAppBarModel primaryAppBarModel;
  // Model for NotificationCard component.
  late NotificationCardModel notificationCardModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    primaryAppBarModel = createModel(context, () => PrimaryAppBarModel());
    notificationCardModel = createModel(context, () => NotificationCardModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    primaryAppBarModel.dispose();
    notificationCardModel.dispose();
    navigationBarModel.dispose();
  }
}
