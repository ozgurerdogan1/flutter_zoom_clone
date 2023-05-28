import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/video_conference_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZEGO CLOUD ClONE',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final String appSign = "9f343ddbf1d83bed4a5ea85ea2ed0aae0ce3a86f49d20e0cbe16d146faca680d";
  final appId = 2016434716;

  final String _randomUserId = Random().nextInt(10000).toString();
  final String _randomConferenceId =
      (Random().nextInt(1000000000) * 10 + Random().nextInt(10)).toString().padLeft(10, "0");
  late final String userName = "user$_randomUserId";

  late final TextEditingController _userIdController = TextEditingController(text: _randomUserId);
  late final TextEditingController _userNameController = TextEditingController(text: userName);
  final TextEditingController _conferenceIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Conference'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network("https://zeevector.com/wp-content/uploads/2021/03/Zoom-Logo-Vector-.png"),
                const SizedBox(height: 50),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "This field cannot be empty!";
                    return null;
                  },
                  controller: _userNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _conferenceIdController,
                  textAlign: TextAlign.start,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (newValue) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) return "This field cannot be empty!";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Join a Meeting by Input an ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    var validate = _formKey.currentState?.validate() ?? false;

                    if (validate) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return VideoConferencePage(
                            conferenceId: _conferenceIdController.text,
                            appId: 2016434716,
                            appSign: "9f343ddbf1d83bed4a5ea85ea2ed0aae0ce3a86f49d20e0cbe16d146faca680d",
                            userId: _userIdController.text,
                            userName: _userNameController.text,
                          );
                        },
                      ));
                    }
                  },
                  child: const Text("Join a Meeting"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _conferenceIdController.text = _randomConferenceId;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return VideoConferencePage(
                          conferenceId: _conferenceIdController.text,
                          appId: 2016434716,
                          appSign: appSign,
                          userId: _userIdController.text,
                          userName: _userNameController.text,
                        );
                      },
                    ));
                  },
                  child: const Text("Create New Meeting"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
