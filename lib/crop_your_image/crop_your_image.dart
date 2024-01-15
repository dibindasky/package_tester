// import 'dart:io';

// import 'package:crop_your_image/crop_your_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CropPage(),
//     );
//   }
// }

// class CropPage extends StatefulWidget {
//   const CropPage({super.key});

//   @override
//   State<CropPage> createState() => _CropPageState();
// }

// late File croppedImage;
// bool cropped = false;

// class _CropPageState extends State<CropPage> {
//   final cropController = CropController();
//   final String assettImage = 'assets/images/home_offer.png';
//   Uint8List? unit8listImage;
//   bool edit = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//         title: const Text('Crop'),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           AspectRatio(
//               aspectRatio: 3,
//               child: cropped
//                   ? Image.file(croppedImage)
//                   : Image.asset(assettImage)),
//           const SizedBox(
//             height: 50,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 croppedImage = File(await ImagePicker()
//                     .pickImage(source: ImageSource.gallery)
//                     .then((value) => value!.path));
//                 unit8listImage = await fileImageToUint8List(croppedImage);
//                 setState(() {
//                   edit = !edit;
//                 });
//               },
//               child: const Text('load image to crop')),
//           edit
//               ? Croper(
//                   imageToCrop: unit8listImage,
//                   callBack: () {
//                     setState(() {});
//                   },
//                 )
//               : const SizedBox(),
//           ElevatedButton(
//             onPressed: _controller.crop,
//             child: const Text('Crop it!'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // crop controller used to crop
// final _controller = CropController();

// // convert file to unit8List
// Future<Uint8List> fileImageToUint8List(File file) async {
//     List<int> bytes = await file.readAsBytes();
//     return Uint8List.fromList(bytes);
// }

// // convert unit8List to file
// Future<void> writeUint8ListToFile(Uint8List uint8List, String filePath) async {
//   File file = File(filePath);
//   await file.writeAsBytes(uint8List);
// }

// class Croper extends StatelessWidget {
//   const Croper({super.key, this.imageToCrop, required this.callBack});

//   final Uint8List? imageToCrop;
//   final VoidCallback callBack;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Crop(
//         image: imageToCrop!,
//         controller: _controller,
//         onCropped: (image) {
//           // do something with image data
//           writeUint8ListToFile(image, croppedImage.path);
//           cropped = !cropped;
//           callBack();
//         },
//         aspectRatio: 3 / 4,
//         // initialSize: 0.5,
//         // initialArea: Rect.fromLTWH(240, 212, 800, 600),
//         initialAreaBuilder: (rect) => Rect.fromLTRB(
//             rect.left + 24, rect.top + 32, rect.right - 24, rect.bottom - 32),
//         // withCircleUi: true,
//         baseColor: const Color.fromARGB(255, 3, 229, 245),
//         maskColor: Colors.white.withAlpha(100),
//         radius: 20,
//         onMoved: (newRect) {
//           // do something with current cropping area.
//         },
//         onStatusChanged: (status) {
//           // do something with current CropStatus
//         },
//         cornerDotBuilder: (size, edgeAlignment) =>
//             const DotControl(color: Color.fromARGB(255, 9, 207, 214)),
//         interactive: true,
//         // fixArea: true,
//       ),
//     );
//   }
// }
