import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl; // 이미지를 담을 변수

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // row(주축:가로)에 속하는 이미지와 텍스트를 전부 부축(세로) 기준 start 포인트로 밀착시킴
        children: [
          // CilpRRect 를 통해 이미지에 곡선 border 생성
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // 이미지
            child: Image.network(
              widget.imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12), // 물품 사진과 텍스트 사이에 빈공간 만들어주기 위함

          Expanded(
              // 자식위젯(칼럼)의 너비를 남은 공간 전체로 지정해줌
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // 칼럼(주축:세로)에 속하는 텍스트들을 부축(가로) 기준 start 지점으로 밀착
                  children: [
                Text(
                  'M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // 오버플로우시 줄바꿈하라는 뜻
                ),
                SizedBox(height: 2),
                Text(
                  '봉천동 · 6분 전',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '100만원',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(children: [
                  Spacer(), //차지할 수 있는 공간 모두를 차지해버림 -> 위젯 밀어내기 용
                  GestureDetector(
                      //모든 위젯을 버튼처럼 만들어 줌
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Row(children: [
                        Icon(
                          isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: isFavorite ? Colors.pink : Colors.black,
                          size: 16,
                        ),
                        Text(
                          '1',
                          style: TextStyle(color: Colors.black54),
                        )
                      ]))
                ])
              ]))
        ]);
  }
}
