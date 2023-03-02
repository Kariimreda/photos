import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photos_album/controller/controller.dart';

class AlbumDetails extends StatefulWidget {
  final int albumId;
  AlbumDetails(this.albumId);

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  final controller = Get.put(Controller());

  @override
  initState() {
    Future.delayed(
        Duration.zero, () => controller.getDetailsOfAlbum(id: widget.albumId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  appBar: AppBar(),
        body: Obx(() => controller.loadingStatus.value
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.teal,
              ))
            : Container(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: Get.height,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child:
                            Image.network(controller.deatilesalbum[index].url!),
                        onTap: () {
                          final imageProvider = Image.network(
                                  controller.deatilesalbum[index].url!)
                              .image;
                          showImageViewer(context, imageProvider,
                              onViewerDismissed: () {
                            print("dismissed");
                          });
                        },
                      );
                    },
                    itemCount: controller.deatilesalbum.length,
                  ),
                ),
              )),
      ),
    );
  }
}
