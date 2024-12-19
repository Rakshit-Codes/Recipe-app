

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:myrecipe_app/main_home_screen.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final AdvancedDrawerController advancedDrawerController =
    AdvancedDrawerController();

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Store search results
  // Track search progress

  // @override
  // void initState() {
  //   super.initState();
  //   // Start the timer to change the hintText every 3 seconds

  //   Timer.periodic(const Duration(seconds: 6), (timer) {
  //     setState(() {
  //       _hintTextIndex = (_hintTextIndex + 1) % _hintTexts.length;
  //     });
  //   });
  // }

  // List<Widget> _widgetOptions = <Widget>[
  //   HomeContent(),
  //   AddProductScreen(),
  //   AddProductScreen(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      print("hi");
      _selectedIndex = index;
    });
  }

  // Future<void> _performSearch(String searchTerm) async {
  //   setState(() {
  //     _searchInProgress = true; // Indicate search in progress
  //   });

  //   try {
  //     // Query Firestore for products matching the search term
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection('products')
  //             .where('productName', isGreaterThanOrEqualTo: searchTerm)
  //             .where('productName', isLessThanOrEqualTo: searchTerm + '\uf8ff')
  //             .get();

  //     // Extract search results from the query snapshot
  //     List<Map<String, dynamic>> searchResults = [];
  //     querySnapshot.docs.forEach((doc) {
  //       Map<String, dynamic> data = doc.data();
  //       searchResults.add({
  //         'product': data['productName'],
  //         'brand': data['brandName'],
  //         'image': data['productLogoUrl'],
  //         'price': " ₹ " + data['price'].toString(),
  //       });
  //     });

  //     setState(() {
  //       _searchResults = searchResults; // Update search results
  //     });
  //   } catch (error) {
  //     print('Error searching products: $error');
  //     // Handle error here (e.g., show error message to user)
  //   } finally {
  //     setState(() {
  //       _searchInProgress = false; // Indicate search completed
  //     });
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor:
  //         THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,

  //     ///                body                   ///
  //     drawer: Drawer_body(),

  //     body: SingleChildScrollView(
  //       // child: SafeArea(
  //       child: Builder(builder: (context) {
  //         return Column(
  //           children: [
  //             SizedBox(
  //               height: 40,
  //               child: Container( 
  //                 color: THelperFunctions.isDarkMode(context)
  //                     ? TColors.darkGradientStart
  //                     : TColors.lightGradientStart,
  //               ),
  //             ),

  //             ///               home header             ///
  //             Home_Header(),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             BestSellers_Home(),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             FloatingActionButton(
  //               onPressed: () {
  //                 // Add your onPressed code here!
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   SnackBar(
  //                     content: Text('FAB Pressed!'),
  //                   ),
  //                 );
  //               },
  //               tooltip: 'Increment',
  //               child: Icon(Icons.add),
  //               backgroundColor: Colors.deepPurple,
  //               elevation: 5.0,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12.0),
  //               ),
  //             ),
  //           ],
  //         );
  //       }),
  //     ),
  //   );
  // }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.primary,

      /// Drawer
      // drawer: Drawer_body(),

      /// Body
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Container(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.darkGradientStart
                              : TColors.lightGradientStart,
                        ),
                      ),
                     
                      // Home_Header(),
                       MainHomeScreen(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar

      /// Floating Action Button
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //     // ScaffoldMessenger.of(context).showSnackBar(
      //     //   SnackBar(
      //     //     content: Text('FAB Pressed!'),
      //     //   ),
      //     // );
      //   },
      //   tooltip: 'Categories',
      //   child: Icon(Icons.add,size: 20,),
      //   backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      //   elevation: 5.0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(22.0),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void drawerControl() {
    advancedDrawerController.showDrawer();
  }
}

// import 'package:flutter/material.dart';
// import 'package:recipe_app/home_header.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Home_Header(),
//         ],
//       ),
//     );
//   }
// }
