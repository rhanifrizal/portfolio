import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});
  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.05,
              horizontal: size.width * 0.20,
            ),
            child: Column(
              children: [
                nightMode(),
                profilePicture(),
                name(),
                links(),
                completedProject(),
                contact(),
                tabBar(size),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Icon(Icons.abc),
                      Icon(Icons.abc),
                    ],
                  ),
                ),
                copyright(),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget nightMode() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {},
        onHover: (hovered) {
          setState(() {
            isHovered = hovered;
          });
        },
        child: Ink(
          height: 35,
          width: 35,
          child: Icon(Icons.mode_night_outlined, color: isHovered ? Colors.green : null),
        ),
      ),
    );
  }

  Widget profilePicture() {
    return const CircleAvatar(
      radius: 65,
      backgroundColor: Colors.green,
      child: CircleAvatar(
        radius: 61,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 56,
          backgroundImage: AssetImage(
            'assets/profile_picture.jpeg',
          ),
        )
      ),
    );
  }

  Widget name() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text(
            "Hanif Rizal",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )
          ),
          Text(
            "Junior Flutter Developer",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.grey,
            )
          )
        ],
      ),
    );
  }

  Widget links() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            if (!await launchUrl(Uri.parse("https://www.linkedin.com/in/rhanifrizal/"))) {
              throw Exception('Could not launch');
            }
          },
          child: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: () async {
            if (!await launchUrl(Uri.parse("https://github.com/rhanifrizal"))) {
              throw Exception('Could not launch');
            }
          },
          child: const FaIcon(FontAwesomeIcons.squareGithub, color: Colors.black),
        ),
      ],
    );
  }

  Widget completedProject() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 35.0),
      child: Column(
        children: [
          Text(
            "0",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Completed\nprojects",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget contact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(25),
              backgroundColor: const Color(0xFF42A5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            label: const Text(
              "Download Resume",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            icon: const Icon(Icons.download, color: Colors.white),
            iconAlignment: IconAlignment.end,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse("https://api.whatsapp.com/send?phone=+601128054997&text=Hello Hanif, I have a query for you."))) {
                throw Exception('Could not launch');
              }
            },
            hoverColor: Colors.grey[400],
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: const FaIcon(FontAwesomeIcons.whatsapp),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Flexible(
          child: InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse("mailto:nizarkhan7071@gmail.com"))) {
                throw Exception('Could not launch');
              }
            },
            hoverColor: Colors.grey[400],
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.email_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Widget tabBar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TabBar(
          controller: tabController,
          padding: const EdgeInsets.all(5),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
          tabs: const [
            Tab(
              text: 'Projects',
            ),
            Tab(
              text: 'Skills',
            ),
          ],
          labelColor: Colors.black,
        ),
      ),
    );
  }

  Widget copyright() {
    return const Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Text(
        "© rhanifrizal. All rights reserved",
        style: TextStyle(
          color: Colors.grey,
        )
      ),
    );
  }
}
