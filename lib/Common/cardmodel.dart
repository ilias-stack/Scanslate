import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardModel extends StatelessWidget {
  // ignore: non_constant_identifier_names
  late double height, img_height;
  late String? image;
  late Widget child;

  CardModel(
      {Key? key,
      required this.height,
      required this.image,
      // ignore: non_constant_identifier_names
      required this.img_height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          image != null
              ? Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: Image(
                    image: AssetImage(image!),
                    height: img_height,
                  ),
                )
              : const SizedBox.shrink(),
          child,
        ],
      ),
      width: MediaQuery.of(context).size.width / 1.3,
      height: height,
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
    );
  }
}
