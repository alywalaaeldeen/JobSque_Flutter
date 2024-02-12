import 'package:flutter/material.dart';
import 'package:jobsque/Job%20Detail/successfull_screen.dart';

class UploadPortfolioScreen extends StatelessWidget {
  const UploadPortfolioScreen({super.key});

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
          /*
           Upload File Field,
          */
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
