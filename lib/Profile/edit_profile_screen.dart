import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Change photo",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ))
                  ],
                ),
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User name",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: userNameController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_3_sharp),
                        label: Text("Name retrieved from DB"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Bio",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: bioController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_3_sharp),
                        label: Text("Bio retrieved from DB"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: addressController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_3_sharp),
                        label: Text("Address retrieved from DB"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  IntlPhoneField(
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_3_sharp),
                        label: Text("01208700820"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  )
                ],
              )),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    //function that updates the data of the user with the data in the controller
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      backgroundColor: Colors.blue),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
