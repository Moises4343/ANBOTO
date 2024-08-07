import 'package:administrador/screens/login_screens.dart';
import 'package:administrador/services/api_services.dart'; // Asegúrate de incluir tu servicio ApiService aquí
import 'package:flutter/material.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({super.key});

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<RegisterScreens> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _register() async {
    Map<String, dynamic> userData = {
      'nombre': _nameController.text,
      'numero_telefono': _numberController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'fecha_nacimiento': _dateController
          .text, // Asegúrate de enviar la fecha en el formato adecuado para tu backend
      'acepta_termino':
          _acceptTerms ? 1 : 0, // Cambia según la lógica de tu aplicación
    };

    try {
      final ApiService apiService = ApiService();
      var response = await apiService.createUsuarioAdmin(userData);

      // Mostrar cuadro de diálogo de éxito y redirigir a la vista de inicio de sesión
      if (response != null) {
        _showSuccessDialog();
      }
    } catch (e) {
      print("Error al registrar usuario: $e");
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro Exitoso'),
          content: const Text('El usuario se ha registrado correctamente.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreens()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: const Color(0xFF4E304C), // Color de fondo de la vista
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.2, // Responsive height
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 153, 94, 149),
                    borderRadius: BorderRadius.circular(401),
                  ),
                  child: const Center(
                    child: Text(
                      "¡Registrate!",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TextFieldLabel(label: 'Nombre'),
                      CustomTextField(controller: _nameController),
                      const TextFieldLabel(label: 'Numero de celular'),
                      CustomTextField(controller: _numberController),
                      const TextFieldLabel(label: 'Correo Electronico'),
                      CustomTextField(controller: _emailController),
                      const TextFieldLabel(label: 'Contraseña'),
                      CustomTextField(controller: _passwordController),
                      TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Fecha de Nacimiento',
                          filled: true,
                          prefixIcon: Icon(Icons.calendar_month_outlined),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide.none),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _acceptTerms,
                            onChanged: (bool? value) {
                              setState(() {
                                _acceptTerms = value!;
                              });
                            },
                          ),
                          const Text(
                            'Acepta los Terminos y Condiciones',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 253,
                                  253, 253), // background (button) color
                            ),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}

class TextFieldLabel extends StatelessWidget {
  final String label;

  const TextFieldLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(color: Colors.white, width: 2.0),
        color: Colors.white.withOpacity(0.1),
      ),
      child: TextField(
        controller: controller,
        style:
            const TextStyle(color: Colors.white), // Color blanco para el texto
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
