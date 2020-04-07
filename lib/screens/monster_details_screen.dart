import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:pokemonmonstersapp/models/monster_model.dart';
import 'package:video_player/video_player.dart';

class MonsterDetailsScreen extends StatefulWidget {
  final double _expandedBottomSheetBottomPosition = 0;
  final double _collapsedBottomSheetBottomPosition = -250;
  final double _completeCollapsedBottomSheetBottomPosition = -330;
  final MonsterModel monster;

  MonsterDetailsScreen({Key key, this.monster}) : super(key: key);

  @override
  _MonsterDetailsScreenState createState() => _MonsterDetailsScreenState();
}

class _MonsterDetailsScreenState extends State<MonsterDetailsScreen>
    with AfterLayoutMixin<MonsterDetailsScreen> {
  VideoPlayerController _videoPlayerController;
  double _bottomSheetBottomPosition = -330;
  bool isCollapsed = false;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(
        widget.monster.videoClipPath);

    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(false);
    _videoPlayerController.initialize().then((_) => setState(() {}));
//    _videoPlayerController.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: widget.monster.name,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.monster.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.close),
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      setState(() {
                        _bottomSheetBottomPosition =
                            widget._completeCollapsedBottomSheetBottomPosition;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                      tag: "image-${widget.monster.name}",
                      child: Image.asset(widget.monster.imagePath,
                          height: screenHeight * 0.45)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                      tag: "name-${widget.monster.name}",
                      child: Material(
                          color: Colors.transparent,
                          child: Container(
                              child: Text(widget.monster.name,
                                  style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white.withOpacity(0.8),
                                      letterSpacing: 1.2))))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(widget.monster.description,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.8),
                      )),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: _bottomSheetBottomPosition,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: _onTap,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      height: 80,
                      child: Text(
                        "Clips",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _clipsWidget(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTap() {
    setState(() {
      _bottomSheetBottomPosition = isCollapsed
          ? widget._expandedBottomSheetBottomPosition
          : widget._collapsedBottomSheetBottomPosition;
      isCollapsed = !isCollapsed;
    });
  }

  Widget _clipsWidget(BuildContext context) {
    return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisSpacing: 0,
          padding: EdgeInsets.all(30),
          crossAxisCount: 3,
          children: List.generate(widget.monster.gifPaths.length, (index) {
            return roundedContainer(context, widget.monster.gifPaths[index]);
          }),
        ));
  }

  Widget roundedContainer(BuildContext context, gifPath) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                gifPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_videoPlayerController),
                      _PlayPauseOverlay(
                        controller: _videoPlayerController,
                      ),
                      VideoProgressIndicator(
                        _videoPlayerController,
                        allowScrubbing: true,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        _bottomSheetBottomPosition = widget._collapsedBottomSheetBottomPosition;
      });
    });
  }
}

class _PlayPauseOverlay extends StatefulWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  __PlayPauseOverlayState createState() => __PlayPauseOverlayState();
}

class __PlayPauseOverlayState extends State<_PlayPauseOverlay> {
  bool videoIsPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: widget.controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      videoIsPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              videoIsPlaying = !videoIsPlaying;
            });
            widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play();
          },
        ),
      ],
    );
  }
}
