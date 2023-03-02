import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photos_album/controller/controller.dart';
import 'package:photos_album/view/AlbumDetails.dart';

class Albums extends StatelessWidget {
  Albums({Key? key}) : super(key: key);
  final controllor = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Titles of Albums'),
            actions: [
              IconButton(
                  onPressed: () => controllor.takePhoto(),
                  icon: const Icon(Icons.linked_camera)),
              const SizedBox(),
              IconButton(
                  onPressed: () => controllor.pickPhoto(),
                  icon: const Icon(Icons.add_photo_alternate_outlined))
            ],
          ),
          body: Obx(
            () => controllor.loadingStatus.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.teal,
                  ))
                : Container(
                    padding: const EdgeInsets.all(10),
                    height: Get.height,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            height: Get.height * 0.05,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            color: Colors.black45,
                            child:
                            Text(
                              controllor.album.value[index].title ?? "",
                              maxLines: 3,
                              //overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            Get.to(AlbumDetails(
                              controllor.album.value[index].id!,
                            ));
                          },
                        );
                      },
                      itemCount: controllor.album.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
          )),
    );
  }
}
