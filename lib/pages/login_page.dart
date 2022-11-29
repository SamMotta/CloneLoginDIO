import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  children: <Widget>[
                    Expanded(child: Container()),
                    Expanded(
                      flex: 6,
                      child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Faça seu login e make the change._",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  height: 36,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "E-Mail",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 90, 16, 101),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  height: 36,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _senhaController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Color.fromARGB(255, 90, 16, 101),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        child: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 90, 16, 101),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  height: 46,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (_emailController.text.trim() ==
                                "samuel@gmail.com" &&
                            _senhaController.text.trim() == "Hello") {
                          // Você tem a habilidade de voltar pra tela anterior
                          // Navigator.push(
                          /* Você não tem a habilidade de votlar pra tela anterior, 
                              se faz necessário fechar e abri o app */
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        } else {
                          debugPrint("e-Mail ou senha incorretos.");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "E-Mail ou senha incorretos.",
                              ),
                              duration: Duration(seconds: 10),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 90, 16, 101)),
                      ),
                      child: const Text(
                        "ENTRAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(color: Colors.yellow, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
