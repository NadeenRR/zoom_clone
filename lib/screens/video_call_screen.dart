import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/auth_mehods.dart';
import 'package:zoom_clone/resources/jisit_meeting_method.dart';
import 'package:zoom_clone/utils/color.dart';

import '../widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIDController;
  late TextEditingController nameController;
  final AuthMethods authMethods = AuthMethods();
  final JitsiMeetMethods jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    meetingIDController = TextEditingController();
    nameController = TextEditingController(text: authMethods.user.displayName);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIDController.dispose();
    nameController.dispose();
   
  }

  joinMeeting() {
    jitsiMeetMethods.createMeeting(
        roomName: meetingIDController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: TextField(
            controller: meetingIDController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
              // contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Name',
              // contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: joinMeeting,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Join',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MeetingOption(
          text: 'Mute Audio',
          isMute: isAudioMuted,
          onChange: isAudioMute,
        ),
        MeetingOption(
          text: 'Turn off My Video',
          isMute: isVideoMuted,
          onChange: isVideoMute,
        ),
      ]),
    );
  }

  isAudioMute(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  isVideoMute(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
