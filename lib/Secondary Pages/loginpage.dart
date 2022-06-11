import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pageController = PageController(initialPage: 0);
  TextEditingController email1 = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email2 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  final auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
  String Gender = "Male";
  List<bool> selection = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: const Color.fromARGB(255, 247, 217, 126),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 7,
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(209, 0, 0, 0),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 350,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromRGBO(242, 190, 19, 1),
                              fontSize: 26,
                            ),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          SizedBox(
                            width: 280,
                            height: 55,
                            child: TextField(
                              controller: email1,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              decoration: const InputDecoration(
                                  label: Text('Email'),
                                  prefixIcon: Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white38),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      )),
                                  fillColor: Colors.white24,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 280,
                            height: 55,
                            child: TextField(
                              controller: pass1,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              decoration: const InputDecoration(
                                  label: Text('Password'),
                                  prefixIcon: Icon(Icons.password),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white38),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      )),
                                  fillColor: Colors.white24,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 190, 19, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 80,
                                  child: TextButton(
                                      onPressed: () {
                                        auth
                                            .signInWithEmailAndPassword(
                                                email: email1.text.trim(),
                                                password: pass1.text)
                                            .then((vaue) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("Connected !"),
                                            duration:
                                                Duration(milliseconds: 1500),
                                          ));
                                          Navigator.of(context).pop();
                                        }).onError((error, stackTrace) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("Unable to connect"),
                                            duration:
                                                Duration(milliseconds: 1500),
                                          ));
                                        });
                                      },
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 190, 19, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: TextButton(
                                      onPressed: () {
                                        _pageController.animateToPage(1,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn);
                                      },
                                      child: const Text(
                                        'Create an account',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 247, 217, 126),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 7,
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(209, 0, 0, 0),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 560,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Register',
                            style: TextStyle(
                              color: Color.fromRGBO(242, 190, 19, 1),
                              fontSize: 26,
                            ),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          SizedBox(
                            width: 280,
                            height: 55,
                            child: TextField(
                              controller: name,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              decoration: const InputDecoration(
                                  label: Text('Full Name'),
                                  prefixIcon: Icon(Icons.person),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white38),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      )),
                                  fillColor: Colors.white24,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 280,
                            height: 55,
                            child: TextField(
                              controller: email2,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              decoration: const InputDecoration(
                                  label: Text('Email'),
                                  prefixIcon: Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white38),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      )),
                                  fillColor: Colors.white24,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 280,
                            decoration: const BoxDecoration(
                                color: Colors.white24,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              children: [
                                const Text(
                                  'Gender',
                                ),
                                const SizedBox(
                                    width: 120,
                                    child: Divider(
                                      color: Colors.black,
                                    )),
                                ToggleButtons(
                                    fillColor: Colors.white24,
                                    color: Colors.white24,
                                    selectedBorderColor: Colors.white,
                                    selectedColor: Colors.white,
                                    renderBorder: false,
                                    borderRadius: BorderRadius.circular(20),
                                    onPressed: (int a) {
                                      // ignore: non_constant_identifier_names
                                      int Found = -1;
                                      for (int i = 0;
                                          i < selection.length;
                                          i++) {
                                        if (selection[i] == true) {
                                          Found = i;
                                        }
                                      }
                                      Gender = Found == 1 ? "Male" : "Female";

                                      setState(() {
                                        for (int i = 0;
                                            i < selection.length;
                                            i++) {
                                          selection[i] = !selection[i];
                                        }
                                      });
                                    },
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 30, left: 30),
                                        child: Text(
                                          'Male',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 30, left: 30),
                                        child: Text(
                                          'Female',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                    isSelected: selection),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 280,
                            height: 55,
                            child: TextField(
                              controller: pass2,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              decoration: const InputDecoration(
                                  label: Text('Password'),
                                  prefixIcon: Icon(Icons.password_outlined),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white38),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      )),
                                  fillColor: Colors.white24,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 190, 19, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 80,
                                  child: TextButton(
                                      onPressed: () {
                                        auth.createUserWithEmailAndPassword(
                                            email: email2.text.trim(),
                                            password: pass2.text);
                                      },
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 190, 19, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: TextButton(
                                      onPressed: () {
                                        _pageController.animateToPage(0,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn);
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
          controller: _pageController,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: const EdgeInsets.only(top: 55, left: 20),
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.keyboard_arrow_left_outlined)),
          ),
        )
      ],
    ));
  }
}
