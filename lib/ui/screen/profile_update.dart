import 'package:firebase_with_flutter_practice/UI/screen/fregment/password_update.dart';
import 'package:firebase_with_flutter_practice/UI/screen/fregment/profile_information.dart';
import 'package:firebase_with_flutter_practice/UI/widgets/background.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          title: "Profile update",
          bottom: const TabBar(
            tabs: [
              Tab(text: "Profile Information",),
              Tab(text: "Update Password",)
            ]
          ),
        ),
        body: const Background(
          child: TabBarView(
            children: [
              ProfileInformation(),
              UpdatePassword()
            ],
          ),
        ),
      ),
    );
  }
}