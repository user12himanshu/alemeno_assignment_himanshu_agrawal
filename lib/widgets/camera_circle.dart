import 'package:amlemeno_assignment_test_himanshu_agrawal/services/camera_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraCircle extends StatefulWidget {
  final CameraService cameraService;
  const CameraCircle({super.key, required this.cameraService});

  @override
  State<CameraCircle> createState() => _CameraCircleState();
}

class _CameraCircleState extends State<CameraCircle> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    setupCamera();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      if (_controller != null) {
        _controller!.dispose();
      }
    } else if (state == AppLifecycleState.resumed) {
      setupCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Container();
    } else {
      return ClipOval(child: CameraPreview(_controller!));
    }
  }

  Future<void> setupCamera() async {
    _controller = await widget.cameraService.initCamera();
    setState(() {});
  }
}
