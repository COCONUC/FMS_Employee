import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fms_employee/data/data_file.dart';
import 'package:fms_employee/features/order_service.dart';
import 'package:fms_employee/models/model_booking.dart';
import 'package:fms_employee/models/order_data.dart';
import 'package:fms_employee/screens/booking_detail.dart';
import 'package:fms_employee/constants/color_constant.dart';
import 'package:fms_employee/constants/constant.dart';
import 'package:fms_employee/constants/pref_data.dart';
import 'package:fms_employee/constants/resizer/fetch_pixels.dart';
import 'package:fms_employee/constants/widget_utils.dart';
import 'package:fms_employee/data/data_file.dart';

class TabBooking extends StatefulWidget {
  static const String routeName = '/tab_booking';
  const TabBooking({Key? key}) : super(key: key);

  @override
  State<TabBooking> createState() => _TabBookingState();
}

class _TabBookingState extends State<TabBooking> {
  List<OrderData> bookingLists = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return SafeArea(
      child: Column(
        children: [
          getVerSpace(FetchPixels.getPixelHeight(16)),
          buildTopRow(context),
          Expanded(
            flex: 1,
            child: bookingList(),
          )
        ],
      ),
    );
  }

  Widget buildTopRow(BuildContext context) {
    return getPaddingWidget(
      EdgeInsets.symmetric(horizontal: FetchPixels.getDefaultHorSpace(context)),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: FetchPixels.getPixelHeight(46),
            width: FetchPixels.getPixelHeight(46),
            decoration: BoxDecoration(
                image: getDecorationAssetImage(context, "profile.png")),
          ),
          getHorSpace(FetchPixels.getPixelWidth(12)),
          Expanded(
            flex: 1,
            child: getCustomFont("Tên Nhân Viên", 16, Colors.black, 1,
                fontWeight: FontWeight.w400),
          ),
          getSvgImage("more.svg",
              height: FetchPixels.getPixelHeight(24),
              width: FetchPixels.getPixelHeight(24))
        ],
      ),
    );
  }

  Widget nullListView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getSvgImage("booking_null.svg",
            height: FetchPixels.getPixelHeight(124),
            width: FetchPixels.getPixelHeight(84.77)),
        getVerSpace(FetchPixels.getPixelHeight(30)),
        getCustomFont("Chưa Có Đơn!", 20, Colors.black, 1,
            fontWeight: FontWeight.w900, textAlign: TextAlign.center)
      ],
    );
  }

  Future<List<OrderData>> getFutureService() async {
    bookingLists = await OrderServices().getOrderListForStaff(2);
    return bookingLists;
  }

  Widget bookingList() {
    return FutureBuilder<List<OrderData>> (
      future: getFutureService(),
      builder: (context, snapshot){
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return snapshot.data!.isNotEmpty?
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: FetchPixels.getPixelHeight(20)),
            shrinkWrap: true,
            primary: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  dateHeader(snapshot.data![index], index),
                  getVerSpace(FetchPixels.getPixelHeight(10)),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: FetchPixels.getPixelHeight(20),
                          left: FetchPixels.getDefaultHorSpace(context),
                          right: FetchPixels.getDefaultHorSpace(context)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0.0, 4.0)),
                          ],
                          borderRadius:
                          BorderRadius.circular(FetchPixels.getPixelHeight(12))),
                      padding: EdgeInsets.symmetric(
                          horizontal: FetchPixels.getPixelWidth(16),
                          vertical: FetchPixels.getPixelHeight(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: getCustomFont(snapshot.data![index].orderId.toString() ?? "",
                                    16, Colors.black, 1,
                                    fontWeight: FontWeight.w900),
                              ),
                              getSvgImage("check_complete.svg",
                                  width: FetchPixels.getPixelHeight(24),
                                  height: FetchPixels.getPixelHeight(24)),
                              getHorSpace(FetchPixels.getPixelWidth(6)),
                              getCustomFont(
                                "Đã nhận",
                                16,
                                success,
                                1,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(6)),
                          getCustomFont(snapshot.data![index].createAssignAt ?? "", 14, textColor, 1,
                              fontWeight: FontWeight.w400),
                          getVerSpace(FetchPixels.getPixelHeight(20)),
                          getDivider(dividerColor, 0, 1),
                          getVerSpace(FetchPixels.getPixelHeight(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: snapshot.data![index].managerId ?? "",
                                child: Container(
                                  height: FetchPixels.getPixelHeight(42),
                                  width: FetchPixels.getPixelHeight(42),
                                  decoration: BoxDecoration(
                                      image: getDecorationAssetImage(
                                          context, "booking_owner1.png" ?? "")),
                                ),
                              ),
                              getHorSpace(FetchPixels.getPixelWidth(9)),
                              Expanded(
                                flex: 1,
                                child: getCustomFont(
                                  snapshot.data![index].managerId.toString() ?? "",
                                  16,
                                  Colors.black,
                                  1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              getSvgImage("call_icon.svg",height:FetchPixels.getPixelHeight(42),width: FetchPixels.getPixelHeight(42) ),
                              // Container(
                              //   height: FetchPixels.getPixelHeight(42),
                              //   width: FetchPixels.getPixelHeight(42),
                              //   decoration: BoxDecoration(
                              //       image: getDecorationAssetImage(
                              //           context, "round_chat.png")),
                              // ),
                              getHorSpace(FetchPixels.getPixelWidth(12)),
                              getSvgImage("chat_icon.svg",height:FetchPixels.getPixelHeight(42),width: FetchPixels.getPixelHeight(42) )

                              // Container(
                              //   height: FetchPixels.getPixelHeight(42),
                              //   width: FetchPixels.getPixelHeight(42),
                              //   decoration: BoxDecoration(
                              //       image: getDecorationAssetImage(
                              //           context, "call_bg.png")),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      PrefData.setDefIndex(index);
                      Constant.sendToScreen(
                          BookingDetail("booking_owner1.png"?? "", snapshot.data![index].orderId!), context);
                    },
                  )
                ],
              );
            },
          ): nullListView();
        }
      }
    );
  }

  Widget dateHeader(OrderData modelBooking, int index) {
    return getPaddingWidget(
        EdgeInsets.symmetric(
            horizontal: FetchPixels.getDefaultHorSpace(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            index == 0
                ? getCustomFont("Đơn Hàng", 16, Colors.black, 1,
                    fontWeight: FontWeight.w900)
                : Container(),
            if (index == 0)
              getCustomFont(
                modelBooking.createAssignAt?.substring(0,10) ?? "",
                16,
                Colors.black,
                1,
                fontWeight: FontWeight.w400,
              )
            else if (bookingLists[index - 1].createAssignAt?.substring(0,10) == bookingLists[index].createAssignAt?.substring(0,10))
              Container()
            else
              getCustomFont(
                modelBooking.createAssignAt?.substring(0,10) ?? "",
                14,
                textColor,
                1,
                fontWeight: FontWeight.w400,
              )
          ],
        ));
  }

}
