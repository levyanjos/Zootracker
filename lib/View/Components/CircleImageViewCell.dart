import 'package:flutter/cupertino.dart';

class CircleImageViewCell extends StatefulWidget {
  final Function callBack;
  final ImageProvider image;

  CircleImageViewCell({this.callBack, this.image});

  @override
  _CircleImageViewCellState createState() => _CircleImageViewCellState(callBack: this.callBack, image: this.image);
}

class _CircleImageViewCellState extends State<CircleImageViewCell> {
  final Function callBack;
  final ImageProvider image;

  _CircleImageViewCellState({this.callBack, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: image ?? NetworkImage(
                      "https://i.imgur.com/BoN9kdC.png"))),
        ),
      ),
    );
  }
}
