import 'package:flutter/material.dart';
import 'package:scan_and_translate/Common/usermanager.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// ignore: must_be_immutable
class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();

  // ignore: non_constant_identifier_names
  static void SendMail(
      String email, String subj, String messg, BuildContext context) async {
    String username = 'este.acc@gmail.com';
    String password = 'iliasilias';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(email)
      ..recipients.add('pay.ilias2002@gmail.com')
      ..subject = 'Received at ${DateTime.now()}\n'
      ..html =
          "<h1>The sender email is <strong>$email</strong></h1>\n<h4>$subj</h4>\n<h5>$messg</h5>";

    await send(message, smtpServer)
        .then((value) => Navigator.of(context).pop())
        .onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please try again !"),
        duration: Duration(milliseconds: 300),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    MyUsers.islogged() ? email.text = MyUsers.infos()['email'] : true;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Image(
              image: AssetImage('Assets/contact.png'),
              height: 170,
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        focusColor: Color.fromRGBO(8, 103, 97, 1),
                        prefixIcon: Icon(Icons.email),
                        label: Text('Email'),
                        hoverColor: Color.fromRGBO(8, 103, 97, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: subject,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        focusColor: Color.fromRGBO(8, 103, 97, 1),
                        prefixIcon: Icon(Icons.subject),
                        label: Text('Subject'),
                        hoverColor: Color.fromRGBO(8, 103, 97, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: message,
                      maxLines: 10,
                      maxLength: 1000,
                      decoration: const InputDecoration(
                        focusColor: Color.fromRGBO(8, 103, 97, 1),
                        hintText: 'Message',
                        hoverColor: Color.fromRGBO(8, 103, 97, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        color: const Color.fromRGBO(242, 190, 19, 1),
                        child: TextButton(
                            onPressed: () {
                              SendMail(email.text, subject.text, message.text,
                                  context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Send  ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Icon(
                                  Icons.send,
                                  color: Colors.white,
                                )
                              ],
                            )))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
