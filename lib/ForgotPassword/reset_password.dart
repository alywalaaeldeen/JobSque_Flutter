import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/ForgotPassword/email_sent.dart';
import 'package:jobsque/Login/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              "Reset Password",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_sharp),
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field is requiered";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 370,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You remember your password?",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const EmailSentScreen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(350, 50)),
              child: const Text(
                "Request password change",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
