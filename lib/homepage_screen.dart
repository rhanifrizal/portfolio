import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});
  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
            ],
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
          onTap: (){},
          child: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: (){},
          child: const FaIcon(FontAwesomeIcons.squareGithub, color: Colors.black),
        ),
      ],
    );
  }
}
