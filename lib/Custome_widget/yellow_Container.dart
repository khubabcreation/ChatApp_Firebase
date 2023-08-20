import 'package:flutter/cupertino.dart';

class yellowContainer extends StatefulWidget {
  yellowContainer(
      {this.boxDecoration,
      this.radius,
      this.data_for_Container,
      this.inside_txt,
      this.height,
      this.width,
      Key? key})
      : super(key: key);
  double? height;
  double? width;
  String? inside_txt;
  Widget? data_for_Container;
  BorderRadiusGeometry? radius;
  Decoration? boxDecoration;

  @override
  State<yellowContainer> createState() => _yellowContainerState(height, width);
}

class _yellowContainerState extends State<yellowContainer> {
  _yellowContainerState(this.height, this.width);

  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: widget.boxDecoration == null
          ? BoxDecoration(
              borderRadius: widget.radius,
              color: Color.fromARGB(255, 251, 166, 53))
          : widget.boxDecoration,
      child: widget.data_for_Container,
    );
  }
}
