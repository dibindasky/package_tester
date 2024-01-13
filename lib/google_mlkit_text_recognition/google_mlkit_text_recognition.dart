import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

// void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image to Text')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TextReaderExample(),
            ));
          },
          child: const Text('get text from image'),
        ),
      ),
    );
  }
}

class TextReaderExample extends StatefulWidget {
  const TextReaderExample({super.key});

  @override
  State<TextReaderExample> createState() => _TextReaderExampleState();
}

class _TextReaderExampleState extends State<TextReaderExample> {
  File? image;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image to text'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final img =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (img != null) {
                  setState(() {
                    image = File(img.path);
                  });
                }
              },
              child: const Text('camera'),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: image != null ? FileImage(image!) : null,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (image == null) return;
                final inputImage = InputImage.fromFile(image!);
                final textRecognizer =
                    TextRecognizer(script: TextRecognitionScript.latin);
                final RecognizedText recognizedText =
                    await textRecognizer.processImage(inputImage);
                String txt = recognizedText.text;
                setState(() {
                  text = txt;
                });
                for (TextBlock block in recognizedText.blocks) {
                  final Rect rect = block.boundingBox;
                  final List<Point<int>> cornerPoints = block.cornerPoints;
                  final String text = block.text;
                  final List<String> languages = block.recognizedLanguages;

                  for (TextLine line in block.lines) {
                    // Same getters as TextBlock
                    print('line --------- ${line.text}');
                    for (TextElement element in line.elements) {
                      // Same getters as TextBlock
                    //  print('element -----------\n${element.text}');
                    }
                  }
                }
              },
              child: const Text('process image'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Extracted txt will display here'),
            Text(text),
          ],
        ),
      ),
    );
  }
}
