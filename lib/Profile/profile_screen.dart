import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.logout,
              color: Colors.red,
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
                  const GeneralButtonItem(
                    buttonName: "Edit Profile",
                    logoName: "editProfile",
                  ),
                  const GeneralButtonItem(
                    buttonName: "Portfolio",
                    logoName: "portfolio",
                  ),
                  const GeneralButtonItem(
                    buttonName: "Language",
                    logoName: "language",
                  ),
                  const GeneralButtonItem(
                    buttonName: "Notification",
                    logoName: "notifications",
                  ),
                  const GeneralButtonItem(
                    buttonName: "Login and Security",
                    logoName: "loginAndSecurity",
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
  });
  final String buttonName;
  final String logoName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
