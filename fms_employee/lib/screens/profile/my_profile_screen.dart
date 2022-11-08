import 'package:flutter/material.dart';
import 'package:fms_employee/constants/color_constant.dart';
import 'package:fms_employee/constants/constant.dart';
import 'package:fms_employee/constants/resizer/fetch_pixels.dart';
import 'package:fms_employee/constants/widget_utils.dart';
import 'package:fms_employee/screens/tab_profile.dart';

class MyProfileScreen extends StatefulWidget {
  static const String routeName = '/my-profile_screen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    Widget defVerSpaceSet = getVerSpace(FetchPixels.getPixelHeight(20));
    Widget defDividerSet = getDivider(dividerColor, 0, 1);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          /*bottomNavigationBar: editProfileButton(context),*/
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getDefaultHorSpace(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(FetchPixels.getPixelHeight(20)),
                  buildHeader(context),
                  buildExpandList(context, defVerSpaceSet, defDividerSet)
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        });
  }

  Widget buildHeader(BuildContext context) {
    return gettoolbarMenu(context, "back.svg", () {
      Constant.backToPrev(context);
    },
        istext: true,
        title: "Thông Tin Cá Nhân",
        weight: FontWeight.w900,
        fontsize: 24,
        textColor: Colors.black);
  }

  Expanded buildExpandList(
      BuildContext context, Widget defVerSpaceSet, Widget defDividerSet) {
    return Expanded(
      flex: 1,
      child: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          getVerSpace(FetchPixels.getPixelHeight(40)),
          profilePicture(context),
          getVerSpace(FetchPixels.getPixelHeight(40)),
          getCustomFont("Họ và Tên", 16, textColor, 1,
              fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(6)),
          getCustomFont(
            "Tên thợ",
            16,
            Colors.black,
            1,
            fontWeight: FontWeight.w400,
          ),
          defVerSpaceSet,
          defDividerSet,
          defVerSpaceSet,
          getCustomFont("Email", 16, textColor, 1, fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(6)),
          getCustomFont(
            "sample@gmail.com",
            16,
            Colors.black,
            1,
            fontWeight: FontWeight.w400,
          ),
          defVerSpaceSet,
          defDividerSet,
          defVerSpaceSet,
          getCustomFont("Số điện thoại", 16, textColor, 1,
              fontWeight: FontWeight.w400),
          getVerSpace(FetchPixels.getPixelHeight(6)),
          getCustomFont(
            "095 630 1013",
            16,
            Colors.black,
            1,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Align profilePicture(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: FetchPixels.getPixelHeight(100),
        width: FetchPixels.getPixelHeight(100),
        decoration: BoxDecoration(
          image: getDecorationAssetImage(context, "profile.png"),
        ),
      ),
    );
  }

 /* Container editProfileButton(BuildContext context) {
    return Container(
      color: backGroundColor,
      padding: EdgeInsets.only(
          left: FetchPixels.getPixelWidth(20),
          right: FetchPixels.getPixelWidth(20),
          bottom: FetchPixels.getPixelHeight(30)),
      child: getButton(context, blueColor, "Edit Profile", Colors.white, () {
        Constant.sendToNext(context, Routes.editProfileScreenRoute);
      }, 18,
          weight: FontWeight.w600,
          buttonHeight: FetchPixels.getPixelHeight(60),
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(14))),
    );
  }*/
}
