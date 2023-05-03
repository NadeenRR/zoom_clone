import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/home_meeting_button.dart';
import '../resources/jisit_meeting_method.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitisMeetMethod = JitsiMeetMethods();

  void createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 1000000).toString();
    _jitisMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
              defaultButtonColor: Colors.red),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.add_box_rounded,
            text: 'Join Meeting',
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.calendar_today,
            text: 'Schedule',
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.arrow_upward_rounded,
            text: 'Share Screen',
          )
        ],
      ),
      const Expanded(
          child: Center(
        child: Text(
          'Create/Join Meeting with just a click!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ))
    ]);
  }
}
