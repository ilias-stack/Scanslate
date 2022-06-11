import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:scan_and_translate/Main%20Pages/homepage.dart';
import 'package:scan_and_translate/Main%20Pages/scanpage.dart';
import 'package:translator/translator.dart';

import '../Common/sidebar.dart';

// ignore: must_be_immutable
class TranslatePage extends StatefulWidget {
  late String? txt;
  TranslatePage({Key? key, this.txt}) : super(key: key);

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: non_constant_identifier_names
  Future<void> TranslateText(String input) async {
    final lIdentifier = await LanguageIdentifier(confidenceThreshold: 0.7)
        .identifyLanguage(input);
    translator.translate(input, from: lIdentifier.toLowerCase()).then((s) {
      translation = s.toString();
    });
  }

  final translator = GoogleTranslator();
  String translation = "";
  // ignore: non_constant_identifier_names
  TextEditingController SourceText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.txt != '' || widget.txt != null) {
      SourceText.text = widget.txt ?? "";
    }
    return Scaffold(
      drawer: const SideBar(),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(top: 8, left: 7),
          child: CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.apps_sharp,
                  size: 27,
                  color: Colors.grey,
                ),
              )),
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.only(right: 25),
          margin: const EdgeInsets.only(top: 5),
          child: const Center(
            child: Text(
              'Translate',
              style: TextStyle(
                  fontFamily: 'Londrina Shadow',
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Container(
              margin: const EdgeInsets.all(40),
              child: const Image(
                image: AssetImage('Assets/TransIcon.png'),
                height: 80,
              ),
            ),
            SizedBox(
              child: TextFormField(
                controller: SourceText,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Text',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.2,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 190, 19, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () async {
                    await TranslateText(SourceText.text).then((value) => {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Center(
                                      child: Text(
                                    'translation',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )),
                                  content: SizedBox(
                                    height: 250,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            translation == ""
                                                ? "No valid translation"
                                                : translation,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 19, 49, 242),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: TextButton(
                                                onPressed: () {
                                                  Clipboard.setData(
                                                          ClipboardData(
                                                              text:
                                                                  translation))
                                                      .then((value) {
                                                    Fluttertoast.showToast(
                                                        msg: "Text copied !",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.grey,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  });
                                                },
                                                child: const Text(
                                                  'Copy text',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                        });
                  },
                  child: const Text(
                    'See translation',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const ScanPage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          } else if (value == 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => HomePage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }
        },
        currentIndex: 2,
        selectedItemColor: const Color.fromARGB(255, 236, 198, 82),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate_outlined),
            label: 'Translate',
          ),
        ],
      ),
    );
  }
}
