import 'package:flutter/material.dart';
import 'package:pokemonmonstersapp/screens/monster_screen.dart';
import 'package:pokemonmonstersapp/models/monster_model.dart';

class MonsterListingScreen extends StatefulWidget {
  @override
  _MonsterListingScreenState createState() => _MonsterListingScreenState();
}

class _MonsterListingScreenState extends State<MonsterListingScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.search,
              size: 32,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Pokemon Monsters\n",
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1.2),
                ),
                TextSpan(
                  text: "of Derrick",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      letterSpacing: 1.1),
                ),
              ]),
            ),
            Expanded(
                child: PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              children: <Widget>[
                for (int i = 0; i < monsters.length; i++)
                  MonsterScreen(
                      monster: monsters[i],
                      pageController: _pageController,
                      currentPage: i),
              ],
            ))
        ],
      ),
          )),
    );
  }
}
