import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  String url;
  String name;
  String role;
  AvatarWidget({this.url, this.name, this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(url),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 24),
                ),
                Text(role),
              ],
            ),
          )
        ],
      ),
    );
  }
}
