import 'package:flutter/material.dart';
import 'package:jobsque/screens/SearchScreens/empty_state.dart';
import 'package:jobsque/screens/SearchScreens/result_screen.dart';
import 'package:jobsque/screens/SearchScreens/searching_screen.dart';

var jobSearch = ["UI/UX Designer"];

class SearchScreen extends StatelessWidget {
  const SearchScreen(
      {super.key, required this.isSearched, required this.isfound});
  final bool isSearched;
  final bool isfound;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: SizedBox(
            height: 50,
            width: 300,
            child: Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  while (value == null || value.isEmpty) {
                    return "Please Type Something.";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  // initiate a connection with API to retrieve all jobs with the provided value.
                  if (formKey.currentState!.validate()) {
                    if (jobSearch.contains(searchController.text)) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchScreen(
                                isSearched: true,
                                isfound: true,
                              )));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SearchScreen(
                                isSearched: true,
                                isfound: false,
                              ))));
                    }
                  } else {
                    return;
                  }
                },
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                    label: Text(
                      "Type Something...",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
          )),
        ),
        body: (isSearched && isfound)
            ? const ResultScreen()
            : (isSearched && !isfound)
                ? const EmptyState()
                : const SearchingScreen());
  }
}

class SearchedItem extends StatelessWidget {
  const SearchedItem({super.key, required this.jobTitle});
  final String jobTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_time),
      title: Text(jobTitle),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.cancel_outlined,
            color: Colors.red.shade700,
          )),
    );
  }
}
