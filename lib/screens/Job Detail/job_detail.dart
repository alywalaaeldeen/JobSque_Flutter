// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque/Models/jobs.dart';
import 'package:jobsque/screens/Job%20Detail/bio_data.dart';

class JobDetail extends StatefulWidget {
  final JobData? job;
  const JobDetail({super.key, required this.job});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  int index = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job Detail"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (!isFavorite)
                ? const Icon(
                    Icons.turned_in_not_rounded,
                    color: Colors.black,
                    size: 30,
                  )
                : const Icon(
                    Icons.turned_in_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
          )
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
                  child: Image.network(widget.job?.image ?? "")),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.job?.jobType ?? "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                widget.job?.compName ?? "",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryItem(text: widget.job?.jobTimeType ?? ""),
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
                                widget.job?.jobDescription ?? "",
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
                                widget.job?.jobSkill ?? " ",
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
                                        height: 80,
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
                                              widget.job?.compEmail ?? "",
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
                                        height: 80,
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
                                              widget.job?.compWebsite ?? "",
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
                                    widget.job?.aboutComp ?? "",
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
