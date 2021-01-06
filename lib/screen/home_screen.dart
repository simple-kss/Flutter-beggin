
// 4강 : 위젯만들거임 상단바에 있는 위젯.


// lib/screen/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/modle/model_movie.dart';
import 'package:flutter_app/widget/box_slider.dart';
import 'package:flutter_app/widget/carousel_slider.dart';
import 'package:flutter_app/widget/circle_slider.dart';

// 홈 스크린같은 경우
// 영화의 정보들이 여러 유형으로 구성됨.
// 따라서 상단바부터 시작해서 전체화면 영화 포스터, 영화 정보, 영화 찜하기 기능,
// 재생하기는 생략하겠음.CarouselImage


// 미리보기 원형 위젯들.
// 동그라미말고 네모형태 위젯까지 총 3가지로 구성하겠음

// 영화 데이터를 백엔드에서 가져와야해서
// StatefulWidget으로 만들어야해.
class HomeScreen extends StatefulWidget {
  // 그다음 createState로 상태관리를 함.
  _HomeScreenState createState() => _HomeScreenState();
}

// 이걸만들어주고
class _HomeScreenState extends State<HomeScreen> {
  // QQ 3강 영화 더미데이트 클래스를 만들겠음
  // 그냥 set형태로 관리해도 되지만  (이건 무슨말인지 모르겠지만 )
  // 굳이 Movie 모델로 선언하여 더미데이터를 만드는 이유는
  // 추후 파이어베이스와의 연동에서 실제로 데이터를 그대로 가져오려고함.
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
  ];


  @override
  // 오버라이드 통해서 initstate를 가져오오겠음.
  void initState() {
    super.initState();
  }

  @override
  // Widget build함수를 가져오겠음.
  // 이상태에서 홈 스크린이 구성되는지확인하기 위해
  // 컨테이너대신 홈스크린을 가져오겠음. (main dart로 고고)
  Widget build(BuildContext context) {
    // 4강 : 기존 Topbar를 지우고
//    return TopBar();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            TopBar(),


            // 그다음 topbar를 선언할게.
            // stack의 경우 children안에 선언한 순서대로 깔림
            // Carosue이 깔리고 그다음 topbar가 깔리게 됨.
          ],
        ),
        CircleSlider(movies: movies, ),
        BoxSlider(movies: movies),
      ],
    );

  }
  // 로고같은경우 첨부파일에
// 스택으로 구현해 보겠음.

}

// QQ 상단바같은경우 홈화면에서 사용되니까
// 위젯으로 뺴지않고 바로 만들겠음

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        // 10 간격이 맘에 안드니까 이렇게 한다.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            // 이런식으로 images 폴더에 있는 이미지 가져오고.
            'images/bbongflix_logo.png',
            // fit은 BoxFit contain
            fit: BoxFit.contain,
            height: 25,
          ),
          // children 안에 컨테이너를 만든다.
          Container(
            // 패딩은 이렇게
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}