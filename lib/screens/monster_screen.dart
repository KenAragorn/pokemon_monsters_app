import 'package:flutter/material.dart';
import 'package:pokemonmonstersapp/models/monster_model.dart';
import 'package:pokemonmonstersapp/screens/monster_details_screen.dart';

class MonsterScreen extends StatelessWidget {
  final MonsterModel monster;
  final PageController pageController;
  final int currentPage;

  MonsterScreen({Key key, this.monster, this.pageController, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) =>
                    MonsterDetailsScreen(monster: monster)));
      },
      child: AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            double value = 1;
            if (pageController.position.haveDimensions) {
              value = pageController.page - currentPage;
              value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
            }

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: MonsterCardBackgroundClipper(),
                    child: Hero(
                        tag: "background-${monster.name}",
                        child: Container(
                          width: 0.9 * screenWidth,
                          height: 0.6 * screenHeight,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: monster.colors,
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft)),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.5),
                  child: Hero(
                      tag: "image-${monster.name}",
                      child: Image.asset(
                        monster.imagePath,
                        height: screenHeight * 0.5 * value,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Hero(
                          tag: "name-${monster.name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              monster.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 34,
                                  color: Colors.white.withOpacity(0.8),
                                  letterSpacing: 1.2),
                            ),
                          )),
                      Text(
                        "Tap to Read more",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.white.withOpacity(0.8)),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class MonsterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double distance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - distance);
    path.quadraticBezierTo(1, size.height - 1, distance, size.height);
    path.lineTo(size.width - distance, size.height);
    path.quadraticBezierTo(
        size.width + 1, size.height - 1, size.width, size.height - distance);
    path.lineTo(size.width, distance);
    path.quadraticBezierTo(
        size.width - 1, 0, size.width - distance - 5, distance / 3);
    path.lineTo(distance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
