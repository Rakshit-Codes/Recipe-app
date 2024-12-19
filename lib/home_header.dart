// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:recipe_app/food.dart';
// import 'package:recipe_app/mic.dart';
// import 'package:recipe_app/searchbar.dart';
// import 'package:recipe_app/utils/constants/colors.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';

// class Home_Header extends StatelessWidget {
//   const Home_Header({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String userName = "Rakshit";
//     int freeDelivery_on_above_amount = 599;
//     String Address_of_user = "kadi ,Gujarat ,382165";
//     final TextEditingController searchController = TextEditingController();
//     final List<String> hintTexts = [
//       "Search " + "''Moong dal''",
//       "Search " + "''chips''",
//       "Search " + "''oil''",
//       "Search " + "''biscuts''",
//     ];

//     void _showMicDialog(BuildContext context) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return MicDialog();
//         },
//       );
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color:
//             THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,

//         // gradient: LinearGradient(
//         //   colors: THelperFunctions.isDarkMode(context)
//         //       ? [
//         //           TColors.darkGradientStart,
//         //           TColors.darkGradientmid,
//         //           TColors.darkGradientEnd
//         //         ]
//         //       : [
//         //           TColors.lightGradientStart,
//         //           TColors.lightGradientmid,
//         //           TColors.lightGradientEnd,
//         //         ],
//         //   begin: Alignment.topCenter,
//         //   end: Alignment.bottomCenter,
//         // ),
//         borderRadius: const BorderRadiusDirectional.only(
//           bottomEnd: Radius.circular(20),
//           bottomStart: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             Get.to(FoodSectionScreen());
//                           },
//                           icon: Icon(
//                             Icons.account_circle,
//                             size: 30,
//                           )),
//                       const SizedBox(
//                         width: 2,
//                       ),
//                       const Text(
//                         "Welcome, ",
//                         style: TextStyle(
//                             fontSize: 20, letterSpacing: 1, color: TColors.Swg),
//                       ),
//                       Text(
//                         "$userName",
//                         style: const TextStyle(fontSize: 20, letterSpacing: 1),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // const Row(
//           //   children: [
//           //     Padding(
//           //       padding: EdgeInsets.only(left: 10),
//           //       child: Text(
//           //         "",
//           //         style: TextStyle(
//           //             fontSize: 18, fontWeight: FontWeight.w500),
//           //       ),
//           //     ),
//           //     SizedBox(
//           //       width: 5,
//           //     ),
//           //     // GestureDetector(
//           //     //   child: Container(
//           //     //     decoration: BoxDecoration(
//           //     //         color: THelperFunctions.isDarkMode(context)
//           //     //             ? TColors.light.withOpacity(0.3)
//           //     //             : TColors.dark.withOpacity(0.2),
//           //     //         borderRadius: BorderRadius.circular(7)),
//           //     //     child: Text(
//           //     //       " ⚡Know more  ",
//           //     //       style: TextStyle(
//           //     //         fontWeight: FontWeight.w400,
//           //     //         fontSize: 12,
//           //     //         color: THelperFunctions.isDarkMode(context)
//           //     //             ? const Color.fromARGB(255, 146, 231, 255)
//           //     //             : const Color.fromARGB(255, 0, 70, 90),
//           //     //       ),
//           //     //     ),
//           //     //   ),
//           //     //   onTap: () {},
//           //     // ),
//           //   ],
//           // ),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     Padding(
//           //       padding: const EdgeInsets.only(left: 10),
//           //       child: GestureDetector(
//           //         child: Text(
//           //           Address_of_user.length > 20
//           //               ? '${Address_of_user.substring(0, 20)}...'
//           //               : Address_of_user,
//           //           style: TextStyle(
//           //             fontWeight: FontWeight.w200,
//           //             fontSize: 16,
//           //             color: THelperFunctions.isDarkMode(context)
//           //                 ? TColors.light
//           //                 : TColors.dark,
//           //           ),
//           //         ),
//           //         onTap: () {},
//           //       ),
//           //     ),
//           //     Padding(
//           //       padding: const EdgeInsets.only(right: 10),
//           //       child: IconButton(
//           //         onPressed: () {
//           //           Scaffold.of(context).openDrawer();

//           //         },
//           //         icon: const Icon(Iconsax.user),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           const SizedBox(
//             height: 15,
//           ),

//           ///          Search         ///
//           Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: SizedBox(
//               height: 65,
//               child: CustomScrollView(
//                 slivers: <Widget>[
//                   SliverAppBar(
//                     pinned: true,
//                     expandedHeight: 60.0,
//                     flexibleSpace: FlexibleSpaceBar(
//                       title: Search_Bar(
//                       onClear: () {
//                         searchController.clear();
//                       },
//                       onMic: () {
//                         _showMicDialog(context);
//                       },
//                       controller: searchController,
//                       hintTexts: hintTexts,
//                     ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           // Text(
//           //   "Unleash",
//           //   style: TextStyle(
//           //       color: TColors.success,
//           //       fontFamily: "kalambold",
//           //       fontWeight: FontWeight.w500,
//           //       fontSize: 22),
//           // ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Text(
//               //   "Enjoy",
//               //   style: TextStyle(
//               //       color: THelperFunctions.isDarkMode(context)
//               //           ? TColors.light.withOpacity(0.7)
//               //           : TColors.dark.withOpacity(0.7),
//               //       fontFamily: "kalam",
//               //       fontWeight: FontWeight.w500,
//               //       fontSize: 20),
//               // ),
//               const Text(
//                 "Bringing families together through food.",
//                 style: TextStyle(
//                     color: TColors.Swg,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20),
//               ),
//             ],
//           ),
//           // Text(
//           //   "On order above ₹$freeDelivery_on_above_amount",
//           //   style: TextStyle(
//           //       color: THelperFunctions.isDarkMode(context)
//           //           ? TColors.light.withOpacity(0.6)
//           //           : TColors.dark.withOpacity(0.6),
//           //       fontFamily: "kalam",
//           //       fontWeight: FontWeight.w600,
//           //       fontSize: 16),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/mic.dart';
// import 'package:recipe_app/recipe/all_recipe.dart';
// import 'package:recipe_app/searchbar.dart';
// import 'package:recipe_app/user/controller.dart';
// import 'package:recipe_app/user/user_form.dart';
// import 'package:recipe_app/utils/constants/colors.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

// class Home_Header extends StatelessWidget {
//   Home_Header({super.key});
//   final AdvancedDrawerController advancedDrawerController =
//       AdvancedDrawerController();
//   final UserController _controller = Get.put(UserController());

//   @override
//   Widget build(BuildContext context) {
//     String userName = "Rakshit";
//     int freeDeliveryOnAboveAmount = 599;
//     String addressOfUser = "Kadi, Gujarat, 382165";
//     final TextEditingController searchController = TextEditingController();
//     final List<String> hintTexts = [
//       "Search 'Moong dal'",
//       "Search 'chips'",
//       "Search 'oil'",
//       "Search 'biscuits'",
//     ];

//     void _showMicDialog(BuildContext context) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return MicDialog();
//         },
//       );
//     }

//     return Container(
//       decoration: BoxDecoration(
//         color:
//             THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
//         borderRadius: const BorderRadiusDirectional.only(
//           bottomEnd: Radius.circular(20),
//           bottomStart: Radius.circular(20),
//         ),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const SizedBox(width: 10),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(UserFormScreen());
//                     },
//                     child: Obx(() => Padding(
//                           padding: const EdgeInsets.all(0.5),
//                           child: CircleAvatar(
//                             backgroundColor: THelperFunctions.isDarkMode(context)
//                                 ? Colors.black
//                                 : Colors.white,
//                             radius: 100,
//                             backgroundImage:
//                                 _controller.user.value.profilePhotoUrl.isNotEmpty
//                                     ? NetworkImage(
//                                         _controller.user.value.profilePhotoUrl)
//                                     : null,
//                             child: _controller.user.value.profilePhotoUrl.isEmpty
//                                 ? Icon(Icons.person,
//                                     color: THelperFunctions.isDarkMode(context)
//                                         ? TColors.light
//                                         : TColors.dark,
//                                     size: 40)
//                                 : null,
//                           ),
//                         )),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   "Welcome, ",
//                   style: TextStyle(
//                       fontSize: 20, letterSpacing: 1, color: TColors.Swg),
//                 ),
//                 Text(
//                   userName,
//                   style: const TextStyle(fontSize: 20, letterSpacing: 1),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),

//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: SizedBox(
//                 height: 65,
//                 child: Search_Bar(
//                   onClear: () {
//                     searchController.clear();
//                   },
//                   onMic: () {
//                     _showMicDialog(context);
//                   },
//                   controller: searchController,
//                   hintTexts: hintTexts,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Tagline
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Bringing families together through food.",
//                   style: TextStyle(
//                       color: TColors.Swg,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Stack(children: [
//               Positioned(child: RecipeListScreen())
//             ],),
//             // RecipeListScreen(),
//           ],
//         ),
//       ),
//     );
//   }

//   void drawerControl() {
//     advancedDrawerController.showDrawer();
//   }
// }

// class RecipeCard extends StatelessWidget {
//   final String? imagePath;
//   final String title;
//   final String totalTime;

//   RecipeCard({
//     this.imagePath,
//     required this.title,
//     required this.totalTime,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//     // return
//     // GridView.builder(
//     //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
//     //   itemCount: 5,
//     //   itemBuilder: (context, index) {
//     //     return Card(
//     //       child: Container(
//     //         height: 200,
//     //         width: 160,
//     //         child: Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: [
//     //             Container(
//     //               height: 100,
//     //               width: 160,
//     //               color: Colors.grey,
//     //               // child: Image.asset(imagePath!, fit: BoxFit.cover),
//     //               child: Center(
//     //                   child: Text("Image here")), // Placeholder for the image
//     //             ),
//     //             Padding(
//     //               padding: const EdgeInsets.all(8.0),
//     //               child: Text(
//     //                 title,
//     //                 style: TextStyle(fontWeight: FontWeight.bold),
//     //               ),
//     //             ),
//     //             Padding(
//     //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     //               child: Text('Total Time: $totalTime'),
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //     );
//     //   },

//     //   // itemBuilder:
//     //   // Card(
//     //   //   child: Container(
//     //   //     height: 200,
//     //   //     width: 160,
//     //   //     child: Column(
//     //   //       crossAxisAlignment: CrossAxisAlignment.start,
//     //   //       children: [
//     //   //         Container(
//     //   //           height: 100,
//     //   //           width: 160,
//     //   //           color: Colors.grey,
//     //   //           // child: Image.asset(imagePath!, fit: BoxFit.cover),
//     //   //           child: Center(child: Text("Image here")), // Placeholder for the image
//     //   //         ),
//     //   //         Padding(
//     //   //           padding: const EdgeInsets.all(8.0),
//     //   //           child: Text(
//     //   //             title,
//     //   //             style: TextStyle(fontWeight: FontWeight.bold),
//     //   //           ),
//     //   //         ),
//     //   //         Padding(
//     //   //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     //   //           child: Text('Total Time: $totalTime'),
//     //   //         ),
//     //   //       ],
//     //   //     ),
//     //   //   ),
//     //   // ),
//     // );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/mic.dart';
// import 'package:recipe_app/recipe/all_recipe.dart';
// import 'package:recipe_app/searchbar.dart';
// import 'package:recipe_app/user/controller.dart';
// import 'package:recipe_app/user/user_form.dart';
// import 'package:recipe_app/utils/constants/colors.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

// class Home_Header extends StatelessWidget {
//   Home_Header({super.key});
//   final AdvancedDrawerController advancedDrawerController =
//       AdvancedDrawerController();
//   final UserController _controller = Get.put(UserController());

//   @override
//   Widget build(BuildContext context) {
//     String userName = "Rakshit";
//     int freeDeliveryOnAboveAmount = 599;
//     String addressOfUser = "Kadi, Gujarat, 382165";
//     final TextEditingController searchController = TextEditingController();
//     final List<String> hintTexts = [
//       "Search 'Moong dal'",
//       "Search 'chips'",
//       "Search 'oil'",
//       "Search 'biscuits'",
//     ];

//     void _showMicDialog(BuildContext context) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return MicDialog();
//         },
//       );
//     }

//     return Container(
//       height: Get.height,
//       decoration: BoxDecoration(
//         color:
//             THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
//         borderRadius: const BorderRadiusDirectional.only(
//           bottomEnd: Radius.circular(20),
//           bottomStart: Radius.circular(20),
//         ),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const SizedBox(width: 10),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(UserFormScreen());
//                     },
//                     child: Obx(() => Padding(
//                           padding: const EdgeInsets.all(0.5),
//                           child: CircleAvatar(
//                             backgroundColor:
//                                 THelperFunctions.isDarkMode(context)
//                                     ? Colors.black
//                                     : Colors.white,
//                             radius: 100,
//                             backgroundImage: _controller
//                                     .user.value.profilePhotoUrl.isNotEmpty
//                                 ? NetworkImage(
//                                     _controller.user.value.profilePhotoUrl)
//                                 : null,
//                             child: _controller
//                                     .user.value.profilePhotoUrl.isEmpty
//                                 ? Icon(Icons.person,
//                                     color: THelperFunctions.isDarkMode(context)
//                                         ? TColors.light
//                                         : TColors.dark,
//                                     size: 40)
//                                 : null,
//                           ),
//                         )),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   "Welcome, ",
//                   style: TextStyle(
//                       fontSize: 20, letterSpacing: 1, color: TColors.Swg),
//                 ),
//                 Text(
//                   userName,
//                   style: const TextStyle(fontSize: 20, letterSpacing: 1),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),

//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: SizedBox(
//                 height: 65,
//                 child: Search_Bar(
//                   onClear: () {
//                     searchController.clear();
//                   },
//                   onMic: () {
//                     _showMicDialog(context);
//                   },
//                   controller: searchController,
//                   hintTexts: hintTexts,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),

//             //   IconButton(
//             //   icon: const Icon(Icons.favorite),
//             //   onPressed: () {
//             //     Get.to(() => WishlistScreen());
//             //   },
//             // ),

//             // Bounded height for RecipeListScreen
//           ],
//         ),
//       ),
//     );
//   }

//   void drawerControl() {
//     advancedDrawerController.showDrawer();
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:myrecipe_app/mic.dart';
import 'package:myrecipe_app/recipe/recipe_home_screnn.dart';
import 'package:myrecipe_app/searchbar.dart';
import 'package:myrecipe_app/user/controller.dart';
import 'package:myrecipe_app/user/user_form.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class Home_Header extends StatelessWidget {
  Home_Header({super.key});

  final UserController _controller = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    String userName = "Rakshit";
    final TextEditingController searchController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;
    // final user = FirebaseAuth.instance.currentUser;
    final List<String> hintTexts = [
      "Search for  'Cake'",
      "Search for  'Breakfast'",
      "Search for  'Appetizer'",
      "Search for  'continental'",
    ];

    void _showMicDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MicDialog();
        },
      );
    }

    return Container(
      height: 135, // Fixed height for Home_Header
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.primary,
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20),
          bottomStart: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    Get.to(RecipeHomeScreen());
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
                          child: _controller.user.value.profilePhotoUrl.isEmpty
                              ? Icon(Icons.person,
                                  color: THelperFunctions.isDarkMode(context)
                                      ? TColors.light
                                      : TColors.dark,
                                  size: 40)
                              : null,
                        ),
                      )),
                ),
              ),
              const SizedBox(width: 10),
                        Obx(
            () {
              final userName =
                  _controller.user.value.fname.capitalize.toString();
              return Text(
                userName.isNotEmpty ? 'Welcome $userName,' : "Welcome User,",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: TColors.Swg),
              );
            },
          ),
              // const Text(
              //   "Welcome, ",
              //   style: TextStyle(
              //       fontSize: 20, letterSpacing: 1, color: TColors.Swg),
              // ),
              // Text(
              //   userName,
              //   style: const TextStyle(fontSize: 20, letterSpacing: 1),
              // ),
            ],
          ),
          const SizedBox(height: 15),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 65,
              child: Search_Bar(
                onTap: (){
                  Get.to(()=> RecipeHomeScreen());
                },
                onClear: () {
                  searchController.clear();
                },
                onMic: () {
                  _showMicDialog(context);
                },
                controller: searchController,
                hintTexts: hintTexts,
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

}


class RecipeCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String totalTime;

  RecipeCard({
    this.imagePath,
    required this.title,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



 // return
    // GridView.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
    //   itemCount: 5,
    //   itemBuilder: (context, index) {
    //     return Card(
    //       child: Container(
    //         height: 200,
    //         width: 160,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               height: 100,
    //               width: 160,
    //               color: Colors.grey,
    //               // child: Image.asset(imagePath!, fit: BoxFit.cover),
    //               child: Center(
    //                   child: Text("Image here")), // Placeholder for the image
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(
    //                 title,
    //                 style: TextStyle(fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //               child: Text('Total Time: $totalTime'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },

    //   // itemBuilder:
    //   // Card(
    //   //   child: Container(
    //   //     height: 200,
    //   //     width: 160,
    //   //     child: Column(
    //   //       crossAxisAlignment: CrossAxisAlignment.start,
    //   //       children: [
    //   //         Container(
    //   //           height: 100,
    //   //           width: 160,
    //   //           color: Colors.grey,
    //   //           // child: Image.asset(imagePath!, fit: BoxFit.cover),
    //   //           child: Center(child: Text("Image here")), // Placeholder for the image
    //   //         ),
    //   //         Padding(
    //   //           padding: const EdgeInsets.all(8.0),
    //   //           child: Text(
    //   //             title,
    //   //             style: TextStyle(fontWeight: FontWeight.bold),
    //   //           ),
    //   //         ),
    //   //         Padding(
    //   //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //   //           child: Text('Total Time: $totalTime'),
    //   //         ),
    //   //       ],
    //   //     ),
    //   //   ),
    //   // ),
    // );