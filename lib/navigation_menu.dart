
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myrecipe_app/categorie.dart';
// import 'package:myrecipe_app/dashboard.dart';
// import 'package:myrecipe_app/home_header.dart';
// import 'package:myrecipe_app/main_home_screen.dart';
// import 'package:myrecipe_app/profile_screen.dart';
// import 'package:myrecipe_app/recipe/recipe_home_screnn.dart';
// import 'package:myrecipe_app/search_screen.dart';
// import 'package:myrecipe_app/utils/constants/colors.dart';

// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({super.key});

//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   int currentTab = 1;
//   final List<Widget> screens = [
//     const MainHomeScreen(),
//     Home_Header(),
//     SearchScreen(),
//     CategoriesScreen(),
//     const Profile(),
//   ];

//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = const MainHomeScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(
//         child: currentScreen,
//         bucket: bucket,
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: TColors.primary,
//         height: 70,
//         shape: const CircularNotchedRectangle(),
//         child: SizedBox(
//           height: 70,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = const MainHomeScreen();
//                           currentTab = 1;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.home,
//                             color: currentTab == 1 ? TColors.Swg : TColors.button,
//                           ),
//                           Text(
//                             'Home',
//                             style: TextStyle(
//                               color: currentTab == 1 ? TColors.Swg : TColors.button,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = const DashboardScreen();
//                           currentTab = 2;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.edit,
//                             color: currentTab == 2 ? TColors.Swg : TColors.button,
//                           ),
//                           Text(
//                             'Edit',
//                             style: TextStyle(
//                               color: currentTab == 2 ? TColors.Swg : TColors.button,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = SearchScreen();
//                           currentTab = 3;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.search,
//                             color: currentTab == 3 ? TColors.Swg : TColors.button,
//                           ),
//                           Text(
//                             'Search',
//                             style: TextStyle(
//                               color: currentTab == 3 ? TColors.Swg : TColors.button,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = CategoriesScreen();
//                           currentTab = 4;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.category,
//                             color: currentTab == 4 ? TColors.Swg : TColors.button,
//                           ),
//                           Text(
//                             'Categories',
//                             style: TextStyle(
//                               color: currentTab == 4 ? TColors.Swg : TColors.button,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = const Profile();
//                           currentTab = 5;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.person,
//                             color: currentTab == 5 ? TColors.Swg : TColors.button,
//                           ),
//                           Text(
//                             'Profile',
//                             style: TextStyle(
//                               color: currentTab == 5 ? TColors.Swg : TColors.button,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:myrecipe_app/card_screen.dart';
import 'package:myrecipe_app/categorie.dart';
import 'package:myrecipe_app/dashboard.dart';
import 'package:myrecipe_app/home_header.dart';
import 'package:myrecipe_app/main_home_screen.dart';
import 'package:myrecipe_app/profile_screen.dart';
import 'package:myrecipe_app/recipe/fetch_recipe.dart';
import 'package:myrecipe_app/recipe/recipe_home_screnn.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentTab = 1;
  final List<Widget> screens = [
    const MainHomeScreen(),
    Home_Header(),
    // CardScreen(),
    FetchRecipesScreen(),
    RecipeHomeScreen(),
    // CategoriesScreen(),
    const Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const MainHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        
        color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.light,
        height: 70,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildNavButton(
                icon: Icons.home_outlined,
                text: 'Home',
                index: 1,
                onPressed: () {
                  setState(() {
                    currentScreen = const MainHomeScreen();
                    currentTab = 1;
                  });
                },
              ),
              buildNavButton(
                icon: Icons.edit_outlined,
                text: 'Edit',
                index: 2,
                onPressed: () {
                  setState(() {
                    // currentScreen = CardScreen();
                    currentScreen = FetchRecipesScreen();
                    currentTab = 2;
                  });
                },
              ),
              // buildNavButton(
              //   icon: Icons.search,
              //   text: 'Search',
              //   index: 3,
              //   onPressed: () {
              //     setState(() {
              //       currentScreen = RecipeHomeScreen();
              //       currentTab = 3;
              //     });
              //   },
              // ),
              // buildNavButton(
              //   icon: Icons.category,
              //   text: 'Categories',
              //   index: 4,
              //   onPressed: () {
              //     setState(() {
              //       currentScreen = CategoriesScreen();
              //       currentTab = 4;
              //     });
              //   },
              // ),
              buildNavButton(
                icon: Icons.person_outline,
                text: 'Profile',
                index: 5,
                onPressed: () {
                  setState(() {
                    currentScreen = const Profile();
                    currentTab = 5;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavButton({required IconData icon, required String text, required int index, required VoidCallback onPressed}) {
    return Expanded(
      child: MaterialButton(
        minWidth: 19,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: currentTab == index ? TColors.Swg : TColors.icon,
              size: 24, // Adjust size if needed
            ),
            Text(
              text,
              style: TextStyle(
                color: currentTab == index ? TColors.Swg : TColors.icon,
                fontSize: 12, // Adjust size if needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
