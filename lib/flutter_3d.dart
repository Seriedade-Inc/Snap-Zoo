import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Modelo 3D',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste Tamanduá 3D'),
          backgroundColor: Colors.pink[200],
        ),
        body: Container(
          color: Colors.pink[50],
          child: const Center(
            child: ModelViewer(
              src: "assets/images/anteater.glb",
              alt: "Modelo 3D do Tamanduá",
              ar: false,
              autoRotate: true,
              cameraControls: true,
              disableZoom: false,
              disableTap: false,
            ),
          ),
        ),
      ),
    );
  }
}