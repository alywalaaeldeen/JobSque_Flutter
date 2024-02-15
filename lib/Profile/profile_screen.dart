import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/Login/login_screen.dart';
import 'package:jobsque/Profile/edit_profile_screen.dart';
import 'package:jobsque/Profile/language_screen.dart';
import 'package:jobsque/Profile/login_and_security_screen.dart';
import 'package:jobsque/Profile/notification_screen.dart';
import 'package:jobsque/Profile/portfolio_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
        title: const Text(
          "Profile",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "User Name",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Job title",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Applied",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "26",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 45,
                        child: VerticalDivider(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Reviewed",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "26",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 45,
                        child: VerticalDivider(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Contacted",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "26",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade500),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '''I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.''',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 35,
                      color: Colors.grey.shade200,
                      child: Text(
                        "General",
                        style: TextStyle(color: Colors.grey.shade600),
                      )),
                  GeneralButtonItem(
                    buttonName: "Edit Profile",
                    logoName: "editProfile",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfile()));
                    },
                  ),
                  GeneralButtonItem(
                    buttonName: "Portfolio",
                    logoName: "portfolio",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PortfolioScreen()));
                    },
                  ),
                  GeneralButtonItem(
                    buttonName: "Language",
                    logoName: "language",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LanguageScreen()));
                    },
                  ),
                  GeneralButtonItem(
                    buttonName: "Notification",
                    logoName: "notifications",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                    },
                  ),
                  GeneralButtonItem(
                    buttonName: "Login and Security",
                    logoName: "loginAndSecurity",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const LoginAndSecurityScreen()));
                    },
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 35,
                      color: Colors.grey.shade200,
                      child: Text(
                        "Others",
                        style: TextStyle(color: Colors.grey.shade600),
                      )),
                  const OthersButtonItem(buttonName: "Accessiblity"),
                  const OthersButtonItem(buttonName: "Help Center"),
                  const OthersButtonItem(buttonName: "Terms and Conditions"),
                  const OthersButtonItem(buttonName: "Privacy Policy"),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class GeneralButtonItem extends StatelessWidget {
  const GeneralButtonItem({
    super.key,
    required this.buttonName,
    required this.logoName,
    required this.onTap,
  });
  final String buttonName;
  final String logoName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          width: 40,
          height: 40,
          child: SvgPicture.asset("assets/ButtonIcons/$logoName.svg"),
        ),
        title: Text(buttonName),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class OthersButtonItem extends StatelessWidget {
  const OthersButtonItem({super.key, required this.buttonName});
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(buttonName),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
