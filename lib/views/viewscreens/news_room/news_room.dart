import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trice/views/widgets/top_bar.dart';

class NewsRoom extends StatelessWidget {
  const NewsRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: TriceTopBar(),
    );
  }
}
