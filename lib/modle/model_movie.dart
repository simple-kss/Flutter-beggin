// lib/model/model_movie.dart
class Movie {
  // 영화 모델에 들어갈 요소를 final만들겠음.
  // string으로 하겠음.
  // 해당영화를 찜하기 하였는지 확인하기 위해
  // like변수를 만듬.
  final String title;
  final String keyword;
  final String poster;
  final bool like;


  // Movie 클래스를 위한 fromMap을 정의하겠음
  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  // 프린트 용이하기 위해서 이렇게 함.
  @override
  String toString() => "Movie<$title:$keyword>";
}
// 이렇게 Movie 모델을 다 만들었음.abstract
// 영화 데이터 관리를 쉽게하기 위해서임
// 그래서 영화 더미 데이터를 만들기로하겠음.abstract