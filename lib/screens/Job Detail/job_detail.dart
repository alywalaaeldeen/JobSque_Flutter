// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/screens/Job%20Detail/bio_data.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({super.key});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job Detail"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.turned_in_not_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset("assets/images/TwitterLogo.svg")),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Senior UI Designer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                "Twitter • Jakarta, Indonesia",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryItem(text: "Fulltime"),
                  CategoryItem(text: "Onsite"),
                  CategoryItem(text: "Senior")
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 107,
                        height: 40,
                        decoration: BoxDecoration(
                            color: (index == 0)
                                ? Colors.blue.shade800
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: (index == 0)
                                  ? Colors.white
                                  : Colors.grey.shade600),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 107,
                        height: 40,
                        decoration: BoxDecoration(
                            color: (index == 1)
                                ? Colors.blue.shade800
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "Company",
                          style: TextStyle(
                              color: (index == 1)
                                  ? Colors.white
                                  : Colors.grey.shade600),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 107,
                        height: 40,
                        decoration: BoxDecoration(
                            color: (index == 2)
                                ? Colors.blue.shade800
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "People",
                          style: TextStyle(
                              color: (index == 2)
                                  ? Colors.white
                                  : Colors.grey.shade600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
            (index == 0)
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                              ),
                              Text(
                                "Job Description",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Skills Required",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '''A strong visual portfolio with clear understanding of UI methodologies
Ability to create hi-fidelity mock-ups in Figma
Ability to create various graphics for the web e.g. illustrations and icons
Able to facilitate workshops and liaise with stakeholders
Proficiency in the Adobe Creative Suite
Confident communicator with an analytical mindset
Design library/Design system experience
4+ years of commercial experience in UI/Visual Design''',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                              ),
                              SizedBox(
                                height: 100,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => BioDataScreen())));
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(350, 50),
                                  backgroundColor: Colors.blue),
                              child: Text(
                                "Apply Now",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ]),
                    ),
                  )
                : (index == 1)
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(children: [
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact us",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        alignment: Alignment.topLeft,
                                        width: 160,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Email",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "twitter@mail.com",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        alignment: Alignment.topLeft,
                                        width: 160,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Website",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "https://twitter.com",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "About Company",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including 'Best Staffing Firm to Work For 2018'​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                BioDataScreen())));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(350, 50),
                                      backgroundColor: Colors.blue),
                                  child: Text(
                                    "Apply Now",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ]),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(children: [
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "6 Employees For",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "UI/UX Designer",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade600),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: 140,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade500),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: DropdownButton(
                                              underline: const SizedBox(),
                                              dropdownColor: Colors.white,
                                              iconEnabledColor: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onChanged: (value) {},
                                              items: const [
                                                DropdownMenuItem(
                                                    child: Text(
                                                  "UI/UX Designer",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )),
                                                /*DropdownMenuItem(
                                                    child: Text(
                                                  "Developer",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )),
                                                DropdownMenuItem(
                                                    child: Text(
                                                  "Software Engineer",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )),*/
                                              ]))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  PersonItem(
                                      personLogo:
                                          "assets/peopleIcons/person1.png",
                                      jobTitle:
                                          "Senior UI/UX Designer at Twitter",
                                      jobDuration: "5 Years",
                                      personName: "Dimas Adi Saputro"),
                                  PersonItem(
                                      personLogo:
                                          "assets/peopleIcons/person2.png",
                                      jobTitle:
                                          "Senior UI/UX Designer at Twitter",
                                      jobDuration: "5 Years",
                                      personName: "Ahmed Mohamed"),
                                  PersonItem(
                                      personLogo:
                                          "assets/peopleIcons/person2.png",
                                      jobTitle:
                                          "Senior UI/UX Designer at Twitter",
                                      jobDuration: "5 Years",
                                      personName: "Mohamed Ahmed"),
                                  PersonItem(
                                      personLogo:
                                          "assets/peopleIcons/person2.png",
                                      jobTitle:
                                          "Senior UI/UX Designer at Twitter",
                                      jobDuration: "5 Years",
                                      personName: "Omar Ahmed"),
                                  PersonItem(
                                      personLogo:
                                          "assets/peopleIcons/person2.png",
                                      jobTitle:
                                          "Senior UI/UX Designer at Twitter",
                                      jobDuration: "5 Years",
                                      personName: "Emad Ibrahim"),
                                  PersonItem(
                                      personLogo:
                                          "assets/peopleIcons/person5.png",
                                      jobTitle:
                                          "Senior UI/UX Designer at Twitter",
                                      jobDuration: "5 Years",
                                      personName: "Sara Mohamed El Mahdy"),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                BioDataScreen())));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(350, 50),
                                      backgroundColor: Colors.blue),
                                  child: Text(
                                    "Apply Now",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ]),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 75,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blue.shade100),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class PersonItem extends StatelessWidget {
  const PersonItem(
      {super.key,
      required this.personLogo,
      required this.jobTitle,
      required this.jobDuration,
      required this.personName});
  final String personLogo;
  final String jobTitle;
  final String jobDuration;
  final String personName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(personLogo),
      title: Text(
        personName,
        style: TextStyle(fontSize: 14),
      ),
      subtitle: Text(
        jobTitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Work During",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            jobDuration,
            style: TextStyle(fontSize: 12, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
