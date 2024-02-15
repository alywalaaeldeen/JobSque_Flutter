import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Language"),
        ),
        body: const Column(
          children: [
            LanguageItem(
              languageName: "English",
            ),
            LanguageItem(
              languageName: "Indonesia",
            ),
            LanguageItem(
              languageName: "Arabic",
            ),
            LanguageItem(
              languageName: "Chinese",
            ),
            LanguageItem(
              languageName: "Dutch",
            ),
            LanguageItem(
              languageName: "French",
            ),
            LanguageItem(
              languageName: "German",
            ),
            LanguageItem(
              languageName: "Japanese",
            ),
            LanguageItem(
              languageName: "South Korean",
            ),
            LanguageItem(
              languageName: "Portugese",
            ),
          ],
        ));
  }
}

class LanguageItem extends StatefulWidget {
  const LanguageItem({super.key, required this.languageName});
  final String languageName;

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset("assets/LanguageIcons/${widget.languageName}.png"),
        title: Text(widget.languageName),
        trailing: IconButton(
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            icon: (selected == true)
                ? const Icon(
                    Icons.radio_button_checked,
                    color: Colors.blue,
                  )
                : const Icon(
                    Icons.radio_button_off,
                    color: Colors.blue,
                  )));
  }
}
