import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CounterController extends GetxController {
  //for screen 1
  RxInt counter = 1.obs;
  //for screen 2
  RxDouble opacity = .4.obs;

  RxBool notification = false.obs;

  //obs = observables . Obs knows that this value will going to change and obs is reactive.

  RxList<String> fruitList =
      ['Orange', 'Mangoes', 'Apple', 'Banana', 'PineApple'].obs;

  RxList tempFruitList = [].obs;

  //for page 3

  incrementCounter() {
    //for screen one
    counter.value++;
    //we have to increment the value of counter i.e for 1.obs not the whole inrementCounter Function;
    print(counter.value);
  }

  setOpacity(double values) {
    opacity.value = values;
  }

  setNotification(bool values) {
    notification.value = values;
  }

  addFavouriteList(String value) {
    tempFruitList.add(value);
  }

  removeFavouriteList(String value) {
    tempFruitList.remove(value);
  }
}

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    // final image2 = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
      // imagePath.value = image2!.path.toString();
    }
  }

  Future getImagefromCamera() async {
    final ImagePicker _picker = ImagePicker();

    final image2 = await _picker.pickImage(source: ImageSource.camera);
    if (image2 != null) {
      imagePath.value = image2.path.toString();
    }
  }
}
