import 'package:flutter/material.dart';

class UserCardWIdget extends StatelessWidget {
  final String url;
  const UserCardWIdget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            radius: 34,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.teal,
            child: Container(
              margin: const EdgeInsets.all(3),
              child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: NetworkImage(url)),
            ),
          ),
        ),
        const Text(
          'John Doe',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
