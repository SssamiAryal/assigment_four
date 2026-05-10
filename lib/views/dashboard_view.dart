import 'package:flutter/material.dart';
import 'package:assignment_4/views/employee_view.dart';
import 'package:assignment_4/views/grid_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo.shade400,
              Colors.indigo.shade900,
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [

              const SizedBox(height: 50),

              const Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Select an option",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 60),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Column(
                    children: [

                      // Employee Card
                      buildCard(
                        context,
                        title: "Employee Screen",
                        icon: Icons.person,
                        color1: Colors.blue,
                        color2: Colors.blueAccent,
                        page: const EmployeeView(),
                      ),

                      const SizedBox(height: 20),

                      // Grid Card
                      buildCard(
                        context,
                        title: "Grid View Screen",
                        icon: Icons.grid_view,
                        color1: Colors.orange,
                        color2: Colors.deepOrange,
                        page: const GridViewScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color1,
    required Color color2,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },

      child: Container(
        width: double.infinity,
        height: 100,

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
          ),

          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          children: [

            Icon(icon, size: 40, color: Colors.white),

            const SizedBox(width: 20),

            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const Spacer(),

            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}