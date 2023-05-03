import 'package:flutter/cupertino.dart';
import 'auth_mehods.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    // String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    Map<FeatureFlag, Object> featureFlags = {};
    String name;
    if (username.isEmpty) {
      name = _authMethods.user.displayName!;
    } else {
      name = username;
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(
      roomNameOrUrl: name,
      // serverUrl: serverUrl,
      // subject: subjectText.text,
      // token: tokenText.text,
      isAudioMuted: isAudioMuted,
      //   isAudioOnly: isAudioOnly,
      isVideoMuted: isVideoMuted,
      userDisplayName: _authMethods.user.displayName,
      userEmail: _authMethods.user.email,
      featureFlags: featureFlags,
    );

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
            "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
            "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () => debugPrint("onClosed"),
      ),
    );
  }
}

// class JitsiMeetMethods {
//   final AuthMethods _authMethods = AuthMethods();
// //  final FirestoreMethods _firestoreMethods = FirestoreMethods();

//   void createMeeting({
//     required String roomName,
//     required bool isAudioMuted,
//     required bool isVideoMuted,
//     String username = '',
//   }) async {
//     try {
//       String name;
//       if (username.isEmpty) {
//         name = _authMethods.user.displayName!;
//       } else {
//         name = username;
//       }
//       var options = JitsiMeetingOptions(room: roomName)
//         ..userDisplayName = name
//         ..userEmail = _authMethods.user.email
//         ..userAvatarURL = _authMethods.user.photoURL
//         ..audioMuted = isAudioMuted
//         ..videoMuted = isVideoMuted;

//       //   _firestoreMethods.addToMeetingHistory(roomName);
//       await JitsiMeet.joinMeeting(options);
//     } catch (error) {
//       debugPrint("error: $error");
//     }
//   }
// }
