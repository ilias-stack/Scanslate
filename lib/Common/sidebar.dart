import 'package:flutter/material.dart';
import 'package:scan_and_translate/Common/usermanager.dart';
import 'package:scan_and_translate/Secondary%20Pages/contact.dart';
import 'package:scan_and_translate/Secondary%20Pages/loginpage.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  var etat = MyUsers.islogged();
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Drawer(
        child: !etat
            ? Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 27,
                    ),
                    Column(
                      children: const [
                        Image(
                          image: AssetImage('Assets/Avatar.png'),
                          height: 140,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Not connected',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 47,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (ctx) => const LoginPage()))
                            .then((value) {
                          Navigator.of(context).pop();
                          setState(() {
                            etat = MyUsers.islogged();
                          });
                        });
                      },
                      subtitle: const Text(
                          'Login to your account and sync your data',
                          style: TextStyle(fontSize: 10)),
                      leading: const Icon(
                        Icons.login,
                        size: 35,
                      ),
                      title:
                          const Text('Login', style: TextStyle(fontSize: 20)),
                    ),
                    const Divider(height: 0),
                    const Divider(
                      height: 3,
                    ),
                    const Divider(
                      height: 0,
                    ),
                    const Divider(
                      height: 3,
                    ),
                    ListTile(
                      subtitle: const Text('We are here to help',
                          style: TextStyle(fontSize: 10)),
                      leading: const Icon(
                        Icons.help_center_outlined,
                        size: 35,
                      ),
                      title: const Text('Contact-us',
                          style: TextStyle(fontSize: 20)),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => ContactPage()));
                      },
                    ),
                    const Divider(),
                    const Spacer(),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: Row(
                            children: const [
                              Icon(Icons.info_outline),
                              Text('  About-Us',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                    title: const Text('Who are we ?'),
                                    content: SizedBox(
                                      height: 300,
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Welcome to Scanslate, your number one source for all things . We're dedicated to providing you the very best of Scanning and translating in the same product backed by google .",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const SizedBox(
                                            height: 26,
                                          ),
                                          const Align(
                                            alignment: Alignment.center,
                                            child: Text("Social Media",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        115, 113, 113, 113))),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await launchUrl(Uri(
                                                      path: 'ilias_z3',
                                                      host: 'www.instagram.com',
                                                      scheme: 'https'));
                                                },
                                                child: const Image(
                                                  image: AssetImage(
                                                      'Assets/instagram.png'),
                                                  height: 50,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await launchUrl(Uri(
                                                      path: 'IliasZaazaa',
                                                      host: 'www.twitter.com',
                                                      scheme: 'https'));
                                                },
                                                child: const Image(
                                                  image: AssetImage(
                                                      'Assets/twitter.png'),
                                                  height: 50,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Colors.white,
                      Color.fromARGB(255, 237, 235, 195),
                      Colors.white
                    ])),
              )
            : Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 27,
                    ),
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('Assets/male.png'),
                          height: 140,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          MyUsers.infos()['email'],
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 47,
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        MyUsers.Logout();
                        setState(() {
                          etat = MyUsers.islogged();
                        });
                      },
                      subtitle: const Text('Logout from your account ',
                          style: TextStyle(fontSize: 10)),
                      leading: const Icon(
                        Icons.logout,
                        size: 35,
                      ),
                      title:
                          const Text('Logout', style: TextStyle(fontSize: 20)),
                    ),
                    const Divider(height: 0),
                    const Divider(
                      height: 3,
                    ),
                    const Divider(
                      height: 0,
                    ),
                    const Divider(
                      height: 3,
                    ),
                    ListTile(
                      subtitle: const Text('We are here to help',
                          style: TextStyle(fontSize: 10)),
                      leading: const Icon(
                        Icons.help_center_outlined,
                        size: 35,
                      ),
                      title: const Text('Contact-us',
                          style: TextStyle(fontSize: 20)),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => ContactPage()));
                      },
                    ),
                    const Divider(),
                    const Spacer(),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: Row(
                            children: const [
                              Icon(Icons.info_outline),
                              Text('  About-Us',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                    title: const Text('Who are we ?'),
                                    content: SizedBox(
                                      height: 300,
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Welcome to Scanslate, your number one source for all things . We're dedicated to providing you the very best of Scanning and translating in the same product backed by google .",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const SizedBox(
                                            height: 26,
                                          ),
                                          const Align(
                                            alignment: Alignment.center,
                                            child: Text("Social Media",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        115, 113, 113, 113))),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await launchUrl(Uri(
                                                      path: 'ilias_z3',
                                                      host: 'www.instagram.com',
                                                      scheme: 'https'));
                                                },
                                                child: const Image(
                                                  image: AssetImage(
                                                      'Assets/instagram.png'),
                                                  height: 50,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await launchUrl(Uri(
                                                      path: 'IliasZaazaa',
                                                      host: 'www.twitter.com',
                                                      scheme: 'https'));
                                                },
                                                child: const Image(
                                                  image: AssetImage(
                                                      'Assets/twitter.png'),
                                                  height: 50,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Colors.white,
                      Color.fromARGB(255, 237, 235, 195),
                      Colors.white
                    ])),
              ),
      );
    } catch (e) {
      return Drawer(
          child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 27,
            ),
            Column(
              children: const [
                Image(
                  image: AssetImage('Assets/Avatar.png'),
                  height: 140,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Not connected',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 47,
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(
                        MaterialPageRoute(builder: (ctx) => const LoginPage()))
                    .then((value) {
                  Navigator.of(context).pop();

                  setState(() {
                    etat = MyUsers.islogged();
                  });
                });
              },
              subtitle: const Text('Login to your account and sync your data',
                  style: TextStyle(fontSize: 10)),
              leading: const Icon(
                Icons.login,
                size: 35,
              ),
              title: const Text('Login', style: TextStyle(fontSize: 20)),
            ),
            const Divider(height: 0),
            const Divider(
              height: 3,
            ),
            const Divider(
              height: 0,
            ),
            const Divider(
              height: 3,
            ),
            ListTile(
              subtitle: const Text('We are here to help',
                  style: TextStyle(fontSize: 10)),
              leading: const Icon(
                Icons.help_center_outlined,
                size: 35,
              ),
              title: const Text('Contact-us', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => ContactPage()));
              },
            ),
            const Divider(),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline),
                      Text('  About-Us', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Close',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                            title: const Text('Who are we ?'),
                            content: SizedBox(
                              height: 300,
                              child: Column(
                                children: [
                                  const Text(
                                    "Welcome to Scanslate, your number one source for all things . We're dedicated to providing you the very best of Scanning and translating in the same product backed by google .",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text("Social Media",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                115, 113, 113, 113))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri(
                                              path: 'ilias_z3',
                                              host: 'www.instagram.com',
                                              scheme: 'https'));
                                        },
                                        child: const Image(
                                          image: AssetImage(
                                              'Assets/instagram.png'),
                                          height: 50,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri(
                                              path: 'IliasZaazaa',
                                              host: 'www.twitter.com',
                                              scheme: 'https'));
                                        },
                                        child: const Image(
                                          image:
                                              AssetImage('Assets/twitter.png'),
                                          height: 50,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            )
          ],
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.white,
              Color.fromARGB(255, 237, 235, 195),
              Colors.white
            ])),
      ));
    }
  }
}
