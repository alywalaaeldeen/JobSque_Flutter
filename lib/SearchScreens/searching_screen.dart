import 'package:flutter/material.dart';
import 'package:jobsque/SearchScreens/search_screen.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 35,
            child: Text(
              "Recent Searches",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SearchedItem(jobTitle: "Junior UI Designer"),
        ],
      ),
    );
  }
}
