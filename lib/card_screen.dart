import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   centerTitle: true,
      //   title: Text("cardwidget"),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              // handle the ontap function here:
            },
            child: Container(
              width: 180,
              height: 205,
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: [
                          //Image:
                          Image.asset(
                            "assets/sevtamatar.jpeg",
                            width: 255,
                          ),
        
                          //sale tag:
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "25%",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ),
        
                          //fav.Icon button:
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                // here handle the ontap:
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
        
                    //  details:
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          Text(
                            " Domino`s pizza",
                            style: Theme.of(context).textTheme.labelLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Domino`s",
                                style: Theme.of(context).textTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.verified,
                                  color: Colors.blueAccent, size: 20)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // price
                              Text(
                                "\$10.0",
                                style: Theme.of(context).textTheme.titleMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
        
                              // add icon:
                              /* Container(
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(16),
                                    )),
                                child: const SizedBox(
                                  width: 25 * 1.2,
                                  height: 25 * 1.2,
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white60,
                                  )),
                                ),
                              ), */
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}