import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'ARService.dart';

class SnapPage extends StatefulWidget {
  const SnapPage({super.key});

  @override
  State<SnapPage> createState() => _SnapPageState();
}

class _SnapPageState extends State<SnapPage> {
  bool _isARSupported = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkAR();
  }

  void _checkAR() async {
    final supported = await ARService.isSupported();
    setState(() {
      _isARSupported = supported;
      _loading = false;
    });
  }

  void _showNotSupportedDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Realidade Aumentada"),
        content: const Text(
          "Seu dispositivo não suporta AR ou não possui o Google Play Services para AR.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
                // 👇 MODELO 3D
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: ModelViewer(
                      src: "assets/images/anteater.glb",
                      alt: "Tamanduá 3D",
                      ar: _isARSupported, // 👈 CONTROLE REAL DO AR
                      autoRotate: true,
                      cameraControls: true,
                      disableZoom: false,
                      disableTap: false,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 👇 BOTÃO / FEEDBACK DE AR
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: _isARSupported ? null : _showNotSupportedDialog,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.view_in_ar, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          _isARSupported
                              ? 'Toque no botão "AR" para ver em realidade aumentada'
                              : 'AR não suportado neste dispositivo',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 👇 DESCRIÇÃO DO ANIMAL (INTACTA)
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
                              'Tamanduá-bandeira',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'O tamanduá-bandeira (Myrmecophaga tridactyla) é o maior dos tamanduás, podendo chegar a 2 metros de comprimento. '
                              'É conhecido por sua longa língua viscosa (pode atingir 60 cm) e sua pelagem característica, que lembra uma bandeira. '
                              'Habita savanas e florestas da América Central e do Sul, alimentando-se principalmente de formigas e cupins.',
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
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}