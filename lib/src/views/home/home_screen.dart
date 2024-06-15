import 'package:flutter/material.dart';
import 'package:pray_for_me/src/views/prayers/prayers_view.dart';
import '../../global_widgets/p4m_playground/page_animations/animated_line_single.dart';
import '../../global_widgets/p4m_playground/page_animations/animated_underline_multi.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMainCategorySelected = false;
  bool _isPrayersSelected = false;

  final List<String> subCatagoriesTest = [
    'Sustainable Development',
    'Ethical AI Intergration',
    'Global Connectivity',
  ];
  int _selectedCategoryIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'home2screen',
      appBar: AppBar(title: const Text('Category: Technochratic Ideals')),
      body: Column(
        children: [const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMainCategorySelected = !_isMainCategorySelected;
                });
              },
              child: AnimatedUnderSingle(
                text: 'Technocratic Ideals',
                isSelected: _isMainCategorySelected,
                textColor: Colors.black,
                underlineColor: Colors.blue,
                fontSize: 32.0,
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: AnimatedUnderlineList(
              categories: subCatagoriesTest,
              selectedIndex: _selectedCategoryIndex,
              onCategorySelected: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
          ),          const Spacer(),const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPrayersSelected = !_isPrayersSelected;
                  Navigator.restorablePushNamed(
                  context,
                  PrayerPage.routeName,
                );
                });
              },
              child: AnimatedUnderSingle(
                text: 'Visit GPT Prayer Page :)',
                isSelected: _isMainCategorySelected,
                textColor: Colors.black,
                underlineColor: Colors.blue,
                fontSize: 32.0,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
