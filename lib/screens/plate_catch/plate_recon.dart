import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlateRecon extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class PlateReconState extends State<PlateRecon> {

Future<String> getData() async {
var response = await http.post(
  Uri.encodeFull("https://api.cloudinary.com/v1_1/racar/image/upload")
);

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}