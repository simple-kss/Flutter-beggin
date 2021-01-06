// lib/widget/carousel_slider.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modle/model_movie.dart';
import 'package:flutter_app/screen/detail_screen.dart';
//import 'package:netflix_clone_lecture_note/model/model_movie.dart';

// StatefulWidget으로 하는 이유는 해당 위젯은 단순히 이미지를 보여주는 역할 뿐만 아니라
// 찜하기 버튼, 그리고 정ㅈ보를 통해 디테일 페이지 띄우는 기능이 있어서.
class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  // 홈화면에서 CarouselImage로 받아와야함.

  // 이런식으로 생성자로 가져오겠음
 CarouselImage({this.movies});

 // 이런식으로 상태관리 선언./..
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  // 그 인덱스를 저장해야하는
  // currentPage를 만들고
  int _currentPage = 0;
  // 그 페이지에 기록되어있는
  // 현재 keyword또한 관리해주도록함
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    // 상위 클래스인 statefulWidget에서 가져온 movies를 참조할 수 있또록 값을 가져옴.
    // 여기선 movies를 해당 스테이트에서 가져오기로함.
    movies = widget.movies;
    // map.. 여긴 문법임..
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    // 그리고 keywords는 이런식으로 만들어주고
    keywords = movies.map((m) => m.keyword).toList();
    // likes로 마찬가지로 진행.
    likes = movies.map((m) => m.like).toList();
    // 초기값 선언
    _currentKeyword = keywords[0];
  }

  // carousel_slider를 쓰려면 이걸 설치해야함.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          //이런식으로 페이지 전환 함수를 만든다.
          CarouselSlider(
            // options를 붙여야함!
            options: CarouselOptions (
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
            items: images
          ),
          // 밑에있는 설명을 프린트하기 위함.
          // 4강 패딩주고 , 택스트 사이즈도 키우겠음. (사진 밑에 있음)
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              // 밑에있는 설명.
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            // 4강 : 이상태에서 메뉴바를 만들겠음.
            child: Row(
              // 따닥따닥붙여있어서
              // mainAxisAlignments를 spaceEvenly로 적용시킨다 (그럼 가로정렬됨)
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    // 칠드런은 위젯
                    // 찜하기 버튼을 누른 여부에 따라 찜한 영화면
                    // 체크버튼, 아니면 플러스 버튼으로 나오도록 하기 위해.
                    // 아래와 같이 진행함.
                    children: <Widget>[
                      // likes에따라서 진행함.
                      likes[_currentPage]
                      // 아래와 같이 진행함
                          ? IconButton(
                        icon: Icon(Icons.check),
                        // onPressed는 빈형태로 만들고
                        onPressed: () {
                          // MaterialPageRoute를 이용해서 팝업창을 띄우도록함.
                          Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (BuildContext context){
                            // 이렇게 정보버튼을 누르면 해당영화가 파라미터로 넘어감.
                            // DetailScreen화면이 보여짐.
                            return DetailScreen(movie: movies[_currentPage]);
                          }));
                        },
                      )
                          : IconButton(
                        // icons.add는
                        icon: Icon(Icons.add),
                        // 빈 형태로 false일때 플러스, treu일때 체크가 나오게됨!
                        onPressed: () {},
                      ),
                      // 그리고 그 하단에 text를 출력해보록 함.
                      Text(
                        '내가 찜한 콘텐츠',
                        // 스타일은 이렇게 맞춤.
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  // child는 플랫버튼!
                  child: FlatButton(
                    color: Colors.white,
                    // onPressed 는 마찬가지로 비워놓ㅅ고
                    onPressed: () {},
                    // child는 Row
                    // Row안에서 Icon, Paddong, Text를 선언함.
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        // 마지막으로 재생글씨
                        Text(
                          '재생',
                          style: TextStyle(color: Colors.black),
                          // 스타일은 텍스트 스타일.
                          // 그럼 원하는 형태의 재생형태가 옴.

                        )
                      ],
                    ),
                  ),
                ),

                // 마지막으로 목록버튼을 만들도록 함.
                // 목록 역시
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        // 빈 형태로 만들어줌
                        onPressed: () {},
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                      // 이러면 정보 버튼까찌
                    ],
                  ),
                ),
              ],
            )
          ),
          // 인디케이터를 만들기위해 이렇게 한다.
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // 칠드런은 위젯리스트 대신에 makeIndicator
              children: makeIndicator(likes, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

// 목적 :
// 마지막을 Indicator를 만들어줄건데
// 별도의 함수를 통해서 만듬.
List<Widget> makeIndicator(List list, int _currentPage) {
  // List Widget을 만들어서 반환할 results를 만들고
  List<Widget> results = [];
  // 반복문을 이용해서 처리해줌
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      // 데코는 BoxDecoration으로 만듬
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          // _currentPage만 i일떄만 0.9, 아니면 0.4로 맞추겠다.
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }
  // 그 함수를 return함으로써 마침.
  return results;
}