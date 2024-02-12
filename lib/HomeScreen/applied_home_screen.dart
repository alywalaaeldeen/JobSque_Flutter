import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/HomeScreen/home_screen.dart';
import 'package:jobsque/SearchScreens/search_screen.dart';

class AppliedHomeScreen extends StatefulWidget {
  const AppliedHomeScreen({super.key, required this.isAccepted});
  final bool isAccepted;

  @override
  State<AppliedHomeScreen> createState() => _AppliedHomeScreenState();
}

class _AppliedHomeScreenState extends State<AppliedHomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentSelectedScreenIndex = 0;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, User",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Create a better future for yourself here",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
              style: IconButton.styleFrom(
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.grey.shade500))),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Form(
                    child: SizedBox(
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SearchScreen(
                                    isSearched: false, isfound: false)));
                          },
                          child: Container(
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(Icons.search),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text("Search....",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade700))
                              ],
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Suggested Jobs",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View all",
                            style: TextStyle(color: Colors.blue, fontSize: 14),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 330,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Colors.blue.shade100),
                    child: ListTile(
                      leading:
                          SvgPicture.asset("assets/images/TwitterLogo.svg"),
                      title:
                          const Text("Twitter", style: TextStyle(fontSize: 16)),
                      subtitle: Text(
                          "Waiting to be selected by the twitter team",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12)),
                      trailing: (widget.isAccepted)
                          ? Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25))),
                              child: const Text(
                                "Accepted",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25))),
                              child: const Text(
                                "Submitted",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 180,
                    child: PageView(children: const [
                      SuggestedJobItem(
                          companyLogo: "assets/images/zoom.svg",
                          jobName: "Product Designer",
                          companyAndLocation: "Zoom - USA"),
                      SuggestedJobItem(
                          companyLogo: "assets/images/google.svg",
                          jobName: "Software Developer ",
                          companyAndLocation: "Google - USA")
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Job",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text("View all"))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RecentJobItem(
                      jobName: "Senior UI Designer",
                      companyLogo: "assets/images/TwitterLogo.svg",
                      companyAndLocation: "Twitter • Jakarta, Indonesia "),
                ]),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentSelectedScreenIndex = index;
            });
          },
          currentIndex: currentSelectedScreenIndex,
          elevation: 0,
          backgroundColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Applied"),
            BottomNavigationBarItem(
                icon: Icon(Icons.turned_in), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ));
  }
}

// class SuggestedJobItem extends StatefulWidget {
//   const SuggestedJobItem(
//       {super.key,
//       required this.companyLogo,
//       required this.jobName,
//       required this.companyAndLocation});
//   final String companyLogo;
//   final String jobName;
//   final String companyAndLocation;

//   @override
//   State<SuggestedJobItem> createState() => _SuggestedJobItemState();
// }

// class _SuggestedJobItemState extends State<SuggestedJobItem> {
//   bool isfavorite = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.blue.shade800, borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         children: [
//           ListTile(
//             leading: Container(
//               width: 40,
//               height: 40,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               child: SizedBox(
//                   width: 32,
//                   height: 32,
//                   child: SvgPicture.asset(widget.companyLogo)),
//             ),
//             title: Text(
//               widget.jobName,
//               style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400),
//             ),
//             subtitle: Text(
//               widget.companyAndLocation,
//               style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey.shade400,
//                   fontWeight: FontWeight.w400),
//             ),
//             trailing: IconButton(
//               onPressed: () {
//                 setState(() {
//                   isfavorite = !isfavorite;
//                 });
//               },
//               icon: (!isfavorite)
//                   ? const Icon(
//                       Icons.turned_in_not_rounded,
//                       color: Colors.white,
//                       size: 30,
//                     )
//                   : const Icon(
//                       Icons.turned_in_rounded,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 width: 90,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white70,
//                 ),
//                 child: const Text(
//                   "Fulltime",
//                   textHeightBehavior: TextHeightBehavior(
//                       leadingDistribution: TextLeadingDistribution.even),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 width: 90,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white70,
//                 ),
//                 child: const Text(
//                   "Remote",
//                   textHeightBehavior: TextHeightBehavior(
//                       leadingDistribution: TextLeadingDistribution.even),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 width: 90,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white70,
//                 ),
//                 child: const Text(
//                   "Design",
//                   textHeightBehavior: TextHeightBehavior(
//                       leadingDistribution: TextLeadingDistribution.even),
//                   textAlign: TextAlign.center,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               RichText(
//                 text: const TextSpan(children: [
//                   TextSpan(text: "\$12K-15K"),
//                   TextSpan(
//                       text: "/Month",
//                       style: TextStyle(fontSize: 12, color: Colors.white70))
//                 ], style: TextStyle(color: Colors.white, fontSize: 22)),
//               ),
//               ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white),
//                   child: const Text("Apply Now"))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class RecentJobItem extends StatefulWidget {
//   const RecentJobItem(
//       {super.key,
//       required this.jobName,
//       required this.companyLogo,
//       required this.companyAndLocation});
//   final String jobName;
//   final String companyLogo;
//   final String companyAndLocation;

//   @override
//   State<RecentJobItem> createState() => _RecentJobItemState();
// }

// class _RecentJobItemState extends State<RecentJobItem> {
//   bool isfavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(children: [
//         ListTile(
//           leading: Container(
//             width: 40,
//             height: 40,
//             decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 102, 144, 255),
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             child: SizedBox(
//                 width: 32,
//                 height: 32,
//                 child: SvgPicture.asset(widget.companyLogo)),
//           ),
//           title: Text(
//             widget.jobName,
//             style: const TextStyle(
//                 fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
//           ),
//           subtitle: Text(
//             widget.companyAndLocation,
//             style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey.shade600,
//                 fontWeight: FontWeight.w400),
//           ),
//           trailing: IconButton(
//             onPressed: () {
//               setState(() {
//                 isfavorite = !isfavorite;
//               });
//             },
//             icon: (isfavorite == false)
//                 ? const Icon(
//                     Icons.turned_in_not_rounded,
//                     color: Colors.black,
//                     size: 30,
//                   )
//                 : const Icon(
//                     Icons.turned_in_rounded,
//                     color: Colors.black,
//                     size: 30,
//                   ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width: 70,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.blue.shade100,
//               ),
//               child: const Text(
//                 "Fulltime",
//                 style: TextStyle(color: Colors.blue),
//                 textHeightBehavior: TextHeightBehavior(
//                     leadingDistribution: TextLeadingDistribution.even),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               width: 70,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.blue.shade100,
//               ),
//               child: const Text(
//                 "Remote",
//                 style: TextStyle(color: Colors.blue),
//                 textHeightBehavior: TextHeightBehavior(
//                     leadingDistribution: TextLeadingDistribution.even),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               width: 70,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.blue.shade100,
//               ),
//               child: const Text(
//                 "Design",
//                 style: TextStyle(color: Colors.blue),
//                 textHeightBehavior: TextHeightBehavior(
//                     leadingDistribution: TextLeadingDistribution.even),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             RichText(
//               text: TextSpan(
//                   children: [
//                     const TextSpan(text: "\$15K"),
//                     TextSpan(
//                         text: "/Month",
//                         style: TextStyle(
//                             color: Colors.grey.shade600, fontSize: 12))
//                   ],
//                   style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.green,
//                       fontWeight: FontWeight.w500)),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//       ]),
//     );
//   }
// }
