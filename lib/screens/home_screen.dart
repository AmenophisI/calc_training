import 'package:flutter/material.dart';

import '../test_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<int>> _menuItems = [];
  int _numberOfQuestions = 0;

  @override
  void initState() {
    super.initState();
    setMenuItems();
    _numberOfQuestions = _menuItems[0].value!;
  }

  void setMenuItems() {
    _menuItems.add(DropdownMenuItem(
      value: 10,
      child: Text(10.toString()),
    ));
    _menuItems.add(DropdownMenuItem(
      value: 20,
      child: Text(20.toString()),
    ));
    _menuItems.add(DropdownMenuItem(
      value: 30,
      child: Text(30.toString()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/image_title.png"),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "問題数を選択して「スタート」ボタンを押して下さい",
                  style: TextStyle(fontSize: 12.0),
                ),
                SizedBox(
                  height: 50.0,
                ),
                DropdownButton(
                    items: _menuItems,
                    value: _numberOfQuestions,
                    onChanged: (int? selectedValue) {
                      setState(() {
                        _numberOfQuestions = selectedValue!;
                      });
                    }),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        label: Text("スタート"),
                        icon: Icon(Icons.skip_next),
                        onPressed: () => startTestScreen(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeDropdownItem(int value) {
    setState(() {
      _numberOfQuestions = value;
    });
  }

  startTestScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestScreen(
                  numberOfQuestions: _numberOfQuestions,
                )));
  }
}
