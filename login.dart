import 'package:flutter/material.dart';
import 'package:mulearn/home.dart'; // Make sure this file exists

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String validEmail = 'test@mulearn.org'; // sample for testing
  final String validPassword = 'password123';   // sample for testing

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email == validEmail && password == validPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid MUID/Email or Password'),
        ),
      );
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView( // Helps in smaller screen handling
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "µLearn",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 156, 39, 176),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hello! Welcome back",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your MUID or email address to request for OTP",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Email/MUID Field
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email / MUID",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Forgot Password + Login with OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Login with OTP"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Button background color
                    foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text("Login"),
                  ),

                ),
                const SizedBox(height: 30),

                // Sign Up
                GestureDetector(
                  onTap: () {},
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
