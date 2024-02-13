import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/Job%20Detail/type_of_work.dart';

class BioDataScreen extends StatelessWidget {
  BioDataScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Apply Job"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          border: Border.all(color: Colors.blue),
                          shape: BoxShape.circle),
                      child: const Text(
                        "1",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
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
                          border: Border.all(color: Colors.grey.shade400),
                          shape: BoxShape.circle),
                      child: Text(
                        "2",
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Type of Work",
                      style: TextStyle(color: Colors.black, fontSize: 12),
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
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 16),
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
              "Bio Data",
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
            Form(
                key: _formKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your full name.";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              label: Text("Full Name"),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email.";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              label: Text("Email"),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        IntlPhoneField(
                          validator: (value) {
                            if (value == null || !value.isValidNumber()) {
                              return "Please enter your email.";
                            }
                            return null;
                          },
                          controller: phoneController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              label: Text("Phone Number")),
                        ),
                        const SizedBox(
                          height: 180,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const TypeOfWork()));
                              }
                              return;
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 50),
                                backgroundColor: Colors.blue),
                            child: const Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
