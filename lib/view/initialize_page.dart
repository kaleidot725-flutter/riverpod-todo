
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InitializePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TODO")),
        body: Center(child: Text("INITIALIZE.")),
    );
  }
}