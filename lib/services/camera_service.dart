import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  late List<CameraDescription> _cameras;
  CameraController? controller;
  int _selected = 0;

  Future<CameraController?> initCamera() async {
    await [
      Permission.camera,
    ].request();
    _cameras = await availableCameras();
    controller = await selectCamera();
    return controller;
  }

  Future<CameraController> selectCamera() async {
    var controller = CameraController(_cameras[_selected], ResolutionPreset.low,
        enableAudio: false);
    await controller.initialize();
    controller.setFlashMode(FlashMode.off);
    return controller;
  }

  Future<XFile> takePicture() async {
    if (controller == null || !controller!.value.isInitialized) {
      throw Exception('No camera initialized');
    }
    XFile file = await controller!.takePicture();
    return file;
  }
}
