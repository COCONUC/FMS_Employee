import 'package:fms_employee/models/model_booking.dart';


class DataFile {

  static List<ModelBooking> bookingList = [
    ModelBooking("Vệ sinh sopha", "Hôm nay, 11:00 am", "booking_owner.png",
        "Tên khách hàng", "Approved", "Hôm Nay"),
    ModelBooking("Vệ sinh sopha", "Hôm nay, 08:00 am", "booking_owner1.png",
        "Tên khách hàng", "Approved", "Hôm Nay"),
    ModelBooking("Vệ sinh sopha", "Hôm nay, 07:00 am", "booking_owner2.png",
        "Tên khách hàng", "Approved", "Hôm Nay"),
    ModelBooking("Vệ sinh sopha", "ngày/tháng/năm, 06:00 am", "booking_owner3.png",
        "Tên khách hàng", "Approved", "1 Ngày Trước")
  ];

}
