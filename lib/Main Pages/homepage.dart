// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scan_and_translate/Common/cardmodel.dart';
import 'package:scan_and_translate/Common/sidebar.dart';
import 'package:scan_and_translate/Main%20Pages/scanpage.dart';
import 'package:scan_and_translate/Main%20Pages/translatepage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: non_constant_identifier_names
  final InfoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
              'Scan & Translate',
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
            const SizedBox(
              height: 30,
            ),
            CardModel(
                img_height: 30,
                height: 250,
                image: 'Assets/iconI.png',
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      'Scanslate in a nutshell',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                    )),
                    const Divider(),
                    const Text(
                        "  Is a mobile app that offers scanning and translating services for free.Backed by google's services to offer the best possible performance and security for it's end users"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      'Why are you using Scanslate ?',
                      style: TextStyle(fontSize: 18),
                    )),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 7), // changes position of shadow
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              const ScanPage(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Scan',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 251, 213, 96),
                                  ),
                                ))),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 7), // changes position of shadow
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              TranslatePage(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Translate',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 251, 213, 96),
                                  ),
                                )))
                      ],
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage('Assets/privacy.png'),
                    height: 40,
                  ),
                  Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                    )),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        "  This part is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\n\n  If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\n\n  The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Memespace unless otherwise defined in this Privacy Policy."),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 7), // changes position of shadow
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                            onPressed: () async {
                              final context = InfoKey.currentContext!;
                              await Scrollable.ensureVisible(context,
                                  duration: const Duration(seconds: 1));
                            },
                            child: const Text(
                              'Read more',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 213, 96),
                              ),
                            )))
                  ]),
                ],
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 450,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 7), // changes position of shadow
                  )
                ],
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 236, 198, 82),
                      Color.fromARGB(255, 251, 213, 96),
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              key: InfoKey,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, top: 5),
                    child: const Image(
                      image: AssetImage('Assets/info.png'),
                      height: 40,
                    ),
                  ),
                  Column(children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      'Information Collection',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                    )),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "  For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to email. The information that we request will be retained by us and used as described in this privacy policy.\n\n  The app does use third party services that may collect information used to identify you")
                  ]),
                ],
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 250,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 7), // changes position of shadow
                  )
                ],
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 236, 198, 82),
                      Color.fromARGB(255, 251, 213, 96),
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(
              height: 30,
            )
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
        currentIndex: 0,
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
