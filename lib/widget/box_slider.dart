// box_slider.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/modle/model_movie.dart';
import 'package:flutter_app/screen/detail_screen.dart';

// BoxSlider도 비슷하게 만듬
// StatelessWidger으로 만듬.
class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  BoxSlider({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

// BoxImages도 따로 만들도록하겠음.
// 6강 ! 여기서 context부분에서 에러가 발생하게 되는데
// 이를 해결해주기 위해 함수의 매개변수로 context를 넣어주도록할거임!
// 이러면 가장 상위에 있는 context를 가져옴으로써. 상위의 컨텍스트를 가져오는 게 가져오게됨!
List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      onTap: () {
        // 6강에서 Navigator를 넣었음!
        Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(
                movie: movies[i],
              );
            }));
      },
      child: Container(
        // 다 디자인
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('images/' + movies[i].poster),
        ),
      ),
    ));
  }
  // 마지막으로 results
  return results;
}