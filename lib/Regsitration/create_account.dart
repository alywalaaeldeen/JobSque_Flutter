import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/Regsitration/work_type_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/images/Logo.svg",
          width: 40,
          height: 30,
        ),
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
                          controller: userNameController,
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
                            } else if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade700),
                              children: [
                                const TextSpan(
                                    text: "Already have an account? "),
                                WidgetSpan(
                                    child: GestureDetector(
                                        child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                )))
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: ((context) => const WorkType()),
                                  ),
                                  (route) => false);
                            } else {
                              return;
                            }
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
                        Text(
                          "Or Sign up With Account",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
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
