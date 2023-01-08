import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/image/collection_controller.dart';
import '../../../controller/user/user_controller.dart';
import '../../../data/const.dart';
import '../widget/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context, title: value.isLoggedIn ? 'Profile' : 'Login'),
        body: body(context, value),
      );
    });
  }

  Widget body(BuildContext context, UserController userController) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        child: Visibility(
          visible: userController.isLoggedIn,
          replacement: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 40,
                ),
                child: Text(
                  'Hi ${userController.profile.name}, Login to access more feature!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  userController.login();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                ),
                child: const Text('Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          child:
              Consumer<CollectionController>(builder: (context, feed, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: NetworkImage(user.avatarUrl))),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: FloatingActionButton.small(
                          backgroundColor: Colors.teal,
                          heroTag: const Key('home'),
                          onPressed: () {},
                          child: const Icon(Icons.edit, color: Colors.white)))
                ]),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Text(
                  user.job,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: 30,
                ),
                listTile('My Membership', Icons.star_border_outlined),
                const Divider(),
                listTile('My Collection', Icons.bookmark_outline,
                    trailing: _lengthView(
                      feed.myCollection.length,
                    )),
                const Divider(),
                listTile(
                  'Logout',
                  Icons.logout,
                  color: Colors.red,
                  onTap: () {
                    userController.logout();
                    feed.removeAll();
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _lengthView(int length) {
    return Visibility(
      visible: length > 0,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            length.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  ListTile listTile(
    String title,
    IconData icon, {
    Color color = Colors.black,
    void Function()? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
    );
  }
}
