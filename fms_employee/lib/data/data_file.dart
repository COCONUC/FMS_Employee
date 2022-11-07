import 'package:fms_employee/models/model_booking.dart';


class DataFile {

  static List<ModelBooking> bookingList = [
    ModelBooking("Cleaning", "Today, 11:00 am", "booking_owner.png",
        "Mendy Wilson", "Approved", "Today"),
    ModelBooking("Cleaning", "Today, 08:00 am", "booking_owner1.png",
        "Jenny Winget", "Approved", "Today"),
    ModelBooking("Cleaning", "Today, 07:00 am", "booking_owner2.png",
        "Jacob Jones", "Approved", "Today"),
    ModelBooking("Cleaning", "Yesterday, 06:00 am", "booking_owner3.png",
        "Ronald Richards", "Approved", "Yesterday")
  ];

}
