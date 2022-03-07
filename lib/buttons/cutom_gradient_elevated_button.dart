import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          // height: ,
          // width: ,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 240, 83, 25),
                  Color(0xFFFFA000),
                ],
                stops: [
                  0.0,
                  1.0
                ],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.height * 0.03),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
              onTap: () {},
              child: const Center(
                heightFactor: 2.5,
                child: Text(
                  "buttontext",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
