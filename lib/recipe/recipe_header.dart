// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/recipe/publisher_screen.dart';
// import 'package:recipe_app/user/controller.dart';

// class RecipeHeader extends StatelessWidget {
//   const RecipeHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final UserController _controller = Get.put(UserController());

//     return Obx(() {
//       if (_controller.user.value.accountType == 'Publisher') {
//         return SizedBox(
//           height: 70,
//           width: Get.width,
//           child: ElevatedButton(
//             onPressed: () {
//               Get.to(PublishRecipeScreen());
//             },
//             child: const Text('Publish Recipe'),
//           ),
//         );
//       } else {
//         return const SizedBox.shrink(); // Return an empty widget if not a publisher
//       }
//     });
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/recipe/publisher_screen.dart';
import 'package:myrecipe_app/user/controller.dart';

class RecipeHeader extends StatelessWidget {
  const RecipeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController _controller = Get.put(UserController());

    return Obx(() {
      if (_controller.user.value.accountType == 'Publisher') {
        return ElevatedButton(
          onPressed: () {
            Get.to(() => PublishRecipeScreen());
          },
          child: const Text('Publish Recipe'),
        );
      } else {
        return const SizedBox.shrink(); // Return an empty widget if not a publisher
      }
    });
  }
}