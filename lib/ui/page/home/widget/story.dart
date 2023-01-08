import 'package:flutter/material.dart';

import 'user_card.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      height: 110,
      child: ListView.builder(
        padding: const EdgeInsets.all(4),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return UserCardWIdget(
            url: 'https://source.unsplash.com/random/60x60?portrait+$index',
          );
        },
      ),
    );
  }
}
