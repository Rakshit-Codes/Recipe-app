// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileForm extends StatefulWidget {
//   const ProfileForm({super.key});

//   @override
//   State<ProfileForm> createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//   }
//   var user = FirebaseAuth.instance?.currentUser.obs;
//   void _displayusername (){
//     user.displayName.obs.toString()??"user";
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
//                           height: 150,
//                           width: 150,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         top: 120,
//                         left: 120,
//                         child: Icon(
//                           Icons.add_a_photo,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Obx( (){
//                     return Text(
                      
                      
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     );},
//                   ),
//                   const SizedBox(
//                     height: 20,
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
//     super.dispose();
//   }
// }


import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var user = FirebaseAuth.instance.currentUser.obs;
  var userName = ''.obs;
  var userPhotoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() {
    if (user.value != null) {
      userName.value = user.value?.displayName ?? 'No Name';
      userPhotoUrl.value = user.value?.photoURL ?? '';
    }
  }

  void updateUser() {
    fetchUserData();
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> with SingleTickerProviderStateMixin {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Stack(
                    children: [
                      Obx(() {
                        return Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: profileController.userPhotoUrl.value.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(profileController.userPhotoUrl.value),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: Colors.black,
                          ),
                        );
                      }),
                      const Positioned(
                        top: 120,
                        left: 120,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return Text(
                      profileController.userName.value,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
