import 'package:flutter/material.dart';
import 'package:fms_employee/data/data_file.dart';
import 'package:fms_employee/models/model_booking.dart';
import 'package:fms_employee/constants/pref_data.dart';
import 'package:fms_employee/constants/resizer/fetch_pixels.dart';
import 'package:fms_employee/constants/widget_utils.dart';
import 'package:fms_employee/constants/color_constant.dart';
import 'package:fms_employee/constants/constant.dart';

class BookingDetail extends StatefulWidget {
  final String img;

  const BookingDetail(this.img, {Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  getPrefData() async {
    index = await PrefData.getDefIndex();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPrefData();
  }

  List<ModelBooking> bookingLists = DataFile.bookingList;
  var index = 0;

  @override
  Widget build(BuildContext context) {
    ModelBooking modelBooking = bookingLists[index];

    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          bottomNavigationBar: buttons(context),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getDefaultHorSpace(context)),
              child: buildBookingDetail(context, modelBooking),
            ),
          ),
        ),
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        });
  }

  Column buildBookingDetail(BuildContext context, ModelBooking modelBooking) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getVerSpace(FetchPixels.getPixelHeight(20)),
        gettoolbarMenu(context, "back.svg", () {
          Constant.backToPrev(context);
        },
            title: "Mã Đơn 26556",
            weight: FontWeight.w900,
            istext: true,
            textColor: Colors.black,
            fontsize: 24),
        getVerSpace(FetchPixels.getPixelHeight(40)),
        Expanded(
          flex: 1,
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: widget.img,
                  child: Container(
                    height: FetchPixels.getPixelHeight(100),
                    width: FetchPixels.getPixelHeight(100),
                    decoration: BoxDecoration(
                        image: getDecorationAssetImage(context, widget.img)),
                  ),
                ),
              ),
              getVerSpace(FetchPixels.getPixelHeight(40)),
              getCustomFont("Tên Khách Hàng:", 16, textColor, 1,
                  fontWeight: FontWeight.w400),
              getVerSpace(FetchPixels.getPixelHeight(6)),
              getCustomFont(
                modelBooking.providerName ?? "",
                16,
                Colors.black,
                1,
                fontWeight: FontWeight.w400,
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getDivider(dividerColor, 0, 1),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getCustomFont("Địa Chỉ:", 16, textColor, 1,
                  fontWeight: FontWeight.w400),
              getVerSpace(FetchPixels.getPixelHeight(6)),
              getCustomFont(
                "1, Phan Xích Long, Q. Phú Nhuận, Tp HCM",
                16,
                Colors.black,
                1,
                fontWeight: FontWeight.w400,
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getDivider(dividerColor, 0, 1),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getCustomFont("Dịch Vụ", 16, textColor, 1,
                  fontWeight: FontWeight.w400),
              getVerSpace(FetchPixels.getPixelHeight(6)),
              getCustomFont(
                modelBooking.serviceName ?? "",
                16,
                Colors.black,
                1,
                fontWeight: FontWeight.w400,
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getDivider(dividerColor, 0, 1),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getCustomFont("Ngày & Giờ", 16, textColor, 1,
                  fontWeight: FontWeight.w400),
              getVerSpace(FetchPixels.getPixelHeight(6)),
              getCustomFont(
                modelBooking.date ?? '',
                16,
                Colors.black,
                1,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buttons(BuildContext context) {
    return Container(
      color: backGroundColor,
      padding: EdgeInsets.only(
          left: FetchPixels.getPixelWidth(20),
          right: FetchPixels.getPixelWidth(20),
          bottom: FetchPixels.getPixelHeight(30)),
      child: Row(
        children: [
          Expanded(
              child: getButton(context, backGroundColor, "Trở Về", blueColor,
                  () {
            Constant.backToPrev(context);
          }, 18,
                  weight: FontWeight.w600,
                  buttonHeight: FetchPixels.getPixelHeight(60),
                  borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(14)),
                  borderColor: blueColor,
                  isBorder: true,
                  borderWidth: 1.5)),
          getHorSpace(FetchPixels.getPixelWidth(20)),
          Expanded(
              child: getButton(context, blueColor, "Bắt Đầu", Colors.white, () {
            // addressList.removeAt(selection!.getInt("index")!);
            // setState(() {});
            Constant.backToPrev(context);
          }, 18,
                  weight: FontWeight.w600,
                  buttonHeight: FetchPixels.getPixelHeight(60),
                  borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(14)))),
        ],
      ),
    );
  }
}
