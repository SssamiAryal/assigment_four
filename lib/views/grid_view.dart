import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"name": "Bird", "image": "assets/images/bird.jpg"},
      {"name": "Dog", "image": "assets/images/dog.jpg"},
      {"name": "Cat", "image": "assets/images/cat.jpg"},
      {"name": "Elephant", "image": "assets/images/elephant.jpg"},
      {"name": "Horse", "image": "assets/images/horse.jpg"},
      {"name": "Kangaro", "image": "assets/images/kangaro.jpg"},
      {"name": "Leopard", "image": "assets/images/cat.jpg"},
      {"name": "Lion", "image": "assets/images/lion.jpg"},
      {"name": "Tiger", "image": "assets/images/tiger.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemBuilder: (context, index) {
            final item = items[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black12,
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        item["image"]!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    item["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}