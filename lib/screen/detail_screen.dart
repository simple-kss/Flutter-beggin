// detail_screen.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/modle/model_movie.dart';

// 백엔드에서 데이터 가져와야해서 ..
class DetailScreen extends StatefulWidget {
  final Movie movie;
  // 해당영화가 Datailscaren을 호출하는
// 위젯의 영화 데이터를 가져오겟음.
  // 요고는 아마 인자 관리인듯.
  DetailScreen({this.movie});
  _DetailScreenState createState() => _DetailScreenState();
}

// 세부정보 보여주는 페이지임


// 팝업 모델로 만들겠음.
class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    super.initState();
    // 이 영화 찜하기
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // SafeArea는 먼지 모르겠네
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              // Stack을 넣도록 하겠음.
              // 첫번쨰로 Stack을 넣도록함.

              // 약간 블러처리 이런거하려면 dart.ui를 import해야함
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/' + widget.movie.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // 여기서 decoration만 정의해주고
                    // child는 정의하지 않아서 빈화면만 나왔음

                    // CLipRector
                    child: ClipRect(
                      child: BackdropFilter(
                        // blur로 함..
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              // children을 정의해줌.
                              children: <Widget>[
                                // 큰이미지가 블러
                                // 작은이미지 작게
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.asset(
                                      'images/' + widget.movie.poster),
                                  height: 300,
                                  // 컨테이너 높이는 300으로 맞춰주겠음.
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '99% 일치 2019 15+ 시즌 1개',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: FlatButton(
                                    onPressed: () {},
                                    color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.play_arrow),
                                        Text('재생'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(widget.movie.toString()),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '출연: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 팝업 다이얼로그에 닫기가 기본적으로 적용되어있음.
                  // 닫기에 대한 기본적용 안해도 됨.
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            // check로 할건지, icons.add로할건지
                            like ? Icon(Icons.check) : Icon(Icons.add),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '내가 찜한 콘텐츠',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '평가',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.send),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '공유',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}