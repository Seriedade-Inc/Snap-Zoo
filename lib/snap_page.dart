// lib/snap_page.dart
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class SnapPage extends StatelessWidget {
  const SnapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamanduá em AR'),
        backgroundColor: const Color(0xFFFD98CD),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFCAF1), Color(0xFFFD98CD)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Container do modelo 3D com suporte a AR
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: const ModelViewer(
                      src: "assets/images/anteater.glb",
                      alt: "Tamanduá 3D",
                      ar: true,                    // Habilita o botão AR
                      autoRotate: true,
                      cameraControls: true,
                      disableZoom: false,
                      disableTap: false,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // DESCRIÇÃO DO ANIMAL
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white.withValues(alpha: 0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.pets, color: Colors.brown),
                            SizedBox(width: 8),
                            Text(
                              'Tamanduá‑bandeira',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'O tamanduá‑bandeira (Myrmecophaga tridactyla) é o maior dos tamanduás, podendo chegar a 2 metros de comprimento. '
                              'É conhecido por sua longa língua viscosa (pode atingir 60 cm) e sua pelagem característica, que lembra uma bandeira. '
                              'Habita savanas e florestas da América Central e do Sul, alimentando‑se principalmente de formigas e cupins.',
                          style: TextStyle(fontSize: 16, height: 1.4),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.warning_amber, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              'Status: Vulnerável (IUCN)',
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.orange[800],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Dica extra sobre AR
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.view_in_ar, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Toque no botão "AR" para ver em realidade aumentada',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}