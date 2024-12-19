// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:recipe_app/user/controller.dart';
// // // import 'package:recipe_app/user/user.dart';
// // // import 'package:recipe_app/user/user_service.dart';

// // // class UserForm extends StatefulWidget {
// // //   final RUser? user;

// // //   const UserForm({Key? key, this.user}) : super(key: key);

// // //   @override
// // //   _UserFormState createState() => _UserFormState();
// // // }

// // // class _UserFormState extends State<UserForm> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _userNameController = TextEditingController();
// // //   final _emailController = TextEditingController();
// // //   final _phoneNumberController = TextEditingController();
// // //   final _rUserController = Get.put(RUserController());

// // //   File? _image;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     if (widget.user != null) {
// // //       _userNameController.text = widget.user!.user_Name ?? '';
// // //       _emailController.text = widget.user!.email;
// // //       _phoneNumberController.text = widget.user!.phone_Number ?? '';
// // //       _image = widget.user!.mainImage;
// // //     }
// // //   }

// // //   Future<void> _pickImage() async {
// // //     final picker = ImagePicker();
// // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // //     if (pickedFile != null) {
// // //       setState(() {
// // //         _image = File(pickedFile.path);
// // //       });
// // //     }
// // //   }

// // //   void _saveUser() {
// // //     if (_formKey.currentState!.validate()) {
// // //       final newUser = RUser(
// // //         id: widget.user?.id ?? '',
// // //         user_Name: _userNameController.text,
// // //         email: _emailController.text,
// // //         phone_Number: _phoneNumberController.text,
// // //         mainImage: _image,
// // //       );

// // //       if (widget.user == null) {
// // //         _rUserController.addProduct(newUser);
// // //       } else {
// // //         _rUserController.updateProduct(newUser);
// // //       }

// // //       Navigator.of(context).pop();
// // //     }
// // //   }

// // //   void _deleteUser() {
// // //     if (widget.user != null) {
// // //       _rUserController.deleteProduct(widget.user!.id);
// // //       Navigator.of(context).pop();
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(widget.user == null ? 'Add User' : 'Edit User'),
// // //         actions: [
// // //           if (widget.user != null)
// // //             IconButton(
// // //               icon: Icon(Icons.delete),
// // //               onPressed: _deleteUser,
// // //             ),
// // //         ],
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Form(
// // //           key: _formKey,
// // //           child: ListView(
// // //             children: [
// // //               GestureDetector(
// // //                 onTap: _pickImage,
// // //                 child: _image != null
// // //                     ? Image.file(
// // //                         _image!,
// // //                         height: 200,
// // //                         width: 200,
// // //                         fit: BoxFit.cover,
// // //                       )
// // //                     : Container(
// // //                         height: 200,
// // //                         width: 200,
// // //                         color: Colors.grey,
// // //                         child: Icon(Icons.add_a_photo),
// // //                       ),
// // //               ),
// // //               TextFormField(
// // //                 controller: _userNameController,
// // //                 decoration: InputDecoration(labelText: 'User Name'),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter a user name';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               TextFormField(
// // //                 controller: _emailController,
// // //                 decoration: InputDecoration(labelText: 'Email'),
// // //                 validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'Please enter an email';
// // //                   }
// // //                   return null;
// // //                 },
// // //               ),
// // //               TextFormField(
// // //                 controller: _phoneNumberController,
// // //                 decoration: InputDecoration(labelText: 'Phone Number'),
// // //               ),
// // //               SizedBox(height: 20),
// // //               ElevatedButton(
// // //                 onPressed: _saveUser,
// // //                 child: Text(widget.user == null ? 'Add User' : 'Update User'),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _userNameController.dispose();
// // //     _emailController.dispose();
// // //     _phoneNumberController.dispose();
// // //     super.dispose();
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:image_cropper/image_cropper.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:recipe_app/user/controller.dart';
// // import 'package:recipe_app/user/user.dart';

// // class UserForm extends StatefulWidget {
// //   final RUser? user;

// //   const UserForm({Key? key, this.user}) : super(key: key);

// //   @override
// //   _UserFormState createState() => _UserFormState();
// // }

// // class _UserFormState extends State<UserForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   final RUserController _userController = Get.find();

// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _phoneController = TextEditingController();
// //   File? _photo;

// //   @override
// //   void initState() {
// //     super.initState();
// //     if (widget.user != null) {
// //       _nameController.text = widget.user!.user_Name ?? '';
// //       _emailController.text = widget.user!.email;
// //       _phoneController.text = widget.user!.phone_Number ?? '';
// //       _photo = widget.user!.mainImage;
// //     } else {
// //       // Load current user data if available
// //       if (_userController.currentUser.value != null) {
// //         _nameController.text = _userController.currentUser.value!.user_Name ?? '';
// //         _emailController.text = _userController.currentUser.value!.email;
// //         _phoneController.text = _userController.currentUser.value!.phone_Number ?? '';
// //         _photo = _userController.currentUser.value!.mainImage;
// //       }
// //     }
// //   }

// //   Future<void> _pickMainImage() async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(
// //       source: ImageSource.gallery,
// //       imageQuality: 85,
// //       maxWidth: 1024,
// //       maxHeight: 1024,
// //     );

// //     if (pickedFile != null) {
// //       File? croppedFile = await _cropImage(File(pickedFile.path));
// //       if (croppedFile != null) {
// //         setState(() {
// //           _photo = croppedFile;
// //         });
// //       }
// //     }
// //   }

// //   Future<File?> _cropImage(File file) async {
// //     File? croppedFile = await ImageCropper().cropImage(
// //       sourcePath: file.path,
// //       aspectRatioPresets: [
// //         CropAspectRatioPreset.square,
// //         CropAspectRatioPreset.ratio3x2,
// //         CropAspectRatioPreset.original,
// //         CropAspectRatioPreset.ratio4x3,
// //         CropAspectRatioPreset.ratio16x9
// //       ],
// //       androidUiSettings: const AndroidUiSettings(
// //         toolbarTitle: 'Crop Image',
// //         toolbarColor: Colors.deepOrange,
// //         toolbarWidgetColor: Colors.white,
// //         initAspectRatio: CropAspectRatioPreset.original,
// //         lockAspectRatio: false,
// //       ),
// //       iosUiSettings: const IOSUiSettings(
// //         minimumAspectRatio: 1.0,
// //       ),
// //     );
// //     return croppedFile != null ? File(croppedFile.path) : null;
// //   }

// //   void _saveUser() {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       RUser newUser = RUser(
// //         id: widget.user?.id ?? '', // Use a generated ID for new users
// //         user_Name: _nameController.text,
// //         email: _emailController.text,
// //         phone_Number: _phoneController.text,
// //         mainImage: _photo,
// //         isPublisher: widget.user?.isPublisher ?? false,
// //         isVerified: widget.user?.isVerified ?? false,
// //         follower: widget.user?.follower ?? 0,
// //         following: widget.user?.following ?? 0,
// //       );

// //       if (widget.user == null) {
// //         _userController.addProduct(newUser);
// //       } else {
// //         _userController.updateProduct(newUser);
// //       }

// //       Get.back();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.user == null ? 'Create User' : 'Edit User'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: ListView(
// //             children: [
// //               GestureDetector(
// //                 onTap: _pickMainImage,
// //                 child: CircleAvatar(
// //                   radius: 50,
// //                   backgroundImage: _photo != null ? FileImage(_photo!) : null,
// //                   child: _photo == null
// //                       ? Icon(Icons.person, size: 50, color: Colors.grey)
// //                       : null,
// //                 ),
// //               ),
// //               TextFormField(
// //                 controller: _nameController,
// //                 decoration: InputDecoration(labelText: 'Name'),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter a name';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               TextFormField(
// //                 controller: _emailController,
// //                 decoration: InputDecoration(labelText: 'Email'),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter an email';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               TextFormField(
// //                 controller: _phoneController,
// //                 decoration: InputDecoration(labelText: 'Phone Number'),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: _saveUser,
// //                 child: Text('Save'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/user/controller.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';
// import '../utils/constants/colors.dart';

// class UserFormScreen extends StatelessWidget {
//   final UserController _controller = Get.put(UserController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           if (_controller.isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (_controller.isFormFilled.value) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: const Icon(Icons.keyboard_arrow_left, size: 30))
//                   ],
//                 ),
//                 Center(
//                   child: Container(
//                     height: 180,
//                     width: 180,
//                    decoration: BoxDecoration(
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
//                     child: GestureDetector(
//                       // onTap: () => _controller.pickProfilePhoto(_controller.user.value.email),
//                       child: Obx(() => Padding(
//                             padding: const EdgeInsets.all(0.5),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.amber,
//                               radius: 100,
//                               backgroundImage: _controller
//                                       .user.value.profilePhotoUrl.isNotEmpty
//                                   ? NetworkImage(
//                                       _controller.user.value.profilePhotoUrl)
//                                   : null,
//                               child:
//                                   _controller.user.value.profilePhotoUrl.isEmpty
//                                       ? const Icon(Icons.camera_alt, size: 100)
//                                       : null,
//                             ),
//                           )),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   '${_controller.user.value.name.capitalize}',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w600, fontSize: 20),
//                 ),
//                 Text(
//                   _controller.user.value.email,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w400, fontSize: 16),
//                 ),
//                 Text(
//                   ' ${_controller.user.value.phoneNumber}',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w400, fontSize: 16),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Account Type : ',
//                       style:
//                           TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                     ),
//                     Text(
//                       _controller.user.value.accountType,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w600, fontSize: 18),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 OutlinedButton(
//                   style: const ButtonStyle(
//                       foregroundColor: WidgetStatePropertyAll(TColors.light)),
//                   onPressed: () {
//                     _controller.isFormFilled.value = false;
//                   },
//                   child: const Text(
//                     'Edit your profile',
//                     style: TextStyle(color: Colors.amber),
//                   ),
//                 ),
//               ],
//             );
//           }

//           return Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(

//                 children: [
//                   const SizedBox(height: 40,),
//                   Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: const Icon(Icons.keyboard_arrow_left, size: 30))
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () => _controller
//                         .pickProfilePhoto(_controller.user.value.email),
//                     child: Obx(() => CircleAvatar(
//                           radius: 80,
//                           backgroundImage:
//                               _controller.user.value.profilePhotoUrl.isNotEmpty
//                                   ? NetworkImage(
//                                       _controller.user.value.profilePhotoUrl)
//                                   : null,
//                           child: _controller.user.value.profilePhotoUrl.isEmpty
//                               ? const Icon(Icons.camera_alt, size: 80)
//                               : null,
//                         )),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     initialValue: _controller.user.value.name,
//                     decoration: const InputDecoration(labelText: 'Name'),
//                     onSaved: (value) {
//                       _controller.user.update((user) {
//                         if (user != null) {
//                           user.name = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     maxLength: 10,
//                     initialValue: _controller.user.value.phoneNumber,
//                     decoration: const InputDecoration(labelText: 'Phone Number'),
//                     onSaved: (value) {
//                       _controller.user.update((user) {
//                         if (user != null) {
//                           user.phoneNumber = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   DropdownButtonFormField<String>(
//                     value: _controller.user.value.accountType.isNotEmpty
//                         ? _controller.user.value.accountType
//                         : null,
//                     decoration: const InputDecoration(labelText: 'Account Type'),
//                     items: ['Publisher', 'User']
//                         .map((type) =>
//                             DropdownMenuItem(value: type, child: Text(type)))
//                         .toList(),
//                     onChanged: (value) {
//                       _controller.user.update((user) {
//                         if (user != null) {
//                           user.accountType = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select account type';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   SizedBox(
//                     width: Get.width,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           _formKey.currentState?.save();
//                           _controller.saveUser(_controller.user.value);
//                         }
//                       },
//                       child: const Text('Save'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myrecipe_app/authentication/login.dart';
import 'package:myrecipe_app/user/controller.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class UserFormScreen extends StatefulWidget {
  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final UserController _controller = Get.put(UserController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final GetStorage storage = GetStorage();

  bool _isDarkMode = true;

  @override
  void Logout() async {
    await _auth.signOut();
    await storage.erase();
    Get.offAll(LoginScreen());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_controller.isFormFilled.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.keyboard_arrow_left, size: 30))
                  ],
                ),
                Center(
                  child: Container(
                    height: 180,
                    width: 180,
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
                        ]),
                    child: GestureDetector(
                      // onTap: () => _controller.pickProfilePhoto(_controller.user.value.email),
                      child: Obx(() => Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 100,
                              backgroundImage: _controller
                                      .user.value.profilePhotoUrl.isNotEmpty
                                  ? NetworkImage(
                                      _controller.user.value.profilePhotoUrl)
                                  : null,
                              child:
                                  _controller.user.value.profilePhotoUrl.isEmpty
                                      ? const Icon(Icons.camera_alt, size: 100)
                                      : null,
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${_controller.user.value.fname.capitalize}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  _controller.user.value.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Text(
                  ' ${_controller.user.value.phoneNumber}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Account Type : ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Text(
                      _controller.user.value.accountType,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedToggleSwitch<bool>.dual(
                          animationDuration: const Duration(milliseconds: 600),
                          animationCurve: Curves.slowMiddle,
                          iconAnimationCurve: Curves.linear,
                          current: _isDarkMode,
                          first: false,
                          second: true,
                          spacing: 30.0,
                          height: 40,
                          style: const ToggleStyle(
                            borderColor: Colors.transparent,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          borderWidth: 2.0,
                          onChanged: (value) {
                            setState(() {
                              _isDarkMode = value;
                              if (_isDarkMode) {
                                Get.changeThemeMode(ThemeMode.dark);
                              } else {
                                Get.changeThemeMode(ThemeMode.light);
                              }
                            });
                          },
                          styleBuilder: (b) => ToggleStyle(
                            indicatorColor: b
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : const Color.fromARGB(255, 0, 124, 156),
                          ),
                          iconBuilder: (value) => value
                              ? const Icon(
                                  Iconsax.moon5,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.sunny,
                                  color: Color.fromARGB(255, 255, 191, 0),
                                ),
                          textBuilder: (value) => value
                              ? const Center(child: Text('Light'))
                              : const Center(child: Text('Dark')),
                        ),
                      ],
                    ),
                  ),
                ),

                // ListTile(
                //   title: Row(
                //     children: [
                //       AnimatedToggleSwitch<bool>.dual(
                //         animationDuration: const Duration(milliseconds: 600),
                //         animationCurve: Curves.slowMiddle,
                //         iconAnimationCurve: Curves.linear,
                //         current: _isDarkMode,
                //         first: false,
                //         second: true,
                //         spacing: 30.0,
                //         height: 40,
                //         style: const ToggleStyle(
                //           borderColor: Colors.transparent,
                //           boxShadow: const [
                //             BoxShadow(
                //               color: Colors.black26,
                //               spreadRadius: 1,
                //               blurRadius: 2,
                //               offset: Offset(0, 1.5),
                //             ),
                //           ],
                //         ),
                //         borderWidth: 2.0,
                //         onChanged: (value) {
                //           setState(() {
                //             _isDarkMode = value;
                //             if (_isDarkMode) {
                //               Get.changeThemeMode(ThemeMode.dark);
                //             } else {
                //               Get.changeThemeMode(ThemeMode.light);
                //             }
                //           });
                //         },
                //         styleBuilder: (b) => ToggleStyle(
                //           indicatorColor: b
                //               ? const Color.fromARGB(255, 0, 0, 0)
                //               : const Color.fromARGB(255, 0, 124, 156),
                //         ),
                //         iconBuilder: (value) => value
                //             ? const Icon(
                //                 Iconsax.moon5,
                //                 color: Colors.white,
                //               )
                //             : const Icon(
                //                 Icons.sunny,
                //                 color: Color.fromARGB(255, 255, 191, 0),
                //               ),
                //         textBuilder: (value) => value
                //             ? const Center(child: Text('Light'))
                //             : const Center(child: Text('Dark')),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(TColors.light)),
                  onPressed: () {
                    _controller.isFormFilled.value = false;
                  },
                  child: const Text(
                    'Edit your profile',
                    style: TextStyle(color: TColors.Swg),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                   width: Get.width * 0.37,
                  child: ElevatedButton(
                      onPressed: () {
                        Logout();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: THelperFunctions.isDarkMode(context)
                                ? TColors.dark
                                : TColors.light),
                      )),
                ),
              ],
            );
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.keyboard_arrow_left, size: 30))
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _controller
                        .pickProfilePhoto(_controller.user.value.email),
                    child: Obx(() => CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              _controller.user.value.profilePhotoUrl.isNotEmpty
                                  ? NetworkImage(
                                      _controller.user.value.profilePhotoUrl)
                                  : null,
                          child: _controller.user.value.profilePhotoUrl.isEmpty
                              ? const Icon(Icons.camera_alt, size: 80)
                              : null,
                        )),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: _controller.user.value.fname,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    onSaved: (value) {
                      _controller.user.update((user) {
                        if (user != null) {
                          user.fname = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: _controller.user.value.lname,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    onSaved: (value) {
                      _controller.user.update((user) {
                        if (user != null) {
                          user.lname = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 10,
                    initialValue: _controller.user.value.phoneNumber,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    onSaved: (value) {
                      _controller.user.update((user) {
                        if (user != null) {
                          user.phoneNumber = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _controller.user.value.accountType.isNotEmpty
                        ? _controller.user.value.accountType
                        : null,
                    decoration:
                        const InputDecoration(labelText: 'Account Type'),
                    items: ['Publisher', 'User']
                        .map((type) =>
                            DropdownMenuItem(value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) {
                      _controller.user.update((user) {
                        if (user != null) {
                          user.accountType = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select account type';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          _controller.saveUser(_controller.user.value);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
