import '/booking/booking_card/booking_card_widget.dart';
import '/exam/ujian_card/ujian_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/category_tag/category_tag_widget.dart';
import '/global_component/navigation_bar/navigation_bar_widget.dart';
import '/global_component/primary_app_bar/primary_app_bar_widget.dart';
import '/practice/latihan_card/latihan_card_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PrimaryAppBar component.
  late PrimaryAppBarModel primaryAppBarModel;
  // Model for CategoryTag component.
  late CategoryTagModel categoryTagModel;
  // Model for LatihanCard component.
  late LatihanCardModel latihanCardModel;
  // Model for UjianCard component.
  late UjianCardModel ujianCardModel;
  // Model for BookingCard component.
  late BookingCardModel bookingCardModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    primaryAppBarModel = createModel(context, () => PrimaryAppBarModel());
    categoryTagModel = createModel(context, () => CategoryTagModel());
    latihanCardModel = createModel(context, () => LatihanCardModel());
    ujianCardModel = createModel(context, () => UjianCardModel());
    bookingCardModel = createModel(context, () => BookingCardModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    primaryAppBarModel.dispose();
    categoryTagModel.dispose();
    latihanCardModel.dispose();
    ujianCardModel.dispose();
    bookingCardModel.dispose();
    navigationBarModel.dispose();
  }
}
