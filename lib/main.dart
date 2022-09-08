import 'package:flutter/material.dart';
import 'package:navigation_drawer2/menu/contacts.dart';
import 'package:navigation_drawer2/menu/dashboard.dart';
import 'package:navigation_drawer2/menu/events.dart';
import 'package:navigation_drawer2/menu/notes.dart';
import 'package:navigation_drawer2/menu/notifications.dart';
import 'package:navigation_drawer2/menu/policy_privacy.dart';
import 'package:navigation_drawer2/menu/send_feedback.dart';
import 'package:navigation_drawer2/menu/settings.dart';
import 'package:navigation_drawer2/my_header_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSection.dashboard;

  @override
  Widget build(BuildContext context) {
    var page;

    if (currentPage == DrawerSection.dashboard) {
      page = const Dashboard();
    } else if (currentPage == DrawerSection.contacts) {
      page = const Contacts();
    } else if (currentPage == DrawerSection.events) {
      page = const Events();
    } else if (currentPage == DrawerSection.notes) {
      page = const Notes();
    } else if (currentPage == DrawerSection.settings) {
      page = const Settings();
    } else if (currentPage == DrawerSection.privacy_policy) {
      page = const PolicyPrivacy();
    } else if (currentPage == DrawerSection.send_feedback) {
      page = const SendFeddback();
    } else if (currentPage == DrawerSection.notifications) {
      page = const Notifications();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('Navigation Drawer'),
      ),

      // content
      body: page,

      // drawer
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // header
                const MyHeaderDrawer(),

                // list
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        // list menu drawer
        children: [
          menuItem(1, 'Dashboard', Icons.dashboard_outlined,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(2, 'Contacts', Icons.people_alt_outlined,
              currentPage == DrawerSection.contacts ? true : false),
          menuItem(3, 'Events', Icons.event,
              currentPage == DrawerSection.events ? true : false),
          menuItem(4, 'Notes', Icons.notes,
              currentPage == DrawerSection.notes ? true : false),
          const Divider(),
          menuItem(5, 'Settings', Icons.notes,
              currentPage == DrawerSection.settings ? true : false),
          menuItem(6, 'Notification', Icons.notifications_outlined,
              currentPage == DrawerSection.notifications ? true : false),
          const Divider(),
          menuItem(7, 'Privacy Policy', Icons.privacy_tip_outlined,
              currentPage == DrawerSection.privacy_policy ? true : false),
          menuItem(8, 'Send Back', Icons.feed_outlined,
              currentPage == DrawerSection.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSection.contacts;
            } else if (id == 3) {
              currentPage = DrawerSection.events;
            } else if (id == 4) {
              currentPage = DrawerSection.notes;
            } else if (id == 5) {
              currentPage = DrawerSection.settings;
            } else if (id == 6) {
              currentPage = DrawerSection.notifications;
            } else if (id == 7) {
              currentPage = DrawerSection.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSection.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
