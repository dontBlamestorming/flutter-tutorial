import 'package:flutter/material.dart';

class PracticeLayout extends StatefulWidget {
  const PracticeLayout({Key? key}) : super(key: key);

  @override
  _PracticeLayoutState createState() => _PracticeLayoutState();
}

class _PracticeLayoutState extends State<PracticeLayout> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLastestValue);
  }

  @override
  void dispose() {
    // 화면이 종료될 때 위젯 트리에서 컨트롤러를 해제
    myController.dispose();
    super.dispose();
  }

  _printLastestValue() {
    print("두 번째 text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              print("첫 번째 text field: $text");
            },
          ),
          TextField(
            controller: myController,
          )
        ],
      ),
    );
  }
}
