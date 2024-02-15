import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Messages"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        label: Text(
                          "Search messages...",
                          style: TextStyle(color: Colors.grey.shade500),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          showDragHandle: true,
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 310,
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Message Filters",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 330,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade500)),
                                            child: const ListTile(
                                              title: Text("Unread"),
                                              trailing:
                                                  Icon(Icons.chevron_right),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 330,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade500)),
                                            child: const ListTile(
                                              title: Text("Spam"),
                                              trailing:
                                                  Icon(Icons.chevron_right),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 330,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade500)),
                                            child: const ListTile(
                                              title: Text("Archived"),
                                              trailing:
                                                  Icon(Icons.chevron_right),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.filter_list)),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const ChatItem(
              companyName: "Google",
              companyLogo: "assets/images/google.svg",
              lastMessage: "Some Message",
            ),
            const ChatItem(
              companyName: "Facebook",
              companyLogo: "assets/images/Facebook.svg",
              lastMessage: "Some Message",
            ),
            const ChatItem(
              companyName: "Twitter",
              companyLogo: "assets/images/TwitterLogo.svg",
              lastMessage: "Some Message",
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem(
      {super.key,
      required this.companyName,
      required this.companyLogo,
      required this.lastMessage});
  final String companyName;
  final String companyLogo;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          SizedBox(height: 45, width: 45, child: SvgPicture.asset(companyLogo)),
      title: Text(companyName),
      subtitle: Text(
        lastMessage,
        style: TextStyle(color: Colors.grey.shade500),
      ),
      trailing: const Text(
        "12:30",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
