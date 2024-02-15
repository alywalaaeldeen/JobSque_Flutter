import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Portfolio"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Add portfolio here",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            /**************** Upload PDF FormField***************** */
            PDFFileItem(fileName: "fileName", fileCapacity: 300.toString())
          ],
        ),
      ),
    );
  }
}

class PDFFileItem extends StatelessWidget {
  const PDFFileItem(
      {super.key, required this.fileName, required this.fileCapacity});
  final String fileName;
  final String fileCapacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: SvgPicture.asset("assets/icons/pdfLogo.svg"),
        title: const Text(
          "UI/UX Designer",
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Text("CV.pdf $fileCapacity KB"),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            )),
      ),
    );
  }
}
