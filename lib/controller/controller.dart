import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photos_album/controller/dioHelper.dart';
import 'package:photos_album/model/AlbumModel.dart';
import 'package:photos_album/model/detailsModle.dart';

class Controller extends GetxController {
  RxList<Albums> album = RxList();
  RxBool loadingStatus = true.obs;

  void getAlbums() async {
    await DioHelper.getData(url: "https://jsonplaceholder.typicode.com/albums/")
        .then((value) {
      print(value.data);
      for (var index in value.data) {
        album.add(Albums.fromJson(index));
      }
    });
    loadingStatus.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getAlbums();
  }

  RxList<detailsModel> deatilesalbum = RxList();

  getDetailsOfAlbum({required id}) async {
    loadingStatus.value = true;
    await DioHelper.getData(
            url: "https://jsonplaceholder.typicode.com/albums/$id/photos")
        .then((value) {
      for (var index in value.data) {
        deatilesalbum.add(detailsModel.fromJson(index));
      }
    });
    loadingStatus.value = false;
  }

  late Rxn<XFile> image;
  void takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    image.value = photo as XFile;
  }

  late Rxn<XFile> photo;

  void pickPhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    photo.value = image as XFile;
  }
}
