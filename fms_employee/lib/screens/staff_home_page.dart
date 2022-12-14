import 'package:flutter/material.dart';
import 'package:fms_employee/constants/color_constant.dart';
import 'package:fms_employee/screens/login_screen.dart';
import 'package:fms_employee/widgets/custom_button.dart';


class StaffHomePage extends StatefulWidget {
  static const String routeName = '/staff_home_page';
  const StaffHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  int _selectedItemIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "FMS",
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      //--------------------Body------
      body: Container(
        decoration: const BoxDecoration(color: mBackgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Xin chào!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            //Button Xem lịch hẹn
            Container(
              width: 80,
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                  text: 'Xem lịch hẹn tiếp nhận',
                  onTap: () {

                  }),
            ),
            //Button Đăng ký lịch làm việc
            Container(
              width: 80,
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                  text: 'Quản lí lịch làm việc cá nhân',
                  onTap: () {

                  }),
            ),
            //Button lịch sử cuộc hẹn
            Container(
              width: 80,
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(text: 'Đơn đã hoàn thành',
                  onTap: () {

                  }),
            ),

            Container(
              width: 80,
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                  text: 'Thông tin người dùng',
                  onTap: () {

                  }),
            ),
            Container(
              width: 80,
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                  text: 'Logout',
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  }),
            ),
          ],
        ),
      ),

    );
  }


}

// import 'package:flutter/material.dart';

// class StaffRegistWork extends StatefulWidget {
//   static const String routeName = '/staff_regist_work';
//   const StaffRegistWork({Key? key}) : super(key: key);
//   @override
//   _StaffRegistWorkState createState() => _StaffRegistWorkState();
// }

// class _StaffRegistWorkState extends State<StaffRegistWork> {
//   int _selectedItemIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Bottom Navigation----------------
//       bottomNavigationBar: Row(
//         children: <Widget>[
//           buildNavBarItem(Icons.home, 0),
//           buildNavBarItem(Icons.list_alt, 1),
//           buildNavBarItem(Icons.notifications, 2),
//           buildNavBarItem(Icons.person, 3)
//         ],
//       ),
//       // This is Background Color
//     );
//   }

//   Widget buildNavBarItem(IconData icon, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedItemIndex = index;
//         });
//       },
//       child: Container(
//         height: 60,
//         width: MediaQuery.of(context).size.width / 4,
//         decoration: index == _selectedItemIndex
//             ? BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(width: 4, color: Colors.orangeAccent),
//                 ),
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.white.withOpacity(0.3),
//                     Colors.white.withOpacity(0.015),
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ))
//             : BoxDecoration(),
//         child: Icon(
//           icon,
//           color: index == _selectedItemIndex ? Colors.redAccent : Colors.white,
//         ),
//       ),
//     );
//   }
// }

