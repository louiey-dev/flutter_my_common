import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_my_common/my_utils.dart';
import 'package:image/image.dart' as img;

int offset = 0;

class ThermalImage extends StatefulWidget {
  const ThermalImage({super.key});

  @override
  State<ThermalImage> createState() => _ThermalImageState();
}

class _ThermalImageState extends State<ThermalImage> {
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    _loadImageBytes();
  }

  // Example: Load image bytes from assets
  Future<void> _loadImageBytes() async {
    // final bytes = await rootBundle.load(
    //   'assets/images/thermal_image_sample.jpg',
    // );
    // setState(() {
    //   imageBytes = bytes.buffer.asUint8List();
    // });
    setState(() {
      List<int> randomNum = List.generate(320 * 240, (index) => index + offset);
      imageBytes = mapThermalToColor(randomNum, 320, 240);
      offset += 1;
      utils.log("offset is $offset");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back to previous screen')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child:
                  imageBytes == null
                      ? CircularProgressIndicator()
                      : Image.memory(
                        imageBytes!,
                        width: 320,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
            ),
          ],
        ),
      ),
    );
  }

  _showImage(Uint8List img) {
    try {
      utils.log("Showing image with length: ${img.length}");
      return Image.memory(
        img,
        width: 320, // optional
        height: 240, // optional
        fit: BoxFit.cover, // optional
      );
    } catch (e) {
      utils.log("Error showing image: $e");
      return;
    }
  }

  Uint8List mapThermalToColor(List<int> rawData, int width, int height) {
    // 1. Normalize the data
    int min = rawData.reduce((a, b) => a < b ? a : b);
    int max = rawData.reduce((a, b) => a > b ? a : b);
    double range = (max - min).toDouble();

    // 2. Create an image buffer
    final image = img.Image(width: width, height: height);

    for (int i = 0; i < rawData.length; i++) {
      double norm = (rawData[i] - min) / range; // 0.0 to 1.0
      // 3. Map normalized value to color (simple blue-to-red gradient)
      int r = (norm * 255).toInt();
      int g = 0;
      int b = ((1 - norm) * 255).toInt();
      image.setPixelRgb(i % width, i ~/ width, r, g, b);
    }

    // 4. Encode as PNG
    return Uint8List.fromList(img.encodePng(image));
  }
}
