import 'package:flutter/material.dart';
import 'package:my_monthly_salary/feature/grafik_screen/screens/grafic_page.dart';
import 'package:my_monthly_salary/feature/salary_input/screens/salary_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  int pageNumber = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          
            pageNumber = value;
            pageController.jumpToPage(value);
         setState(() {
           
         });
        },
        currentIndex: pageNumber,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money_sharp,
              ),
              label: "")
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          pageNumber = index;
         
        },
        controller: pageController,
        children: const [GraficPage(), SalaryPage()],
      ),
    );
  }
}
