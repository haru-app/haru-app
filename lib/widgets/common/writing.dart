import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/profile.dart';

class Writing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          Profile(),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'May 21 2020',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      '피곤한 하루',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      '실력 있는 목수는 연장 탓을 하지 않는다…고 하지만, 사람 마음이란 게 그렇지가 않다. 별 생각 없다가도 나에게 꼭 맞는 톱이 생기면 장작이라도 잘라 보고 싶은 법. 일기 쓰기도 마찬가지다. 일기장이 예쁘면 딱히 쓸 게 없어도 괜히 한 번 펼쳐보고, 스티커라도 붙여 보고, 카페에도 들고 나가고 싶어 진다.\n\n나의 경우 오랫동안 일기장 유목민으로 살았다. 학교 로고가 박힌 것부터 카페 다이어리, 만년 다이어리, 수제 노트까지 정말 안 써본 게 없다. 그러다 3년 전 운명의 친구를 만났다. 이 노트는 ‘미도리’라는 일본 브랜드의 것으로, ‘여행자의 노트(트레블러스 노트)’라는 이름이 붙어 있는데, 가죽 커버를 사서 속지를 바꿔 끼는 형식이다. 한 해 쓰고 마는 게 아니기 때문에 세월이 흐를수록 손때가 묻어 근사해진다. 쓰면 쓸수록 정이 붙어 요샌 어딜 가든 들고 다닌다. 미도리가 망하지만 않는 다면 평생 쓸 계획이다.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      children: [
                        Text(
                          '#일상',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '#일상입니',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '#일상입니다',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '#일상입니다',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '#일상입니다',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
