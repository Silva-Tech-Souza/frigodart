import 'dart:math';

import 'package:flutter/material.dart';

class SlideListView extends StatefulWidget {
  final Widget view1;
  final Widget view2;
  final String defaultView;
  final Duration duration;
  final bool enabledSwipe;
  final Color floatingActionButtonColor;
  final bool showFloatingActionButton;
  final AnimatedIconData floatingActionButtonIcon;

  SlideListView({
    this.view1,
    this.view2,
    this.defaultView = "slides",
    this.floatingActionButtonColor = Colors.blue,
    this.showFloatingActionButton = false,
    this.enabledSwipe = false,
    this.floatingActionButtonIcon = AnimatedIcons.view_list,
    this.duration = const Duration(
      milliseconds: 400,
    ),
  });

  @override
  SlideListViewState createState() => SlideListViewState();
}

class SlideListViewState extends State<SlideListView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  PageController mainPageController = PageController();
  double currentPageValue = 0.0;
  int numpagina = 0;
  double viewportFraction = 0.95;
  String currentView = "slides";

  @override
  void initState() {
    super.initState();
    currentPageValue = 0.0;
    viewportFraction = 0.95;
    currentView = widget.defaultView ?? "slides";
    mainPageController = PageController(initialPage: 0, viewportFraction: 1.0);
    mainPageController.addListener(() {
      setState(() {
        currentPageValue = mainPageController.page;
      });
    });
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: PageView.builder(
          physics: widget.enabledSwipe
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          controller: mainPageController,
          onPageChanged: (int newPage) {
            numpagina = newPage;
            if (newPage == 0) {
              currentView = "slides";
            } else {
              currentView = "list";
            }
          },
          itemCount: 2,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0005)
                  ..rotateY((currentPageValue - index) * sqrt(2)),
                origin: currentPageValue <= index
                    ? Offset(0, 0)
                    : Offset(
                        MediaQuery.of(ctx).size.width * viewportFraction, 0),
                child: widget.view1,
              );
            } else {
              // the following code won't work as long as itemCount is set to 1
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0005)
                  ..rotateY((currentPageValue - index) * sqrt(2)),
                origin: currentPageValue <= index
                    ? Offset(0, 0)
                    : Offset(
                        MediaQuery.of(ctx).size.width * viewportFraction, 0),
                child: widget.view2,
              );
            }
          },
        ),
        onTap:(){
           if (currentView == "slides") {
                    animationController.forward();

                    mainPageController.animateToPage(1,
                        duration: widget.duration, curve: Curves.easeIn);
                  } else {
                    animationController.reverse();
                    mainPageController.animateToPage(0,
                        duration: widget.duration, curve: Curves.easeIn);
                  }
        } ,
        ),
        /*PageView.builder(
          physics: widget.enabledSwipe
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          controller: mainPageController,
          onPageChanged: (int newPage) {
            numpagina = newPage;
            if (newPage == 0) {
              currentView = "slides";
            } else {
              currentView = "list";
            }
          },
          itemCount: 2,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0005)
                  ..rotateY((currentPageValue - index) * sqrt(2)),
                origin: currentPageValue <= index
                    ? Offset(0, 0)
                    : Offset(
                        MediaQuery.of(ctx).size.width * viewportFraction, 0),
                child: widget.view1,
              );
            } else {
              // the following code won't work as long as itemCount is set to 1
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0005)
                  ..rotateY((currentPageValue - index) * sqrt(2)),
                origin: currentPageValue <= index
                    ? Offset(0, 0)
                    : Offset(
                        MediaQuery.of(ctx).size.width * viewportFraction, 0),
                child: widget.view2,
              );
            }
          },
        ),*/
        if (widget.showFloatingActionButton)
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: CircleAvatar(
              backgroundColor: widget.floatingActionButtonColor,
              child: IconButton(
                icon: AnimatedIcon(
                  icon: widget.floatingActionButtonIcon,
                  progress: animationController,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (currentView == "slides") {
                    animationController.forward();

                    mainPageController.animateToPage(1,
                        duration: widget.duration, curve: Curves.easeIn);
                  } else {
                    animationController.reverse();
                    mainPageController.animateToPage(0,
                        duration: widget.duration, curve: Curves.easeIn);
                  }
                },
              ),
            ),
          ),
      ],
    );
  }

    }
