import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/providers/auth_provider.dart';
import 'package:jobsque/screens/Login/login_screen.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isObscure = true;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/images/Logo.svg"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Please create an account to find your dream job",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_3_sharp),
                              label: Text("User Name"),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is requiered";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_sharp),
                              label: Text("Email"),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is requiered";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: isObscure,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  icon: (isObscure)
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              prefixIcon: const Icon(Icons.lock),
                              label: const Text("Password"),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          validator: (value) {
                            if (value == null) {
                              return "This field is required";
                            } /*else if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }*/
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                      (route) => false);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AuthProvider().register(context);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(327, 48),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                          child: const Text("Create Account"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 95,
                              child: Divider(
                                color: Colors.grey.shade600,
                                indent: 0,
                                endIndent: 8,
                                thickness: 1,
                              ),
                            ),
                            Text(
                              "Or Sign up With Account",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade700),
                            ),
                            SizedBox(
                              width: 95,
                              child: Divider(
                                color: Colors.grey.shade600,
                                indent: 10,
                                endIndent: 0,
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/images/google.svg"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Google",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/Facebook.svg"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Facebook",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
