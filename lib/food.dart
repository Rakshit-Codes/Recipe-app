import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodSectionScreen extends StatelessWidget {
  const FoodSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home, color: Colors.orange),
            SizedBox(width: 5),
            Text('Home'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.person),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for \'Pizza\'',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Offer Banner
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange[100],
            child: Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text('Claim your gift now! On order above ₹199'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Order now'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Carousel Banner (Placeholder)
          Container(
            height: 150,
            color: Colors.grey[300],
            child: const Center(child: Text('Carousel Banner')),
          ),
          const SizedBox(height: 16),

          // Welcome Offer
          const Text(
            'ENJOY YOUR WELCOME OFFER!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text('Get flat ₹125 off on your next order'),
          const SizedBox(height: 16),

          // Categories Grid
          SizedBox(
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryCard('Chinese Wok', '30-35 mins', '₹179',
                      'assets/images/chinese_wok.jpg'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildCategoryCard('Domino\'s Pizza', '20-25 mins',
                      '₹125 off', 'assets/images/dominos_pizza.jpg'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildCategoryCard('Gwalbhog', '30-35 mins', '₹125 off',
                      'assets/images/gwalbhog.jpg'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildCategoryCard('Burger King', '25-30 mins', '₹125 off',
                      'assets/images/burger_king.jpg'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // Filter, Sort By, Fast Delivery, and Cuisines Row
          SizedBox(
            height: 25,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filter'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.sort),
                    label: const Text('Sort by'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    child: const Text('Fast Delivery'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    child: const Text('Cuisines'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Restaurants to explore
          const Text(
            'Restaurants to explore',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Restaurant Cards
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  _buildRestaurantCard(
                    'Season 9',
                    '4.2 (10K+)',
                    '25-30 mins',
                    'Indian, Chinese, Continental',
                    'Naranpura',
                    '2.5 km',
                    '₹125 OFF',
                    'assets/images/season_9.jpg',
                    true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildRestaurantCard(
                    'Domino\'s Pizza',
                    '4.1 (5K+)',
                    '20-25 mins',
                    'Pizzas, Italian, Pastas, Desserts',
                    'Naranpura',
                    '2.5 km',
                    '₹150 OFF',
                    'assets/images/dominos_pizza.jpg',
                    true,
                  ),
                  _buildRestaurantCard(
                    'La Milano Pizzeria',
                    '4.4 (1K+)',
                    '15-20 mins',
                    'Italian, Pizzas, Pastas, Desserts',
                    'New Wadaj',
                    '2.5 km',
                    '₹125 OFF',
                    'assets/images/la_milano_pizzeria.jpg',
                    true,
                  ),
                  _buildRestaurantCard(
                    'La Pino\'z Pizza',
                    '4.2 (1K+)',
                    '15-20 mins',
                    'Pizzas, Pastas, Italian, Desserts',
                    'Nava Wadaj',
                    '1.5 km',
                    '₹125 OFF',
                    'assets/images/la_pinoz_pizza.jpg',
                    true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reorder),
            label: 'Reorder',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildCategoryCard(
      String title, String subtitle, String price, String imagePath) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle),
                Text(price, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(
    String title,
    String rating,
    String deliveryTime,
    String cuisine,
    String location,
    String distance,
    String discount,
    String imagePath,
    bool isPureVeg,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Row(
              children: [
                if (isPureVeg)
                  const Icon(
                    Icons.eco,
                    color: Colors.green,
                    size: 16,
                  ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rating),
                Text('$deliveryTime • $cuisine'),
                Text('$location • $distance'),
              ],
            ),
            trailing: const Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Text(
                  'FLAT DEAL',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 4),
                Text(
                  discount,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}