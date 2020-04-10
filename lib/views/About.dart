import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/widgets/Avatar.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(Constants.ABOUT_TITLE)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Team <insert team name here>",
                  style: TextStyle(fontSize: 24),
                ),
                Divider(),
                AvatarWidget(
                  url:
                      "https://avatars0.githubusercontent.com/u/14227467?s=460&u=72984784bcabeb3b04d180f59def2dc9f86bf4ac&v=4.jpg",
                  name: "Zachery Gentry",
                  role: "Project Manager",
                ),
                AvatarWidget(
                  url:
                      "https://images-ext-2.discordapp.net/external/UrPSgcurCjMUSg6ObltUCHHtC4KTA5HP7x8CXIEE734/https/assets-prd.ignimgs.com/2020/02/24/batman-and-robin-1582582293462.jpg?width=930&height=523",
                  name: "Nick Moseley",
                  role: "Software Engineer",
                ),
                AvatarWidget(
                  url:
                      "https://images-ext-2.discordapp.net/external/r9XiuzmZ8_rOM9p9tIksp8EBEnDrLEt-ZJwY8E1cF1s/https/cnet4.cbsistatic.com/img/eAjwKXKD9dIAqWmgXr9cnZzEm6g%3D/756x567/2017/06/12/212a73c4-85f9-4919-9ac0-54582da23e66/harry-potter-philosophers-stone.jpg?width=697&height=523",
                  name: "Rahme Butaineh",
                  role: "Software Engineer",
                ),
                AvatarWidget(
                  url:
                      "https://images-ext-1.discordapp.net/external/RPXW0c55RmLQ5Pd1-lO7UwX_skOmE80ILyyZtuRFuVw/https/www.greatplacetowork.com/images/coronavirus20covid-1920workplace20leaders_virus.jpg",
                  name: "Ivan Jaimes",
                  role: "Software Engineer",
                )
              ],
            ),
          ),
        ));
  }
}
