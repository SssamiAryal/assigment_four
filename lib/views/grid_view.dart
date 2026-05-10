import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"name": "Side Bag", "img": "https://i.pravatar.cc/150?img=10"},
      {"name": "T-Shirt", "img": "https://i.pravatar.cc/150?img=11"},
      {"name": "Honey", "img": "https://i.pravatar.cc/150?img=12"},
      {"name": "Laptop", "img": "https://i.pravatar.cc/150?img=13"},
      {"name": "Mobile", "img": "https://i.pravatar.cc/150?img=14"},
      {"name": "Tablet", "img": "https://i.pravatar.cc/150?img=15"},
      {"name": "Horse", "img": "https://i.pravatar.cc/150?img=16"},
      {"name": "Dog", "img": "https://i.pravatar.cc/150?img=17"},
      {"name": "Cat", "img": "https://i.pravatar.cc/150?img=18"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View Screen"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: GridView.builder(
          itemCount: items.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),

          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.shade100,
                    Colors.indigo.shade50,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(items[index]["img"]!),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    items[index]["name"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}