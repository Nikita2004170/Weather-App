import "package:flutter/material.dart";

void main() {
  runApp(
    const Text(
      'hello nikita how ARE YOU hows your day',
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontFamily: 'New Amsterdam',
      ),
      //overflow: TextOverflow.ellipsis,
      //softWrap: true,
      textScaleFactor: 3,
      //maxLines: 4,
      //semanticsLabel: 'introduction of nikita sachan',
    ),
  );
}
