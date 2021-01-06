// more_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/bbongflix_logo.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'TaeBbong',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            // 이렇게해서 밑줄을 그려준다.
            Container(
              padding: EdgeInsets.all(15),
              width: 140,
              height: 5,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(10),
              // 클릭하려면 집적 들어갈 수 있는 주소를 만들 수 있따.
              // Linkify를 설치하면됨.
              child: Linkify(
                onOpen: (link) async {
                  // 이런식으로
                  // link의 url을 열 수 있따면
                  if (await canLaunch(link.url)) {
                    // launch를 해주도록 한다.
                    // 링크를 여는 것과 같이 바로 실행되지 않는 기능들은
                    // async & await을 통해 비동기로 처리할 수 있음.
                    await launch(link.url);
                  }
                },
                text: "https://github.com/whatyouwanna",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  // 배경색 빨간색
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '프로필 수정하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}