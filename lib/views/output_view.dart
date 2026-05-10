import 'package:flutter/material.dart';

class OutputView extends StatelessWidget {
  final List<Map<String, String>> employees;

  const OutputView({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Output Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: employees.isEmpty
          ? const Center(
              child: Text(
                "No Employees Added",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final emp = employees[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(emp["name"]![0].toUpperCase()),
                    ),
                    title: Text(emp["name"] ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${emp["id"]}"),
                        Text("Gender: ${emp["gender"]}"),
                        Text("Department: ${emp["dept"]}"),
                        Text("Username: ${emp["user"]}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}