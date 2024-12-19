// import 'package:flutter/material.dart';

// class CategoriesScreen extends StatefulWidget {
//   const CategoriesScreen({super.key});

//   @override
//   State<CategoriesScreen> createState() => _CategoriesScreenState();
// }

// class _CategoriesScreenState extends State<CategoriesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Row(
//               children: [
//                 Text(
//                   'New Recipes',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),

                
//               ],
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     RecipeCard(
//                       // imagePath: 'assets/garelu_and_chicken_curry.jpg',
//                       title: 'Garelu and Chicken Curry',
//                       totalTime: '70 mins',
//                     ),
//                     const SizedBox(width: 15),
//                     RecipeCard(
//                       // imagePath: 'assets/kattu_pappu.jpg',
//                       title: 'Kattu Pappu',
//                       totalTime: '20 mins',
//                     ),
//                     const SizedBox(width: 15),
//                     RecipeCard(
//                       // imagePath: 'assets/gal.jpg',
//                       title: 'Gal',
//                       totalTime: 'TBD mins',
//                     ),
//                     const SizedBox(width: 15),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   // Add your navigation logic here
//                 },
//                 child: Text('Explore more →'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
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
//     return Card(
//       child: Container(
//         width: 160,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 100,
//               width: 160,
//               color: Colors.grey,
//               // child: Image.asset(imagePath!, fit: BoxFit.cover),
//               child: Center(child: Text("Image here")), // Placeholder for the image
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
//   }
// }

      


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      // Center(
      //   child: Text('Categories  Screen'),
      // ),
      Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              color: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.all(10),
              //   // borderRadius: BorderRadius.circular(16.0),
              // ),
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: 
                     Text('FOOD DELIVERY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    subtitle: Text('FROM RESTAURANTS',
                        style: TextStyle(color: Colors.black54)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50),
                        Text(
                          'Up to 50% OFF & Free Delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.orange),
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











// // body: Center(
// //           child: Text(
// //         'Categories Screen',
// //         style: TextStyle(fontSize: 20),
// //       )),