import 'package:flutter/material.dart';
import 'package:jobsque/Job%20Detail/upload_portfolio.dart';

class TypeOfWork extends StatelessWidget {
  const TypeOfWork({super.key});

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
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle),
                    child: const Text(
                      "2",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
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
                        border: Border.all(color: Colors.grey.shade400),
                        shape: BoxShape.circle),
                    child: Text(
                      "3",
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Upload Porfolio",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Type of work",
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
          const TypeOfWorkItem(workType: "Senior UX Designer"),
          const TypeOfWorkItem(workType: "Senior UI Designer"),
          const TypeOfWorkItem(workType: "Graphic Designer"),
          const TypeOfWorkItem(workType: "Front-End Developer"),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UploadPortfolioScreen()));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 50),
                  backgroundColor: Colors.blue),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ))
        ]),
      ),
    );
  }
}

class TypeOfWorkItem extends StatefulWidget {
  const TypeOfWorkItem({super.key, required this.workType});
  final String workType;

  @override
  State<TypeOfWorkItem> createState() => _TypeOfWorkItemState();
}

class _TypeOfWorkItemState extends State<TypeOfWorkItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 330,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade600),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text(
            widget.workType,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "CV.pdf Portfolio.pdf",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              icon: (isChecked)
                  ? const Icon(
                      Icons.radio_button_checked,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.radio_button_off_rounded)),
        ),
      ),
    );
  }
}
