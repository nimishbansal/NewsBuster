import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BoxLoader extends StatefulWidget {
  const BoxLoader({Key key}) : super(key: key);

  @override
  _BoxLoaderState createState() => _BoxLoaderState();
}

enum SquareType {
  first, // 1
  second, // 2, 4
  third, // 3, 5, 7
  fourth, // 6, 8
  fifth, // 9
}

class SquareTile extends StatelessWidget {
  final SquareType squareType;
  final double maxSide;
  final double minSide;

  final AnimationController animationController;

  const SquareTile(
      {Key key,
        @required this.squareType,
        this.maxSide = 30,
        this.minSide = 10,
        @required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 1; // change it to slow down animations while debugging
    var seq = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: maxSide, end: minSide), weight: 0.5),
      TweenSequenceItem(tween: Tween<double>(begin: minSide, end: maxSide), weight: 0.5),
    ]
    );

    var squareSizeChangeTweenAnimation = seq.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        _getBeginForSquareType(),
        _getEndForSquareType(),
        curve: Curves.linear,
      ),
    ),);

    return AnimatedBuilder(
      animation: squareSizeChangeTweenAnimation,
      builder: (BuildContext context, Widget child) {
        var side = squareSizeChangeTweenAnimation.value;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: maxSide,
            width: maxSide,
            child: Center(
              child: Container(
                width: side,
                height: side,
                color: getColor(),
              ),
            ),
          ),
        );
      },
    );
  }

  Color getColor() {
    if (squareType == SquareType.first) {
      return Colors.red;
    } else if (squareType == SquareType.second) {
      return Colors.yellow;
    } else if (squareType == SquareType.third) {
      return Colors.orange;
    } else if (squareType == SquareType.fourth) {
      return Colors.green;
    } else if (squareType == SquareType.fifth) {
      return Colors.blueGrey;
    }
    return Colors.black;
  }

  double _getBeginForSquareType() {
    if (squareType == SquareType.first) {
      return 0;
    } else if (squareType == SquareType.second) {
      return 0.1;
    } else if (squareType == SquareType.third) {
      return 0.2;
    } else if (squareType == SquareType.fourth) {
      return 0.3;
    } else if (squareType == SquareType.fifth) {
      return 0.4;
    }
    return 0;
  }

  double _getEndForSquareType() {
    return _getBeginForSquareType() +  0.3;
  }
}


/// 1 2 3
/// 4 5 6
/// 7 8 9
///
/// (1), (2, 4), (3, 5, 7), (6, 8), (9)
class _BoxLoaderState extends State<BoxLoader>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, value: 0, duration: Duration(milliseconds: 2000))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 2,
      heightFactor: 2,
      child: Container(
        color: Colors.white,
        child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        squareType: SquareType.first,
                        animationController: animationController,
                      ),
                      SquareTile(
                          squareType: SquareType.second,
                          animationController: animationController),
                      SquareTile(
                          squareType: SquareType.third,
                          animationController: animationController),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                          squareType: SquareType.second,
                          animationController: animationController),
                      SquareTile(
                          squareType: SquareType.third,
                          animationController: animationController),
                      SquareTile(
                          squareType: SquareType.fourth,
                          animationController: animationController),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                          squareType: SquareType.third,
                          animationController: animationController),
                      SquareTile(
                          squareType: SquareType.fourth,
                          animationController: animationController),
                      SquareTile(
                          squareType: SquareType.fifth,
                          animationController: animationController),
                    ],
                  )
                ],
              ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}