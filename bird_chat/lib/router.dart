import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/screens/GroupInfoPage.dart';
import 'package:bird_chat/screens/HomePage.dart';
import 'package:bird_chat/screens/ChatPage.dart';
import 'package:bird_chat/screens/profile_page.dart';
import 'package:bird_chat/services/MessagesController.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/screens/CreatePage.dart';
import 'package:bird_chat/screens/UndefinedView.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home.route:
      return MaterialPageRoute(builder: (context) => Home());
    case CreatePage.route:
      return MaterialPageRoute(builder: (context) => CreatePage());
    case ChatPage.route:
      Event optional = settings.arguments;
      ChatPage page = ChatPage(
        event: optional,
        controller: MessagesController(event: optional),
      );
      return MaterialPageRoute(builder: (context) => page);
    case ProfilePage.route:
      String name = settings.arguments;
      ProfilePage page = ProfilePage(profileKey: name);
      return MaterialPageRoute(builder: (context) => page);
    case GroupInfoPage.route:
      Event optional = settings.arguments;
      GroupInfoPage page = GroupInfoPage(event: optional);
      return MaterialPageRoute(
          builder: (context) => page);
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
