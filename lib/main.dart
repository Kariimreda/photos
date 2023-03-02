import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:photos_album/controller/dioHelper.dart';
import 'package:photos_album/view/albums.dart';


void main() {
  runApp(const PhotoAlbums());
  DioHelper.init();
}

class PhotoAlbums extends StatelessWidget {
  const PhotoAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.teal),
          primaryColor: Colors.tealAccent),
      home: Albums(),
    );
  }
}
