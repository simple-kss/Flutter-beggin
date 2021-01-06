// circle_slider.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/modle/model_movie.dart';
import 'package:flutter_app/screen/detail_screen.dart';

// 상태 변화가 없으니까 stateless
class CircleSlider extends StatelessWidget {

  // 얘도 movies를 넘겨 받아야함.
  final List<Movie> movies;

  // 그래서 this.movies로 함
  CircleSlider({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        // start로함!!!
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('미리보기'),
          Container(
            height: 120,
            // 여기에서는 ListView가 들어가야함
            // 횡단 스크롤이 되는 Listview가 들어가야함!
            child: ListView(
              // horizontal로 해야 횡단 스크롤임!
              // vertical이 default값임!
              scrollDirection: Axis.horizontal,
              // 라는 함수를 만든다.
              children: makeCircleImages(context, movies),
            ),
          ),
        ],
      ),
    );
  }
}


// 실제 원형을 만들어주는 역할을 하는 메소드를 만들어주겠따.
List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  // 반환할 리스트.
  List<Widget> results = [];
  // 다음과 같은 작업을 하겠음.
  for (var i = 0; i < movies.length; i++) {
    results.add(
      // 얘를 통해서 각 위젯들이 클릭 가능하도록함.
      InkWell(
        // 일단 빈형태로 만들어주고
        onTap: () {
          // 6강에서 이걸 추가!
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            // CircleAvatar로 만듬!
            child: CircleAvatar(
              backgroundImage: AssetImage('images/' + movies[i].poster),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }

  // 마지막으로 results로 반환.
  return results;
}