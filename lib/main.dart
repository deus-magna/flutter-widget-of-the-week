import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _clipRRectAll(),
            SizedBox(
              height: 20.0,
            ),
            _clipRRectOnly(),
            SizedBox(
              height: 20.0,
            ),
            _clipOval(),
            SizedBox(
              height: 20.0,
            ),
            _clipPath(MyCustomClipper()),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: <Widget>[
                _clipPath(MyStarClipper()),
                _clipPath(MyStar2Clipper()),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            _clipPath(MyDiamondClipper()),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _clipRRectAll() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Image(
        image: AssetImage('assets/flutter-background.jpg'),
      ),
    );
  }

  Widget _clipRRectOnly() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
      child: Image(
        image: AssetImage('assets/flutter-background.jpg'),
      ),
    );
  }

  Widget _clipOval() {
    return ClipOval(
      child: Image(
        image: AssetImage('assets/flutter-background.jpg'),
      ),
    );
  }

  Widget _clipPath(CustomClipper clipper) {
    return ClipPath(
      clipper: clipper,
      child: Image(
        image: AssetImage('assets/flutter-background.jpg'),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height * 0.5);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class MyStarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width * 0.5, 0)
      ..lineTo(0, size.height * 0.8)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width * 0.5, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class MyStar2Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.2)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(0, size.height * 0.2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class MyDiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width * 0.3, 0)
      ..lineTo(size.width * 0.1, size.height * 0.3)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width * 0.9, size.height * 0.3)
      ..lineTo(size.width * 0.7, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
