import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/screens/ForgotPassword/reset_password.dart';
import 'package:jobsque/providers/auth_provider.dart';
import 'package:jobsque/screens/Regsitration/create_account.dart';

final TextEditingController emailAddressController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObscure = false;
  bool rememberMe = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Text(
                "Please login to find your dream job",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailAddressController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_3_sharp),
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
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
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
                        } else if (value.length < 6) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              checkColor: Colors.white,
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      ResetPasswordScreen())));
                            },
                            child: const Text(
                              "Forgot Password?",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont’t have an account?",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthProvider().login(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(327, 50),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        child: const Text("Login"))
                  ],
                ),
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
                    "Or login With Account",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/Facebook.svg"),
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
      ),
    );
  }
}
