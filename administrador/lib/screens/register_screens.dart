import 'package:flutter/material.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({super.key});

  @override
  RegisterScreensState createState() => RegisterScreensState();
}

class RegisterScreensState extends State<RegisterScreens> {
  bool _isAccepted = false;
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  _buildTextInputField(context, 'Name'),
                  const SizedBox(height: 20),
                  _buildTextInputField(context, 'Number', icon: Icons.phone),
                  const SizedBox(height: 20),
                  _buildTextInputField(context, 'Email', icon: Icons.email),
                  const SizedBox(height: 20),
                  _buildPasswordInputField(context),
                  const SizedBox(height: 20),
                  _buildTextInputField(context, 'Date',
                      icon: Icons.calendar_today),
                  const SizedBox(height: 30),
                  _buildCheckbox(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/storeDetails');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.deepPurple)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputField(BuildContext context, String label,
      {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon:
                icon != null ? Icon(icon, color: Colors.deepPurple) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordInputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: _isObscured,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
            suffixIcon: IconButton(
              icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
              color: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox() {
    return InkWell(
      onTap: () {
        setState(() {
          _isAccepted = !_isAccepted;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isAccepted ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            const Text('Agree with Terms & Condition',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
