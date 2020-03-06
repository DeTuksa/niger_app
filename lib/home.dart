import 'package:flutter/material.dart';
import 'package:niger_app/globals/colors.dart';
import 'package:niger_app/globals/screen_size.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: kWidth(context),
              height: 90,
              color: kAlternateColorDark300,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(height: 0.6),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black))),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: kWidth(context),
                    color: kAlternateColorDark10,
                  ),
                  ClipPath(
                    clipper: ContourClipper(ContourLayer.LAYER_THREE),
                    child: Container(
                      height: double.infinity,
                      width: kWidth(context),
                      color: kAlternateColorDark50,
                    ),
                  ),
                  ClipPath(
                    clipper: ContourClipper(ContourLayer.LAYER_TWO),
                    child: Container(
                      height: double.infinity,
                      width: kWidth(context),
                      color: kAlternateColorDark100,
                    ),
                  ),
                  ClipPath(
                    clipper: ContourClipper(ContourLayer.LAYER_ONE),
                    child: Container(
                      height: double.infinity,
                      width: kWidth(context),
                      color: kAlternateColorDark200,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: Padding(
        padding: EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(
            Icons.menu,
            size: 30,
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Text("Lorem ipsum", style: TextStyle(fontSize: 25)),
      ),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30, right: 10, left: 10),
          child: Icon(
            Icons.supervisor_account,
            size: 30,
          ),
        )
      ],
    );
  }
}

enum ContourLayer { LAYER_ONE, LAYER_TWO, LAYER_THREE }

class ContourClipper extends CustomClipper<Path> {
  ContourLayer layer;
  ContourClipper(this.layer);
  @override
  Path getClip(Size size) {
    final path = Path();
    if (layer == ContourLayer.LAYER_ONE) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height * 0.6);
      path.cubicTo(size.width * 0.3, size.height * 0.8, size.width * 0.5,
          size.height * 0.4, size.width, size.height * 0.7);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }
    if (layer == ContourLayer.LAYER_TWO) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height * 0.7);
      path.cubicTo(size.width * 0.3, size.height * 0.85, size.width * 0.5,
          size.height * 0.5, size.width, size.height * 0.9);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }

    if (layer == ContourLayer.LAYER_THREE) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height * 0.8);
      path.cubicTo(size.width * 0.3, size.height, size.width * 0.5,
          size.height * 0.6, size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }
    return path;
  }

  @override
  bool shouldReclip(ContourClipper oldClipper) => true;
}