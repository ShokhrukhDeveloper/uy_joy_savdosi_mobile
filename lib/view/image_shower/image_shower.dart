import 'package:flutter/material.dart';
class ImageShower extends StatefulWidget {
  const ImageShower({super.key, required this.url});
  final String url;
  @override
  State<ImageShower> createState() => _ImageShowerState();
}

class _ImageShowerState extends State<ImageShower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          maxScale: 5,
          minScale: 5,
          child: Hero(
            tag: "tag1",
            child: Image.network(widget.url),
          ),
        ),
      ),
    );
  }
}
