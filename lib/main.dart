// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home_screen.dart';
import 'package:flutter_app/screen/more_screen.dart';
import 'package:flutter_app/widget/bottom_bar.dart';

void main() => runApp(MyApp());

// Myapp을 stateless widget
// stateful 위젯을 사용하는 이유 : 홈페이지를 사용하지 않는 방식을 하기 위해.
// 그래서 기본 파일을 다 지웠음


class MyApp extends StatefulWidget {
  // create state를 통해서 MyApp에 대한 상태를 관리 해주기로 하였음.
  _MyAppState createState() => _MyAppState();
}

// 그럼 이제 MyApp의 상태를 관리하는 _MyAppState를 클래스로 만들겠다.
class _MyAppState extends State<MyApp> {
  //// 10. 마지막으로 Tab contoroller를 전역으로 설정해주겠다.
  TabController controller;

  // override를 통해서 Widget build()함수를 만들거임

  @override
  Widget build(BuildContext context) {
    // 기보적으로 MaterialApp을 작성 해야함.
    return MaterialApp(
      title: 'Bbongflix',
      theme: ThemeData(
        // 넷플릭스 자체가 어두운 테마이므로 어두운 테마로 작성함.
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      // home 같은 경우는 DefaultTabController로 관리 해주어야함
      // lenth가 하단 tab 길이 (넷플릭스는 기본 5개로 되어있는데 4개로 하겠음)
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            // NeverScrollableScrollPhysics는 사용자가 직접 스크롤해서 옆으로 slide하는 기능을 막겠다.
            physics: NeverScrollableScrollPhysics(),
            // children은 우리가 넣을 화면이다.
            children: <Widget>[
              // 2강 Container대신에 HomeScreen을 넣어보자!
              // 이런식으로 생성해서 가져올 수 있음.
              HomeScreen(),
//              // 이렇게 Container 4개만 만들어보자.
//              Container(
//                // 11 잘이동하기 위해서 child는 센터, child는 text로 만들어보겠음.
//                child: Center(
//                  child: Text('home'),
//                ),
//              ),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),

//              Container(
//                child: Center(
//                  child: Text('more'),
//                ),
//              ),
            // 얘 대신에 MoreScreen을 import 불러와줌
              MoreScreen(),
            ],
          ),
          // 네비게이션 바를 설정할건데
          // Scaffold안에다가 넣어주면됨.
          // 이름은 bottom으로 만들고 이걸 직접 코딩해보자.
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}