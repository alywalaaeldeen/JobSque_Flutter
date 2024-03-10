// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/screens/Job%20Detail/successfull_screen.dart';

class UploadPortfolioScreen extends StatefulWidget {
  const UploadPortfolioScreen({super.key});

  @override
  State<UploadPortfolioScreen> createState() => _UploadPortfolioScreenState();
}

class _UploadPortfolioScreenState extends State<UploadPortfolioScreen> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  File? fileToDisplay;
  int? fileCapacity;
  void pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        fileCapacity = result!.files.first.size;
        //sfileCapacity = fileCapacity! ~/ 1000;
        print("File Name = $fileName");
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Apply Job"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Box Data",
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Type of Work",
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle),
                    child: const Text(
                      "3",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Upload Porfolio",
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Upload Portfolio",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Fill in your bio data correctly",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Upload CV",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          (pickedFile != null)
              ? Container(
                  alignment: Alignment.centerLeft,
                  width: 340,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: ListTile(
                    leading: SvgPicture.asset("assets/icons/pdfLogo.svg"),
                    title: Text(
                      pickedFile!.name.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    subtitle: Text(
                      "$fileCapacity KB",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red.shade700,
                        )),
                  ),
                )
              : Container(
                  alignment: Alignment.centerLeft,
                  width: 340,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: ListTile(
                    leading: SvgPicture.asset("assets/icons/pdfLogo.svg"),
                  ),
                ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: 280,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child:
                        SvgPicture.asset("assets/icons/document-upload.svg")),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Upload your other file",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      pickFile();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        backgroundColor: Colors.blue.shade200),
                    child: const Text(
                      "Add File",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SuccessfullScreen()));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 50),
                  backgroundColor: Colors.blue),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
