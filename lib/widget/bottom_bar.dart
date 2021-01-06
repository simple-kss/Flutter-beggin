// lib/widget/bottom_bar.dart
import 'package:flutter/material.dart';

// Bottom 같은 경우 상태 관리가 필요가 없어서
// StatelessWidget으로 만들어주자
class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 이 컨테이너 안에 bottom nav 바를 만들 거임.
    return Container(
      color: Colors.black,
      // child같은 경우는 Container
      child: Container(
        // 높이는 50
        height: 50,
        // 또 child만드는데 그건 TabBar로
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          // 이걸로 설정해주도록 할게.
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                // 아이콘은 이렇게
                Icons.home,
                // 사이즈는 이렇게
                size: 18,
              ),
              // 또 child들어가네.
              child: Text(
                // 홈버튼이니까 홈으로 하고
                '홈',
                // 스타일을 TextStyle로 함
                // 폰트는 9로 하겠음.
                style: TextStyle(fontSize: 9),
              ),
            ),

            // 이탭을 복사해서 4개로 만들어주도록 하겠음.
            // 각 탭에 대해 아이콘과 글자를 바꿔주도록 하겠음.
            Tab(
              icon: Icon(
                // 아이콘은 search
                Icons.search,
                size: 18,
              ),
              child: Text(
                '검색',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                // 저장할 컨텐츠니까 save alt
                Icons.save_alt,
                size: 18,
              ),
              child: Text(
                '저장한 콘텐츠 목록',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                // 더보기니까 list로 만들고
                Icons.list,
                size: 18,
              ),
              child: Text(
                '더보기',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 이렇게하면 tabbar에 대한 위젯을 다 만든거임.