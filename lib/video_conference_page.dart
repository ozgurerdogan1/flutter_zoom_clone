import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatelessWidget {
  const VideoConferencePage(
      {required this.conferenceId,
      super.key,
      required this.appId,
      required this.appSign,
      required this.userId,
      required this.userName});

  final int appId;
  final String appSign;
  final String conferenceId;
  final String userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: appId,
        appSign: appSign,
        conferenceID: conferenceId,
        userID: userId,
        userName: userName,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
