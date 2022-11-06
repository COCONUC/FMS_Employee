
import 'package:flutter/material.dart';
import 'package:fms_employee/screens/staff_home_page.dart';

class NavScreen extends StatefulWidget {
  static const String routeName = '/actual-home';
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 0;
  List<Widget> tabPages = [
    const StaffHomePage(),
    const Center(),
    const Center(),
  ];

  void updatePage(int page) {
    setState(() {
      currentIndex = page;
    });
  }
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: tabPages[currentIndex],
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.calendar_month, 1),
          buildNavBarItem(Icons.person, 2),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == currentIndex
            ? BoxDecoration(
            border: const Border(
              bottom: BorderSide(width: 3, color: Colors.orangeAccent),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.02),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ))
            : const BoxDecoration(),
        child: Icon(
          icon,
          size: index == currentIndex ? 36 : 26,
          color: index == currentIndex ? Colors.redAccent : Colors.white,
        ),
      ),
    );
  }
} //end class _Nav
