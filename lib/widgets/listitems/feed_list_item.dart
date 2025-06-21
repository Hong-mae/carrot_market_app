import 'package:flutter/material.dart';

const double _imgSize = 110;

class FeedListItem extends StatelessWidget {
  const FeedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://placehold.co/110x110.jpg',
                    width: _imgSize,
                    height: _imgSize,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '판매 물건 제목',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text('동네 이름', style: TextStyle(color: Colors.grey)),
                            Text(
                              ' • N 분전',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          '물품 가격',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: Row(
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 16),
                  SizedBox(width: 2),
                  Text('1', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 4),
                  Icon(Icons.favorite_border, color: Colors.grey, size: 16),
                  SizedBox(width: 2),
                  Text('1', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
