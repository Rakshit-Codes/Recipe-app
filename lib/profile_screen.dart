// // // // // // import 'package:flutter/material.dart';

// // // // // // class ProfilePage extends StatefulWidget {
// // // // // //   const ProfilePage({super.key});

// // // // // //   @override
// // // // // //   State<ProfilePage> createState() => _ProfilePageState();
// // // // // // }

// // // // // // class _ProfilePageState extends State<ProfilePage> {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       body: Center(child: Text('Profile page',style: TextStyle(fontSize: 20),)),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:io';

// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:get/get.dart';
// // // // // import 'package:image_cropper/image_cropper.dart';
// // // // // import 'package:image_picker/image_picker.dart';

// // // // // class Profile extends StatefulWidget {
// // // // //   const Profile({super.key});

// // // // //   @override
// // // // //   State<Profile> createState() => _ProfileState();
// // // // // }

// // // // // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// // // // //   late TabController _tabController;
// // // // //   final user = FirebaseAuth.instance.currentUser;
// // // // //   File? photo;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _tabController = TabController(length: 3, vsync: this);
// // // // //     _tabController.addListener(_handleTabSelection);
// // // // //   }

// // // // //   void _handleTabSelection() {
// // // // //     setState(() {});
// // // // //   }

// // // // //   File? _croppedImageFile;

// // // // //   Future<void> _pickMainImage() async {
// // // // //     final picker = ImagePicker();
// // // // //     final pickedFile = await picker.pickImage(
// // // // //       source: ImageSource.gallery,
// // // // //       imageQuality: 85,
// // // // //       maxWidth: 1024,
// // // // //       maxHeight: 1024,
// // // // //     );

// // // // //     if (pickedFile != null) {
// // // // //       File? croppedFile = await _cropImage(File(pickedFile.path));
// // // // //       if (croppedFile != null) {
// // // // //         setState(() {
// // // // //           photo = croppedFile;
// // // // //         });
// // // // //       }
// // // // //     }
// // // // //   }

// // // // //   Widget _displayCroppedImage(File imageFile) {
// // // // //     return Container(
// // // // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // // // //       alignment: Alignment.center,
// // // // //       child: Image.file(
// // // // //         imageFile,
// // // // //         width: 200,
// // // // //         height: 200,
// // // // //         fit: BoxFit.contain,
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // // Future<File?> _cropImage(File file) async {
// // // // //   CroppedFile? croppedFile = await ImageCropper().cropImage(
// // // // //     sourcePath: file.path,
// // // // //     aspectRatioPresets: [
// // // // //       CropAspectRatioPreset.square,
// // // // //       CropAspectRatioPreset.ratio3x2,
// // // // //       CropAspectRatioPreset.original,
// // // // //       CropAspectRatioPreset.ratio4x3,
// // // // //       CropAspectRatioPreset.ratio16x9
// // // // //     ],
// // // // //     androidUiSettings: AndroidUiSettings(
// // // // //       toolbarTitle: 'Crop Image',
// // // // //       toolbarColor: Colors.deepOrange,
// // // // //       toolbarWidgetColor: Colors.white,
// // // // //       initAspectRatio: CropAspectRatioPreset.original,
// // // // //       lockAspectRatio: false,
// // // // //     ),
// // // // //     iosUiSettings: IOSUiSettings(
// // // // //       minimumAspectRatio: 1.0,
// // // // //     ),
// // // // //   );
// // // // //   if (croppedFile != null) {
// // // // //     return File(croppedFile.path);
// // // // //   }
// // // // //   return null;
// // // // // }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: Padding(
// // // // //         padding: const EdgeInsets.all(8.0),
// // // // //         child: Center(
// // // // //           child: Container(
// // // // //             width: Get.width,
// // // // //             height: Get.height,
// // // // //             child: SingleChildScrollView(
// // // // //               child: Column(
// // // // //                 children: [
// // // // //                   SizedBox(
// // // // //                     height: Get.height * 0.05,
// // // // //                   ),
// // // // //                   Stack(
// // // // //                     children: [
// // // // //                       Positioned(
// // // // //                         child: Container(
// // // // //                           height: 150,
// // // // //                           width: 150,
// // // // //                           decoration: BoxDecoration(
// // // // //                             borderRadius: BorderRadius.circular(100),
// // // // //                             color: Colors.black,
// // // // //                           ),
// // // // //                           child: GestureDetector(
// // // // //                             onTap: () {
// // // // //                               _pickMainImage();
// // // // //                             },
// // // // //                           child: _displayCroppedImage(photo!),
// // // // //                           ),
// // // // //                         ),
// // // // //                       ),
// // // // //                       const Positioned(
// // // // //                         top: 120,
// // // // //                         left: 120,
// // // // //                         child: Icon(
// // // // //                           Icons.add_a_photo,
// // // // //                           color: Colors.black54,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                   const SizedBox(
// // // // //                     height: 10,
// // // // //                   ),
// // // // //                   Text(
// // // // //                     user!.displayName.toString(),
// // // // //                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // // //                   ),
// // // // //                   const SizedBox(
// // // // //                     height: 20,
// // // // //                   ),
// // // // //                   TabBar(controller: _tabController, tabs: const [
// // // // //                     Tab(
// // // // //                       icon: Icon(
// // // // //                         Icons.fastfood,
// // // // //                         size: 30,
// // // // //                       ),
// // // // //                     ),
// // // // //                     Tab(
// // // // //                       icon: Icon(
// // // // //                         Icons.favorite,
// // // // //                         size: 30,
// // // // //                       ),
// // // // //                     ),
// // // // //                     Tab(
// // // // //                       icon: Icon(
// // // // //                         Icons.thumb_up,
// // // // //                         size: 30,
// // // // //                       ),
// // // // //                     ),
// // // // //                   ]),
// // // // //                   Padding(
// // // // //                     padding: const EdgeInsets.all(8.0),
// // // // //                     child: SizedBox(
// // // // //                       height: 1000,
// // // // //                       child: TabBarView(
// // // // //                         controller: _tabController,
// // // // //                         children: [
// // // // //                           Container(
// // // // //                             color: Colors.amber,
// // // // //                           ), // Placeholder for the first tab
// // // // //                           Container(
// // // // //                             color: Colors.amberAccent,
// // // // //                           ), // Placeholder for the second tab
// // // // //                           Container(
// // // // //                             color: Colors.black12,
// // // // //                           ), // Placeholder for the third tab
// // // // //                         ],
// // // // //                       ),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _tabController.dispose();
// // // // //     super.dispose();
// // // // //   }
// // // // // }

// // // // import 'dart:io';

// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:image_cropper/image_cropper.dart';
// // // // import 'package:image_picker/image_picker.dart';

// // // // class Profile extends StatefulWidget {
// // // //   const Profile({super.key});

// // // //   @override
// // // //   State<Profile> createState() => _ProfileState();
// // // // }

// // // // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   final user = FirebaseAuth.instance.currentUser;
// // // //   File? photo;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 3, vsync: this);
// // // //     _tabController.addListener(_handleTabSelection);
// // // //   }

// // // //   void _handleTabSelection() {
// // // //     setState(() {});
// // // //   }

// // // //   File? _croppedImageFile;

// // // //   Future<void> _pickMainImage() async {
// // // //     final picker = ImagePicker();
// // // //     final pickedFile = await picker.pickImage(
// // // //       source: ImageSource.gallery,
// // // //       imageQuality: 85,
// // // //       maxWidth: 1024,
// // // //       maxHeight: 1024,
// // // //     );

// // // //     if (pickedFile != null) {
// // // //       File? croppedFile = await _cropImage(File(pickedFile.path));
// // // //       if (croppedFile != null) {
// // // //         setState(() {
// // // //           photo = croppedFile;
// // // //         });
// // // //       }
// // // //     }
// // // //   }

// // // //   Widget _displayCroppedImage(File imageFile) {
// // // //     return Container(
// // // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // // //       alignment: Alignment.center,
// // // //       child: Image.file(
// // // //         imageFile,
// // // //         width: 200,
// // // //         height: 200,
// // // //         fit: BoxFit.contain,
// // // //       ),
// // // //     );
// // // //   }

// // // //   Future<File?> _cropImage(File file) async {
// // // //     File? croppedFile = await ImageCropper().cropImage(
// // // //       sourcePath: file.path,
// // // //       aspectRatioPresets: [
// // // //         CropAspectRatioPreset.square,
// // // //         CropAspectRatioPreset.ratio3x2,
// // // //         CropAspectRatioPreset.original,
// // // //         CropAspectRatioPreset.ratio4x3,
// // // //         CropAspectRatioPreset.ratio16x9
// // // //       ],
// // // //       androidUiSettings: const AndroidUiSettings(
// // // //         toolbarTitle: 'Crop Image',
// // // //         toolbarColor: Colors.deepOrange,
// // // //         toolbarWidgetColor: Colors.white,
// // // //         initAspectRatio: CropAspectRatioPreset.original,
// // // //         lockAspectRatio: false,
// // // //       ),
// // // //       iosUiSettings: const IOSUiSettings(
// // // //         minimumAspectRatio: 1.0,
// // // //       ),
// // // //     );
// // // //     return croppedFile;
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(8.0),
// // // //         child: Center(
// // // //           child: Container(
// // // //             width: Get.width,
// // // //             height: Get.height,
// // // //             child: SingleChildScrollView(
// // // //               child: Column(
// // // //                 children: [
// // // //                   SizedBox(
// // // //                     height: Get.height * 0.05,
// // // //                   ),
// // // //                   Stack(
// // // //                     children: [
// // // //                       Positioned(
// // // //                         child: Container(
// // // //                           height: 150,
// // // //                           width: 150,
// // // //                           decoration: BoxDecoration(
// // // //                             borderRadius: BorderRadius.circular(100),
// // // //                             color: Colors.black,
// // // //                           ),
// // // //                           child: GestureDetector(
// // // //                             onTap: () {
// // // //                               _pickMainImage();
// // // //                             },
// // // //                           child: _displayCroppedImage(photo!),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const Positioned(
// // // //                         top: 120,
// // // //                         left: 120,
// // // //                         child: Icon(
// // // //                           Icons.add_a_photo,
// // // //                           color: Colors.black54,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 10,
// // // //                   ),
// // // //                   Text(
// // // //                     user!.displayName.toString(),
// // // //                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 20,
// // // //                   ),
// // // //                   TabBar(controller: _tabController, tabs: const [
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.fastfood,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.favorite,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.thumb_up,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                   ]),
// // // //                   Padding(
// // // //                     padding: const EdgeInsets.all(8.0),
// // // //                     child: SizedBox(
// // // //                       height: 1000,
// // // //                       child: TabBarView(
// // // //                         controller: _tabController,
// // // //                         children: [
// // // //                           Container(
// // // //                             color: Colors.amber,
// // // //                           ), // Placeholder for the first tab
// // // //                           Container(
// // // //                             color: Colors.amberAccent,
// // // //                           ), // Placeholder for the second tab
// // // //                           Container(
// // // //                             color: Colors.black12,
// // // //                           ), // Placeholder for the third tab
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // // import 'dart:io';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:image_cropper/image_cropper.dart';
// // // // import 'package:image_picker/image_picker.dart';

// // // // class Profile extends StatefulWidget {
// // // //   const Profile({super.key});

// // // //   @override
// // // //   State<Profile> createState() => _ProfileState();
// // // // }

// // // // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   final user = FirebaseAuth.instance.currentUser;
// // // //   File? photo;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 3, vsync: this);
// // // //     _tabController.addListener(_handleTabSelection);
// // // //   }

// // // //   void _handleTabSelection() {
// // // //     setState(() {});
// // // //   }

// // // //   File? _croppedImageFile;

// // // //   Future<void> _pickMainImage() async {
// // // //     final picker = ImagePicker();
// // // //     final pickedFile = await picker.pickImage(
// // // //       source: ImageSource.gallery,
// // // //       imageQuality: 85,
// // // //       maxWidth: 1024,
// // // //       maxHeight: 1024,
// // // //     );

// // // //     if (pickedFile != null) {
// // // //       File? croppedFile = await _cropImage(File(pickedFile.path));
// // // //       if (croppedFile != null) {
// // // //         setState(() {
// // // //           photo = croppedFile;
// // // //         });
// // // //       }
// // // //     }
// // // //   }

// // // //   Widget _displayCroppedImage(File imageFile) {
// // // //     return Container(
// // // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // // //       alignment: Alignment.center,
// // // //       child: Image.file(
// // // //         imageFile,
// // // //         width: 200,
// // // //         height: 200,
// // // //         fit: BoxFit.contain,
// // // //       ),
// // // //     );
// // // //   }

// // // //   Future<File?> _cropImage(File file) async {
// // // //     File? croppedFile = await ImageCropper().cropImage(
// // // //       sourcePath: file.path,
// // // //       aspectRatioPresets: [
// // // //         CropAspectRatioPreset.square,
// // // //         CropAspectRatioPreset.ratio3x2,
// // // //         CropAspectRatioPreset.original,
// // // //         CropAspectRatioPreset.ratio4x3,
// // // //         CropAspectRatioPreset.ratio16x9
// // // //       ],
// // // //       androidUiSettings: const AndroidUiSettings(
// // // //         toolbarTitle: 'Crop Image',
// // // //         toolbarColor: Colors.deepOrange,
// // // //         toolbarWidgetColor: Colors.white,
// // // //         initAspectRatio: CropAspectRatioPreset.original,
// // // //         lockAspectRatio: false,
// // // //       ),
// // // //       iosUiSettings: const IOSUiSettings(
// // // //         minimumAspectRatio: 1.0,
// // // //       ),
// // // //     );
// // // //     if (croppedFile != null) {
// // // //       return File(croppedFile.path);
// // // //     }
// // // //     return null;
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(8.0),
// // // //         child: Center(
// // // //           child: Container(
// // // //             width: Get.width,
// // // //             height: Get.height,
// // // //             child: SingleChildScrollView(
// // // //               child: Column(
// // // //                 children: [
// // // //                   SizedBox(
// // // //                     height: Get.height * 0.05,
// // // //                   ),
// // // //                   Stack(
// // // //                     children: [
// // // //                       Positioned(
// // // //                         child: Padding(
// // // //                           padding: const EdgeInsets.all(8.0),
// // // //                           child: Container(
// // // //                             height: 150,
// // // //                             width: 150,
// // // //                             decoration: BoxDecoration(
// // // //                               borderRadius: BorderRadius.circular(100),
// // // //                               color: Colors.black,
// // // //                             ),
// // // //                             child: GestureDetector(
// // // //                               onTap: () {
// // // //                                 _pickMainImage();
// // // //                                 // Call user form here .
// // // //                               },
// // // //                               child: photo != null
// // // //                                   ? _displayCroppedImage(photo!)
// // // //                                   : const Icon(
// // // //                                       Icons.person,
// // // //                                       size: 100,
// // // //                                       color: Colors.white,
// // // //                                     ),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                        Positioned(
// // // //                         top: 0,
// // // //                         left: 125,
// // // //                         child: IconButton(onPressed: (){},
// // // //                          icon: Icon(Icons.add) ,
// // // //                           color: Colors.black54,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 10,
// // // //                   ),
// // // //                   Text(
// // // //                     user?.displayName ?? 'User',
// // // //                     style: const TextStyle(
// // // //                         fontSize: 20, fontWeight: FontWeight.w600),
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 20,
// // // //                   ),
// // // //                   TabBar(controller: _tabController, tabs: const [
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.fastfood,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.favorite,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.thumb_up,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                   ]),
// // // //                   Padding(
// // // //                     padding: const EdgeInsets.all(8.0),
// // // //                     child: SizedBox(
// // // //                       height: 1000,
// // // //                       child: TabBarView(
// // // //                         controller: _tabController,
// // // //                         children: [
// // // //                           Container(
// // // //                             color: Colors.amber,
// // // //                           ), // Placeholder for the first tab
// // // //                           Container(
// // // //                             color: Colors.amberAccent,
// // // //                           ), // Placeholder for the second tab
// // // //                           Container(
// // // //                             color: Colors.black12,
// // // //                           ), // Placeholder for the third tab
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // // import 'dart:io';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'package:recipe_app/user/user_form.dart'; // Adjust the import path accordingly

// // // // class Profile extends StatefulWidget {
// // // //   const Profile({Key? key}) : super(key: key);

// // // //   @override
// // // //   State<Profile> createState() => _ProfileState();
// // // // }

// // // // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   final user = FirebaseAuth.instance.currentUser;
// // // //   File? photo;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 3, vsync: this);
// // // //     _tabController.addListener(_handleTabSelection);
// // // //   }

// // // //   void _handleTabSelection() {
// // // //     setState(() {});
// // // //   }

// // // //   Future<void> _pickMainImage() async {
// // // //     final picker = ImagePicker();
// // // //     final pickedFile = await picker.pickImage(
// // // //       source: ImageSource.gallery,
// // // //       imageQuality: 85,
// // // //       maxWidth: 1024,
// // // //       maxHeight: 1024,
// // // //     );

// // // //     if (pickedFile != null) {
// // // //       setState(() {
// // // //         photo = File(pickedFile.path);
// // // //       });
// // // //     }
// // // //   }

// // // //   Widget _displayCroppedImage(File imageFile) {
// // // //     return Container(
// // // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // // //       alignment: Alignment.center,
// // // //       child: Image.file(
// // // //         imageFile,
// // // //         width: 200,
// // // //         height: 200,
// // // //         fit: BoxFit.contain,
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(8.0),
// // // //         child: Center(
// // // //           child: Container(
// // // //             width: Get.width,
// // // //             height: Get.height,
// // // //             child: SingleChildScrollView(
// // // //               child: Column(
// // // //                 children: [
// // // //                   SizedBox(
// // // //                     height: Get.height * 0.05,
// // // //                   ),
// // // //                   Stack(
// // // //                     children: [
// // // //                       Positioned(
// // // //                         child: Padding(
// // // //                           padding: const EdgeInsets.all(8.0),
// // // //                           child: Container(
// // // //                             height: 150,
// // // //                             width: 150,
// // // //                             decoration: BoxDecoration(
// // // //                               borderRadius: BorderRadius.circular(100),
// // // //                               color: Colors.black,
// // // //                             ),
// // // //                             child: GestureDetector(
// // // //                               onTap: () {
// // // //                                 Navigator.push(
// // // //                                   context,
// // // //                                   MaterialPageRoute(
// // // //                                     builder: (context) => UserForm(),
// // // //                                   ),
// // // //                                 );
// // // //                               },
// // // //                               child: photo != null
// // // //                                   ? _displayCroppedImage(photo!)
// // // //                                   : const Icon(
// // // //                                       Icons.person,
// // // //                                       size: 100,
// // // //                                       color: Colors.white,
// // // //                                     ),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       Positioned(
// // // //                         top: 0,
// // // //                         left: 125,
// // // //                         child: IconButton(
// // // //                           onPressed: _pickMainImage,
// // // //                           icon: Icon(Icons.add),
// // // //                           color: Colors.black54,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 10,
// // // //                   ),
// // // //                   Text(
// // // //                     user?.displayName ?? 'User',
// // // //                     style: const TextStyle(
// // // //                         fontSize: 20, fontWeight: FontWeight.w600),
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 20,
// // // //                   ),
// // // //                   TabBar(controller: _tabController, tabs: const [
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.fastfood,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.favorite,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.thumb_up,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                   ]),
// // // //                   Padding(
// // // //                     padding: const EdgeInsets.all(8.0),
// // // //                     child: SizedBox(
// // // //                       height: 1000,
// // // //                       child: TabBarView(
// // // //                         controller: _tabController,
// // // //                         children: [
// // // //                           Container(
// // // //                             color: Colors.amber,
// // // //                           ),
// // // //                           Container(
// // // //                             color: Colors.amberAccent,
// // // //                           ),
// // // //                           Container(
// // // //                             color: Colors.black12,
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // // import 'dart:io';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:image_cropper/image_cropper.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'package:recipe_app/user/controller.dart';
// // // // import 'package:recipe_app/user/user.dart'; // Adjust the import path

// // // // class Profile extends StatefulWidget {
// // // //   const Profile({Key? key}) : super(key: key);

// // // //   @override
// // // //   State<Profile> createState() => _ProfileState();
// // // // }

// // // // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   // final user = FirebaseAuth.instance.currentUser;
// // // //   // final RUserController rUserController = Get.put(RUserController());
// // // //   // File? photo;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     // rUserController.fetchRUser;
// // // //     _tabController = TabController(length: 3, vsync: this);
// // // //     _tabController.addListener(_handleTabSelection);
// // // //     // _loadUserData();
// // // //   }

// // // //   void _handleTabSelection() {
// // // //     setState(() {});
// // // //   }

// // // //   // Future<void> _loadUserData() async {
// // // //   //   await rUserController.fetchUser(user!.uid);
// // // //   //   if (rUserController.currentUser.value != null) {
// // // //   //     setState(() {
// // // //   //       photo = rUserController.currentUser.value!.mainImage;
// // // //   //     });
// // // //   //   }
// // // //   // }

// // // //   // Future<void> _pickMainImage() async {
// // // //   //   final picker = ImagePicker();
// // // //   //   final pickedFile = await picker.pickImage(
// // // //   //     source: ImageSource.gallery,
// // // //   //     imageQuality: 85,
// // // //   //     maxWidth: 1024,
// // // //   //     maxHeight: 1024,
// // // //   //   );

// // // //   //   if (pickedFile != null) {
// // // //   //     File? croppedFile = await _cropImage(File(pickedFile.path));
// // // //   //     if (croppedFile != null) {
// // // //   //       setState(() {
// // // //   //         photo = croppedFile;
// // // //   //       });
// // // //   //       rUserController.updateUserPhoto(croppedFile);
// // // //   //     }
// // // //   //   }
// // // //   // }

// // // //   // Future<File?> _cropImage(File file) async {
// // // //   //   File? croppedFile = await ImageCropper().cropImage(
// // // //   //     sourcePath: file.path,
// // // //   //     aspectRatioPresets: [
// // // //   //       CropAspectRatioPreset.square,
// // // //   //       CropAspectRatioPreset.ratio3x2,
// // // //   //       CropAspectRatioPreset.original,
// // // //   //       CropAspectRatioPreset.ratio4x3,
// // // //   //       CropAspectRatioPreset.ratio16x9
// // // //   //     ],
// // // //   //     androidUiSettings: const AndroidUiSettings(
// // // //   //       toolbarTitle: 'Crop Image',
// // // //   //       toolbarColor: Colors.deepOrange,
// // // //   //       toolbarWidgetColor: Colors.white,
// // // //   //       initAspectRatio: CropAspectRatioPreset.original,
// // // //   //       lockAspectRatio: false,
// // // //   //     ),
// // // //   //     iosUiSettings: const IOSUiSettings(
// // // //   //       minimumAspectRatio: 1.0,
// // // //   //     ),
// // // //   //   );
// // // //   //   return croppedFile != null ? File(croppedFile.path) : null;
// // // //   // }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(8.0),
// // // //         child: Center(
// // // //           child: Container(
// // // //             width: Get.width,
// // // //             height: Get.height,
// // // //             child: SingleChildScrollView(
// // // //               child: Column(
// // // //                 children: [
// // // //                   SizedBox(
// // // //                     height: Get.height * 0.05,
// // // //                   ),
// // // //                   Stack(
// // // //                     children: [
// // // //                       Positioned(
// // // //                         child: Padding(
// // // //                           padding: const EdgeInsets.all(8.0),
// // // //                           child: Container(
// // // //                             height: 150,
// // // //                             width: 150,
// // // //                             decoration: BoxDecoration(
// // // //                               borderRadius: BorderRadius.circular(100),
// // // //                               color: Colors.black,
// // // //                             ),
// // // //                             child: GestureDetector(
// // // //                                 // onTap: _pickMainImage,

// // // //                                 // Obx(() {
// // // //                                 //   return photo != null ||
// // // //                                 //           rUserController
// // // //                                 //                   .currentUser.value?.mainImage !=
// // // //                                 //               null
// // // //                                 //       ? ClipOval(
// // // //                                 //           child: Image.file(
// // // //                                 //             photo ??
// // // //                                 //                 rUserController.currentUser.value!
// // // //                                 //                     .mainImage!,
// // // //                                 //             fit: BoxFit.cover,
// // // //                                 //             width: 150,
// // // //                                 //             height: 150,
// // // //                                 //           ),
// // // //                                 //         )
// // // //                                 //       : const Icon(
// // // //                                 //           Icons.person,
// // // //                                 //           size: 100,
// // // //                                 //           color: Colors.white,
// // // //                                 //         );
// // // //                                 // }),
// // // //                                 ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       Positioned(
// // // //                         top: 0,
// // // //                         left: 125,
// // // //                         child: IconButton(
// // // //                           // onPressed: _pickMainImage,
// // // //                           onPressed: () {},
// // // //                           icon: Icon(Icons.add),
// // // //                           color: Colors.black54,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(
// // // //                     height: 10,
// // // //                   ),
// // // //                   // Obx(() {
// // // //                   //   return Text(
// // // //                   //     rUserController.currentUser.value?.user_Name ??
// // // //                   //         user?.user_Name ??
// // // //                   //         'User',
// // // //                   //     style: const TextStyle(
// // // //                   //         fontSize: 20, fontWeight: FontWeight.w600),
// // // //                   //   );
// // // //                   // }),
// // // //                   const SizedBox(
// // // //                     height: 20,
// // // //                   ),
// // // //                   TabBar(controller: _tabController, tabs: const [
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.fastfood,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.person,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                     Tab(
// // // //                       icon: Icon(
// // // //                         Icons.settings,
// // // //                         size: 30,
// // // //                       ),
// // // //                     ),
// // // //                   ]),
// // // //                   TabBarView(
// // // //                     controller: _tabController._handleTabSelection,
// // // //                     children: [
// // // //                     Container(
// // // //                       height: 100,
// // // //                       width: 100,
// // // //                       color: Colors.amber,
// // // //                     ),
// // // //                     Container(
// // // //                       height: 100,
// // // //                       width: 100,
// // // //                       color: Colors.amber,
// // // //                     ),
// // // //                     Container(
// // // //                       height: 100,
// // // //                       width: 100,
// // // //                       color: Colors.amber,
// // // //                     ),
// // // //                   ])
// // // //                   // Add your TabBarView or other widgets here
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'dart:io';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:image_cropper/image_cropper.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:recipe_app/user/controller.dart';
// // // import 'package:recipe_app/user/user.dart'; // Adjust the import path

// // // class Profile extends StatefulWidget {
// // //   const Profile({Key? key}) : super(key: key);

// // //   @override
// // //   State<Profile> createState() => _ProfileState();
// // // }

// // // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// // //   late TabController _tabController;
// // //   // final user = FirebaseAuth.instance.currentUser;
// // //   // final RUserController rUserController = Get.put(RUserController());
// // //   // File? photo;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // rUserController.fetchRUser;
// // //     _tabController = TabController(length: 3, vsync: this);
// // //     _tabController.addListener(_handleTabSelection);
// // //     // _loadUserData();
// // //   }

// // //   void _handleTabSelection() {
// // //     setState(() {});
// // //   }

// // //   // Future<void> _loadUserData() async {
// // //   //   await rUserController.fetchUser(user!.uid);
// // //   //   if (rUserController.currentUser.value != null) {
// // //   //     setState(() {
// // //   //       photo = rUserController.currentUser.value!.mainImage;
// // //   //     });
// // //   //   }
// // //   // }

// // //   // Future<void> _pickMainImage() async {
// // //   //   final picker = ImagePicker();
// // //   //   final pickedFile = await picker.pickImage(
// // //   //     source: ImageSource.gallery,
// // //   //     imageQuality: 85,
// // //   //     maxWidth: 1024,
// // //   //     maxHeight: 1024,
// // //   //   );

// // //   //   if (pickedFile != null) {
// // //   //     File? croppedFile = await _cropImage(File(pickedFile.path));
// // //   //     if (croppedFile != null) {
// // //   //       setState(() {
// // //   //         photo = croppedFile;
// // //   //       });
// // //   //       rUserController.updateUserPhoto(croppedFile);
// // //   //     }
// // //   //   }
// // //   // }

// // //   // Future<File?> _cropImage(File file) async {
// // //   //   File? croppedFile = await ImageCropper().cropImage(
// // //   //     sourcePath: file.path,
// // //   //     aspectRatioPresets: [
// // //   //       CropAspectRatioPreset.square,
// // //   //       CropAspectRatioPreset.ratio3x2,
// // //   //       CropAspectRatioPreset.original,
// // //   //       CropAspectRatioPreset.ratio4x3,
// // //   //       CropAspectRatioPreset.ratio16x9
// // //   //     ],
// // //   //     androidUiSettings: const AndroidUiSettings(
// // //   //       toolbarTitle: 'Crop Image',
// // //   //       toolbarColor: Colors.deepOrange,
// // //   //       toolbarWidgetColor: Colors.white,
// // //   //       initAspectRatio: CropAspectRatioPreset.original,
// // //   //       lockAspectRatio: false,
// // //   //     ),
// // //   //     iosUiSettings: const IOSUiSettings(
// // //   //       minimumAspectRatio: 1.0,
// // //   //     ),
// // //   //   );
// // //   //   return croppedFile != null ? File(croppedFile.path) : null;
// // //   // }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(8.0),
// // //         child: Center(
// // //           child: Container(
// // //             width: Get.width,
// // //             height: Get.height,
// // //             child: SingleChildScrollView(
// // //               child: Column(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   SizedBox(
// // //                     height: Get.height * 0.05,
// // //                   ),
// // //                   Stack(
// // //                     children: [
// // //                       Positioned(
// // //                         child: Padding(
// // //                           padding: const EdgeInsets.all(8.0),
// // //                           child: Container(
// // //                             height: 150,
// // //                             width: 150,
// // //                             decoration: BoxDecoration(
// // //                               borderRadius: BorderRadius.circular(100),
// // //                               color: Colors.black,
// // //                             ),
// // //                             child: GestureDetector(
// // //                                 // onTap: _pickMainImage,

// // //                                 // Obx(() {
// // //                                 //   return photo != null ||
// // //                                 //           rUserController
// // //                                 //                   .currentUser.value?.mainImage !=
// // //                                 //               null
// // //                                 //       ? ClipOval(
// // //                                 //           child: Image.file(
// // //                                 //             photo ??
// // //                                 //                 rUserController.currentUser.value!
// // //                                 //                     .mainImage!,
// // //                                 //             fit: BoxFit.cover,
// // //                                 //             width: 150,
// // //                                 //             height: 150,
// // //                                 //           ),
// // //                                 //         )
// // //                                 //       : const Icon(
// // //                                 //           Icons.person,
// // //                                 //           size: 100,
// // //                                 //           color: Colors.white,
// // //                                 //         );
// // //                                 // }),
// // //                                 ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       Positioned(
// // //                         top: 0,
// // //                         left: 125,
// // //                         child: IconButton(
// // //                           // onPressed: _pickMainImage,
// // //                           onPressed: () {},
// // //                           icon: Icon(Icons.add),
// // //                           color: Colors.black54,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 10,
// // //                   ),
// // //                   // Obx(() {
// // //                   //   return Text(
// // //                   //     rUserController.currentUser.value?.user_Name ??
// // //                   //         user?.user_Name ??
// // //                   //         'User',
// // //                   //     style: const TextStyle(
// // //                   //         fontSize: 20, fontWeight: FontWeight.w600),
// // //                   //   );
// // //                   // }),
// // //                   const SizedBox(
// // //                     height: 20,
// // //                   ),
// // //                   TabBar(controller: _tabController, tabs: const [
// // //                     Tab(
// // //                       icon: Icon(
// // //                         Icons.fastfood,
// // //                         size: 30,
// // //                       ),
// // //                     ),
// // //                     Tab(
// // //                       icon: Icon(
// // //                         Icons.person,
// // //                         size: 30,
// // //                       ),
// // //                     ),
// // //                     Tab(
// // //                       icon: Icon(
// // //                         Icons.settings,
// // //                         size: 30,
// // //                       ),
// // //                     ),
// // //                   ]),
// // //                   Container(
// // //                     child: SizedBox(
// // //                       // height: Get.height, // Set a specific height for the TabBarView
// // //                       child: TabBarView(
// // //                         controller: _tabController,
// // //                         children: [
// // //                           Container(
// // //                             height: 200,
// // //                             width: Get.width,
// // //                             color: Colors.amber,
// // //                           ),
// // //                           Container(
// // //                             height: 100,
// // //                             width: 100,
// // //                             color: Colors.blueAccent,
// // //                           ),
// // //                           Container(
// // //                             height: 100,
// // //                             width: 100,
// // //                             color: Colors.purpleAccent,
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:image_cropper/image_cropper.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:recipe_app/profile_form.dart';

// // class Profile extends StatefulWidget {
// //   const Profile({super.key});

// //   @override
// //   State<Profile> createState() => _ProfileState();
// // }

// // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   // final user = FirebaseAuth.instance.currentUser;
// //   // File? photo;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 3, vsync: this);
// //     _tabController.addListener(_handleTabSelection);
// //   }

// //   void _handleTabSelection() {
// //     setState(() {});
// //   }

// //   File? _croppedImageFile;

// //   // Future<void> _pickMainImage() async {
// //   //   final picker = ImagePicker();
// //   //   final pickedFile = await picker.pickImage(
// //   //     source: ImageSource.gallery,
// //   //     imageQuality: 85,
// //   //     maxWidth: 1024,
// //   //     maxHeight: 1024,
// //   //   );

// //   //   if (pickedFile != null) {
// //   //     File? croppedFile = await _cropImage(File(pickedFile.path));
// //   //     if (croppedFile != null) {
// //   //       setState(() {
// //   //         photo = croppedFile;
// //   //       });
// //   //     }
// //   //   }
// //   // }

// //   // Widget _displayCroppedImage(File imageFile) {
// //   //   return Container(
// //   //     margin: const EdgeInsets.symmetric(vertical: 10),
// //   //     alignment: Alignment.center,
// //   //     child: Image.file(
// //   //       imageFile,
// //   //       width: 200,
// //   //       height: 200,
// //   //       fit: BoxFit.contain,
// //   //     ),
// //   //   );
// //   // }

// //   // Future<File?> _cropImage(File file) async {
// //   //   File? croppedFile = await ImageCropper().cropImage(
// //   //     sourcePath: file.path,
// //   //     aspectRatioPresets: [
// //   //       CropAspectRatioPreset.square,
// //   //       CropAspectRatioPreset.ratio3x2,
// //   //       CropAspectRatioPreset.original,
// //   //       CropAspectRatioPreset.ratio4x3,
// //   //       CropAspectRatioPreset.ratio16x9
// //   //     ],
// //   //     androidUiSettings: const AndroidUiSettings(
// //   //       toolbarTitle: 'Crop Image',
// //   //       toolbarColor: Colors.deepOrange,
// //   //       toolbarWidgetColor: Colors.white,
// //   //       initAspectRatio: CropAspectRatioPreset.original,
// //   //       lockAspectRatio: false,
// //   //     ),
// //   //     iosUiSettings: const IOSUiSettings(
// //   //       minimumAspectRatio: 1.0,
// //   //     ),
// //   //   );
// //   //   return croppedFile;
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Center(
// //           child: Container(
// //             width: Get.width,
// //             height: Get.height,
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: Get.height * 0.05,
// //                   ),
// //                   Stack(
// //                     children: [
// //                       Positioned(
// //                         child: Container(
// //                           height: 150,
// //                           width: 150,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(100),
// //                             color: Colors.black,
// //                           ),
// //                           child: GestureDetector(
// //                             onTap: () {
// //                               Get.to(ProfileForm());
// //                               // _pickMainImage();
// //                             },
// //                           // child: _displayCroppedImage(photo!),
// //                           ),
// //                         ),
// //                       ),
// //                       const Positioned(
// //                         top: 120,
// //                         left: 120,
// //                         child: Icon(
// //                           Icons.add_a_photo,
// //                           color: Colors.black54,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(
// //                     height: 10,
// //                   ),
// //                   // Text(
// //                   //   user!.displayName.toString(),
// //                   //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// //                   // ),
// //                   const SizedBox(
// //                     height: 20,
// //                   ),
// //                   TabBar(controller: _tabController, tabs: const [
// //                     Tab(
// //                       icon: Icon(
// //                         Icons.fastfood,
// //                         size: 30,
// //                       ),
// //                     ),
// //                     Tab(
// //                       icon: Icon(
// //                         Icons.favorite,
// //                         size: 30,
// //                       ),
// //                     ),
// //                     Tab(
// //                       icon: Icon(
// //                         Icons.thumb_up,
// //                         size: 30,
// //                       ),
// //                     ),
// //                   ]),
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: SizedBox(
// //                       height: Get.height*0.6,
// //                       child: TabBarView(
// //                         controller: _tabController,
// //                         children: [
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 height: 200,
// //                                 color: Colors.amber,
// //                               ),
// //                             ],
// //                           ), // Placeholder for the first tab
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 height: 200,
// //                                 color: Colors.amberAccent,
// //                               ),
// //                             ],
// //                           ), // Placeholder for the second tab
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 height: 200,
// //                                 color: Colors.black12,
// //                               ),
// //                             ],
// //                           ), // Placeholder for the third tab
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }
// // }

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:recipe_app/user/controller.dart';
// // import 'package:recipe_app/user/user_form.dart';
// // import 'package:recipe_app/utils/constants/colors.dart';
// // import 'package:recipe_app/utils/helpers/helper_functions.dart';

// // class Profile extends StatefulWidget {
// //   const Profile({super.key});

// //   @override
// //   State<Profile> createState() => _ProfileState();
// // }

// // class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   final user = FirebaseAuth.instance.currentUser;
// //   final UserController _controller = Get.put(UserController());
// //   // File? photo;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 3, vsync: this);
// //     _tabController.addListener(_handleTabSelection);
// //   }

// //   void _handleTabSelection() {
// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Center(
// //           child: Container(
// //             width: Get.width,
// //             height: Get.height,
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: Get.height * 0.05,
// //                   ),
// //                   Stack(
// //                     children: [
// //                       Positioned(
// //                         child: Container(
// //                           height: 160,
// //                           width: 160,
// //                           decoration: BoxDecoration(
// //                               shape: BoxShape.circle,
// //                               color: Colors.grey,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: THelperFunctions.isDarkMode(context)
// //                                       ? const Color.fromARGB(255, 185, 185, 185)
// //                                       : const Color.fromARGB(255, 51, 51, 51),
// //                                   spreadRadius: 3,
// //                                   blurRadius: 20,
// //                                   offset: const Offset(0, 3),
// //                                 ),
// //                               ]),
// //                           child: GestureDetector(
// //                             onTap: () {
// //                               Get.to(UserFormScreen());
// //                             },
// //                             child: Obx(() => Padding(
// //                                   padding: const EdgeInsets.all(0.5),
// //                                   child: CircleAvatar(
// //                                     backgroundColor:
// //                                         THelperFunctions.isDarkMode(context)
// //                                             ? Colors.black
// //                                             : Colors.white,
// //                                     radius: 100,
// //                                     backgroundImage: _controller.user.value
// //                                             .profilePhotoUrl.isNotEmpty
// //                                         ? NetworkImage(_controller
// //                                             .user.value.profilePhotoUrl)
// //                                         : null,
// //                                     child: _controller
// //                                             .user.value.profilePhotoUrl.isEmpty
// //                                         ? Icon(Icons.person,
// //                                             color: THelperFunctions.isDarkMode(
// //                                                     context)
// //                                                 ? TColors.light
// //                                                 : TColors.dark,
// //                                             size: 100)
// //                                         : null,
// //                                   ),
// //                                 )),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(
// //                     height: 18,
// //                   ),
// //                   Obx(
// //                     () {
// //                       final userName = _controller.user.value.name.capitalize.toString();
// //                     return Text(
// //                       userName.isNotEmpty? userName : "Hey User !",
// //                         style: const TextStyle(
// //                         fontSize: 18, fontWeight: FontWeight.w600),

// //                     );
// //                     },
// //                   ),

// //                   const SizedBox(
// //                     height: 2,
// //                   ),
// //                   Text(
// //                     user!.email.toString(),
// //                     style: const TextStyle(
// //                         fontSize: 14, fontWeight: FontWeight.w400),
// //                   ),
// //                   const SizedBox(
// //                     height: 20,
// //                   ),
// //                   TabBar(controller: _tabController, tabs: const [
// //                     Tab(
// //                       icon: Icon(
// //                         Icons.fastfood,
// //                         size: 30,
// //                       ),
// //                     ),
// //                     Tab(
// //                       icon: Icon(
// //                         Icons.favorite,
// //                         size: 30,
// //                       ),
// //                     ),
// //                     Tab(
// //                       icon: Icon(
// //                         Icons.thumb_up,
// //                         size: 30,
// //                       ),
// //                     ),
// //                   ]),
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: SizedBox(
// //                       height: Get.height * 0.6,
// //                       child: TabBarView(
// //                         controller: _tabController,
// //                         children: [
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 color: Colors.amber,
// //                                 height: 200,
// //                               ),
// //                             ],
// //                           ), // Placeholder for the first tab
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 color: Colors.blue,
// //                                 height: 200,
// //                               ),
// //                             ],
// //                           ), // Placeholder for the first tab
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 color: Colors.orange,
// //                                 height: 200,
// //                               ),
// //                             ],
// //                           ), // Placeholder for the first tab

// //                           // Placeholder for the third tab
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/recipe/recipe_header.dart';
// import 'package:recipe_app/recipe/recipe_list_screen.dart';
// import 'package:recipe_app/user/controller.dart';
// import 'package:recipe_app/user/user_form.dart';
// import 'package:recipe_app/utils/constants/colors.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final user = FirebaseAuth.instance.currentUser;
//   final UserController _controller = Get.put(UserController());
//   // File? photo;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//   }

//   void _handleTabSelection() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Container(
//             width: Get.width,
//             height: Get.height,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: Get.height * 0.05,
//                   ),
//                   Stack(
//                     children: [
//                       Positioned(
//                         child: Container(
//                           height: 160,
//                           width: 160,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.grey,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: THelperFunctions.isDarkMode(context)
//                                       ? const Color.fromARGB(255, 185, 185, 185)
//                                       : const Color.fromARGB(255, 51, 51, 51),
//                                   spreadRadius: 3,
//                                   blurRadius: 20,
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ]),
//                           child: GestureDetector(
//                             onTap: () {
//                               Get.to(UserFormScreen());
//                             },
//                             child: Obx(() => Padding(
//                                   padding: const EdgeInsets.all(0.5),
//                                   child: CircleAvatar(
//                                     backgroundColor:
//                                         THelperFunctions.isDarkMode(context)
//                                             ? Colors.black
//                                             : Colors.white,
//                                     radius: 100,
//                                     backgroundImage: _controller.user.value
//                                             .profilePhotoUrl.isNotEmpty
//                                         ? NetworkImage(_controller
//                                             .user.value.profilePhotoUrl)
//                                         : null,
//                                     child: _controller
//                                             .user.value.profilePhotoUrl.isEmpty
//                                         ? Icon(Icons.person,
//                                             color: THelperFunctions.isDarkMode(
//                                                     context)
//                                                 ? TColors.light
//                                                 : TColors.dark,
//                                             size: 100)
//                                         : null,
//                                   ),
//                                 )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Obx(
//                     () {
//                       final userName =
//                           _controller.user.value.name.capitalize.toString();
//                       return Text(
//                         userName.isNotEmpty ? 'Hey $userName,' : "Hey User,",
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w600),
//                       );
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TabBar(controller: _tabController, tabs: const [
//                     Tab(
//                       icon: Icon(
//                         Icons.fastfood,
//                         size: 30,
//                       ),
//                     ),
//                     Tab(
//                       icon: Icon(
//                         Icons.favorite,
//                         size: 30,
//                       ),
//                     ),
//                     Tab(
//                       icon: Icon(
//                         Icons.thumb_up,
//                         size: 30,
//                       ),
//                     ),
//                   ]),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       height: Get.height ,
//                       child: TabBarView(
//                         controller: _tabController,
//                         children: [
//                           RecipeHeader(),
//                            RecipeListScreen(),

//                           Column(
//                             children: [
//                               Container(
//                                 color: Colors.orange,
//                                 height: 200,
//                               ),
//                             ],
//                           ), // Placeholder for the first tab

//                           // Placeholder for the third tab
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/recipe/all_recipe.dart';
// import 'package:recipe_app/recipe/fetch_recipe.dart';
// import 'package:recipe_app/recipe/publisher_screen.dart';
// import 'package:recipe_app/recipe/recipe_header.dart';
// import 'package:recipe_app/recipe/wishlist_screen.dart';
// import 'package:recipe_app/user/controller.dart';
// import 'package:recipe_app/user/user_form.dart';
// import 'package:recipe_app/utils/constants/colors.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final user = FirebaseAuth.instance.currentUser;
//   final UserController _controller = Get.put(UserController());

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//   }

//   void _handleTabSelection() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: Get.height * 0.05),
//             Stack(
//               children: [
//                 Positioned(
//                   child: Container(
//                     height: 160,
//                     width: 160,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.grey,
//                       boxShadow: [
//                         BoxShadow(
//                           color: THelperFunctions.isDarkMode(context)
//                               ? const Color.fromARGB(255, 185, 185, 185)
//                               : const Color.fromARGB(255, 51, 51, 51),
//                           spreadRadius: 3,
//                           blurRadius: 20,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.to(UserFormScreen());
//                       },
//                       child: Obx(() => Padding(
//                             padding: const EdgeInsets.all(0.5),
//                             child: CircleAvatar(
//                               backgroundColor:
//                                   THelperFunctions.isDarkMode(context)
//                                       ? Colors.black
//                                       : Colors.white,
//                               radius: 100,
//                               backgroundImage: _controller
//                                       .user.value.profilePhotoUrl.isNotEmpty
//                                   ? NetworkImage(
//                                       _controller.user.value.profilePhotoUrl)
//                                   : null,
//                               child: _controller
//                                       .user.value.profilePhotoUrl.isEmpty
//                                   ? Icon(Icons.person,
//                                       color:
//                                           THelperFunctions.isDarkMode(context)
//                                               ? TColors.light
//                                               : TColors.dark,
//                                       size: 100)
//                                   : null,
//                             ),
//                           )),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 18),
//             Obx(
//               () {
//                 final userName =
//                     _controller.user.value.fname.capitalize.toString();
//                 return Text(
//                   userName.isNotEmpty ? 'Hey $userName,' : "Hey User,",
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.w600),
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//             TabBar(controller: _tabController, tabs: const [
//               Tab(
//                 icon: Icon(Icons.fastfood, size: 30),
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite, size: 30),
//               ),
//               Tab(
//                 icon: Icon(Icons.thumb_up, size: 30),
//               ),
//             ]),
//             SizedBox(
//               height: Get.height * 0.8,
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(RecipeListScreen());
//                           },
//                           child: Container(
//                             color: Colors.amber,
//                             height: Get.width * 0.4,
//                             width: 400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Container(
//                   //   height: Get.height,
//                   //   width: Get.width*0.8,
//                   //   child: RecipeListScreen()),
//                   WishlistScreen(),
//                   // SingleChildScrollView(
//                   //   child: RecipeHeader(),
//                   // ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Obx(() {
//                         if (_controller.user.value.accountType == 'Publisher') {
//                           return SizedBox(
//                             height: 60,
//                             width: Get.width*0.9,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Get.to(() => PublishRecipeScreen());
//                               },
//                               child: const Text('Publish Recipe'),
//                             ),
//                           );
//                         } else {
//                           return const SizedBox
//                               .shrink(); // Return an empty widget if not a publisher
//                         }
//                       }),
//                       Expanded(child: FetchRecipesScreen()),
//                     ],
//                   ), // Placeholder for the third tab
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/recipe/all_recipe.dart';
// import 'package:recipe_app/recipe/fetch_recipe.dart';
// import 'package:recipe_app/recipe/publisher_screen.dart';
// import 'package:recipe_app/recipe/recipe_header.dart';
// import 'package:recipe_app/recipe/wishlist_screen.dart';
// import 'package:recipe_app/user/controller.dart';
// import 'package:recipe_app/user/user_form.dart';
// import 'package:recipe_app/utils/constants/colors.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final user = FirebaseAuth.instance.currentUser;
//   final UserController _controller = Get.put(UserController());

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//   }

//   void _handleTabSelection() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: Get.height * 0.05),
//             Stack(
//               children: [
//                 Positioned(
//                   child: Container(
//                     height: 160,
//                     width: 160,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.grey,
//                       boxShadow: [
//                         BoxShadow(
//                           color: THelperFunctions.isDarkMode(context)
//                               ? const Color.fromARGB(255, 185, 185, 185)
//                               : const Color.fromARGB(255, 51, 51, 51),
//                           spreadRadius: 3,
//                           blurRadius: 20,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.to(UserFormScreen());
//                       },
//                       child: Obx(() => Padding(
//                             padding: const EdgeInsets.all(0.5),
//                             child: CircleAvatar(
//                               backgroundColor:
//                                   THelperFunctions.isDarkMode(context)
//                                       ? Colors.black
//                                       : Colors.white,
//                               radius: 100,
//                               backgroundImage: _controller
//                                       .user.value.profilePhotoUrl.isNotEmpty
//                                   ? NetworkImage(
//                                       _controller.user.value.profilePhotoUrl)
//                                   : null,
//                               child: _controller
//                                       .user.value.profilePhotoUrl.isEmpty
//                                   ? Icon(Icons.person,
//                                       color:
//                                           THelperFunctions.isDarkMode(context)
//                                               ? TColors.light
//                                               : TColors.dark,
//                                       size: 100)
//                                   : null,
//                             ),
//                           )),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 18),
//             Obx(
//               () {
//                 final userName =
//                     _controller.user.value.fname.capitalize.toString();
//                 return Text(
//                   userName.isNotEmpty ? 'Hey $userName,' : "Hey User,",
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.w600),
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//             TabBar(controller: _tabController, tabs: const [
//               Tab(
//                 icon: Icon(Icons.fastfood, size: 30),
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite, size: 30),
//               ),
//               Tab(
//                 icon: Icon(Icons.thumb_up, size: 30),
//               ),
//             ]),
//             SizedBox(
//               height: Get.height * 0.8,
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(RecipeListScreen());
//                           },
//                           child: Container(
//                             color: Colors.amber,
//                             height: Get.width * 0.4,
//                             width: 400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   WishlistScreen(),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Obx(() {
//                         if (_controller.user.value.accountType == 'Publisher') {
//                           return SizedBox(
//                             height: 60,
//                             width: Get.width * 0.9,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Get.to(() => PublishRecipeScreen());
//                               },
//                               child: const Text('Publish Recipe'),
//                             ),
//                           );
//                         } else {
//                           return const SizedBox
//                               .shrink(); // Return an empty widget if not a publisher
//                         }
//                       }),
//                       Expanded(
//                         child: SizedBox(
//                           height: Get.height * 0.6, // Constrain the height
//                           child: FetchRecipesScreen(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myrecipe_app/authentication/login.dart';
import 'package:myrecipe_app/recipe/all_recipe.dart';
import 'package:myrecipe_app/recipe/publisher_screen.dart';
import 'package:myrecipe_app/recipe/wishlist_screen.dart';
import 'package:myrecipe_app/user/controller.dart';
import 'package:myrecipe_app/user/user_form.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final user = FirebaseAuth.instance.currentUser;
  final UserController _controller = Get.put(UserController());
  final _auth = FirebaseAuth.instance;
  final GetStorage storage = GetStorage();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void Logout() async {
    await _auth.signOut();
    await storage.erase();
    Get.offAll(LoginScreen());
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: THelperFunctions.isDarkMode(context)
                            ? const Color.fromARGB(255, 185, 185, 185)
                            : const Color.fromARGB(255, 51, 51, 51),
                        spreadRadius: 3,
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(UserFormScreen());
                    },
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: CircleAvatar(
                            backgroundColor:
                                THelperFunctions.isDarkMode(context)
                                    ? Colors.black
                                    : Colors.white,
                            radius: 100,
                            backgroundImage: _controller
                                    .user.value.profilePhotoUrl.isNotEmpty
                                ? NetworkImage(
                                    _controller.user.value.profilePhotoUrl)
                                : null,
                            child: _controller
                                    .user.value.profilePhotoUrl.isEmpty
                                ? Icon(Icons.person,
                                    color: THelperFunctions.isDarkMode(context)
                                        ? TColors.light
                                        : TColors.dark,
                                    size: 100)
                                : null,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Obx(
            () {
              final userName =
                  _controller.user.value.fname.capitalize.toString();
              return Text(
                userName.isNotEmpty ? 'Hey $userName,' : "Hey User,",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              );
            },
          ),
          const SizedBox(height: 20),
          TabBar(controller: _tabController, tabs: const [
            Tab(
              icon: Icon(Icons.favorite, size: 30),
            ),
            Tab(
              icon: Icon(Icons.thumb_up, size: 30),
            ),
          ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // SingleChildScrollView(
                //   child: Column(
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.to(RecipeListScreen());
                //         },
                //         child: Container(
                //           // color: Colors.amber,
                //           height: Get.height,
                //           width: 400,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // RecipeListScreen(),
                WishlistScreen(),
                Column(
                  children: [
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Logout();
                    //     },
                    //     child: Text('Logout')),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (_controller.user.value.accountType == 'Publisher') {
                        return SizedBox(
                          height: 60,
                          width: Get.width * 0.9,
                          child:
                              // ElevatedButton(
                              //   onPressed: () {
                              //     Get.to(() => PublishRecipeScreen());
                              //   },
                              //   child: const Text('Publish Recipe'),
                              // ),
                              ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[700],
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Get.to(() => PublishRecipeScreen());
                            },
                            child:
                                // _signupController.isLoading.value
                                //     ? const CircularProgressIndicator()
                                const Text('Publish Recipe'),
                          ),
                        );
                      } else {
                        return const SizedBox
                            .shrink(); // Return an empty widget if not a publisher
                      }
                    }),

                    // Expanded(child: FetchRecipesScreen()),
                    // TextButton(onPressed: () {}, child: Text('Logout'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
