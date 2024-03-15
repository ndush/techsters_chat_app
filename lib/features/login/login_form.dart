import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;

  const LoginForm({super.key, required GlobalKey<FormState> formKey})
      : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fill your details or continue',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'with social media',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Icon(Icons.email_outlined, color: Colors.grey, size: 30),
                ),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              ),
              style: const TextStyle(color: Colors.grey),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!_isValidEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Icon(Icons.lock_outline_sharp, color: Colors.grey, size: 30),
                ),
                suffixIcon: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: const Icon(Icons.visibility_off, color: Colors.grey, size: 30),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              ),
              style: const TextStyle(color: Colors.grey),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(),
                ),
                SizedBox(width: 12),
                Text(
                  'Or Continue with',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10), // Add padding to enlarge the background
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50, // Set background color to blue
                    borderRadius: BorderRadius.circular(10), // Set border radius for rounded corners
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // ClipRRect to apply rounded corners to child
                    child: Image.asset(
                      'assets/images/gg-min.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),


                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.all(10), // Add padding to enlarge the background
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900, // Set background color to blue
                    borderRadius: BorderRadius.circular(10), // Set border radius for rounded corners
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // ClipRRect to apply rounded corners to child
                    child: Image.asset(
                      'assets/images/ff-min.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                )

              ],
            ),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () {
                // Navigate to signup page
                Navigator.pushNamed(context, '/signup');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New User? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Create Account', // Text
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
