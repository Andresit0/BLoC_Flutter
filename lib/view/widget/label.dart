import 'package:flutter/material.dart';

Widget header({required String text}) {
  return Container(
    alignment: Alignment.center,
    color: Colors.black,
    child: Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
      maxLines: 1,
    ),
  );
}

Widget labelPrincipal({required String text}) {
  return Expanded(
    child: Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        maxLines: 1,
      ),
    ),
  );
}

Widget labelSecundary({required String text}) {
  return Expanded(
    child: Container(
      color: Colors.grey.shade400,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
        maxLines: 1,
      ),
    ),
  );
}
