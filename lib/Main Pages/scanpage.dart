import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan_and_translate/Main%20Pages/homepage.dart';
import 'package:scan_and_translate/Main%20Pages/translatepage.dart';

import '../Common/sidebar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static XFile? image;
  static String scanned = "";
  TextEditingController message = TextEditingController();
  // ignore: non_constant_identifier_names
  bool IsScanning = false;
  // ignore: non_constant_identifier_names
  void GetRecognisedText() async {
    String txt = "";
    final inputImage = InputImage.fromFilePath(image!.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        txt = txt + line.text + '\n';
      }
    }
    scanned = txt;
    IsScanning = !IsScanning;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    message.text = scanned;
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
              'Scan',
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
        child: image == null
            ? Column(
                children: [
                  const Divider(),
                  const SizedBox(
                    height: 140,
                  ),
                  const Text(
                    'Get text from Photos',
                    style: TextStyle(fontSize: 24, color: Colors.black87),
                  ),
                  const Image(image: AssetImage('Assets/scan.png')),
                  Container(
                      width: 170,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(242, 190, 19, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: const Center(
                                        child: Text('Choose a method')),
                                    content: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            Navigator.of(context).pop();

                                            image = await ImagePicker()
                                                .pickImage(
                                                    source: ImageSource.camera);
                                            if (image != null) {
                                              setState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 130,
                                            color: Colors.black12,
                                            width: 130,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      color: Colors.black26),
                                                ),
                                                Icon(Icons.camera_alt_outlined,
                                                    color: Colors.black26)
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Navigator.of(context).pop();
                                            image = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (image != null) {
                                              setState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 130,
                                            color: Colors.black12,
                                            width: 130,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      color: Colors.black26),
                                                ),
                                                Icon(Icons.photo,
                                                    color: Colors.black26)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Use an image  ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              )
                            ],
                          ))),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(242, 190, 19, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        onPressed: () {
                          image = null;
                          scanned = '';
                          setState(() {});
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(100, 100, 100, 0.1)),
                      child: InteractiveViewer(
                          child: Image.file(File(image!.path))),
                    ),
                  ),
                  !IsScanning
                      ? GestureDetector(
                          onTap: () {
                            IsScanning = !IsScanning;
                            setState(() {});
                            GetRecognisedText();
                          },
                          child: const Icon(
                            Icons.arrow_circle_down,
                            size: 60,
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.all(10),
                          child: const Image(
                            image: AssetImage('Assets/scanning.gif'),
                            height: 90,
                          )),
                  SizedBox(
                    child: TextFormField(
                      controller: message,
                      readOnly: true,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        focusColor: Color.fromRGBO(8, 103, 97, 1),
                        hintText: 'Output',
                        hoverColor: Color.fromRGBO(8, 103, 97, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(242, 190, 19, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  TranslatePage(
                                txt: message.text,
                              ),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          'Translate >',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => HomePage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          } else if (value == 2) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    TranslatePage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }
        },
        currentIndex: 1,
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
