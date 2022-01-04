// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final dummyItems = [
  'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
];

void main() => runApp(const TutorialApps());

class TutorialApps extends StatelessWidget {
  const TutorialApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home Page"),
      ),
    );
  }
}

class PracticeUIApp extends StatefulWidget {
  const PracticeUIApp({Key? key}) : super(key: key);

  @override
  _PracticeUIAppPageState createState() => _PracticeUIAppPageState();
}

class _PracticeUIAppPageState extends State<PracticeUIApp> {
  var _index = 0;
  // var _pages = [
  //   Page1(),
  //   Page2(),
  //   Page3(),
  // ];
  final _pages = [
    // what's diff with above code

    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.black),
          )
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "복잡한 UI",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '이용서비스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '내 정보',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  // Q - 왜 string도 const를 붙어야 하는지? list, map, set 자료형이 아닌데?
  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print("버튼슈 클릭!");
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text("택시"),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text("블랙"),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text("바이크"),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text("대리"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text("택시"),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text("블랙"),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text("바이크"),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: [
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text("대리"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
      ), // 높이
      items: dummyItems.map((url) {
        // 다섯개의 카드
        return Builder(
          builder: (BuildContext context) {
            // context를 사용하고자 할 때
            return Container(
              width: MediaQuery.of(context).size.width, // 기기의 가로 길이
              margin: EdgeInsets.symmetric(horizontal: 5.0), // 각 카드별 좌우 여백
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(url, fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (index) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항입니다.'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '이용 서비스',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '내 정보',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
