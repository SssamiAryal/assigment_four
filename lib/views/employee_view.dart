import 'package:flutter/material.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();

  List<Map<String, String>> employees = [];
  int? editingIndex;

  String? selectedGender;
  String? selectedDept;

  final List<String> genders = ["Male", "Female", "Other"];

  final List<String> departments = [
    "IT",
    "HR",
    "Finance",
    "Marketing",
    "Sales",
  ];

  void saveEmployee() {
    if (idController.text.isEmpty ||
        nameController.text.isEmpty ||
        userController.text.isEmpty ||
        passController.text.isEmpty ||
        selectedGender == null ||
        selectedDept == null) {
      return;
    }

    setState(() {
      final data = {
        "id": idController.text,
        "name": nameController.text,
        "gender": selectedGender!,
        "dept": selectedDept!,
        "user": userController.text,
        "pass": passController.text,
      };

      if (editingIndex == null) {
        employees.add(data);
      } else {
        employees[editingIndex!] = data;
        editingIndex = null;
      }

      clearFields();
    });
  }

  void clearFields() {
    idController.clear();
    nameController.clear();
    userController.clear();
    passController.clear();
    selectedGender = null;
    selectedDept = null;
  }

  void deleteEmployee(int index) {
    setState(() {
      employees.removeAt(index);
    });
  }

  void editEmployee(int index) {
    setState(() {
      editingIndex = index;

      idController.text = employees[index]["id"]!;
      nameController.text = employees[index]["name"]!;
      userController.text = employees[index]["user"]!;
      passController.text = employees[index]["pass"]!;
      selectedGender = employees[index]["gender"];
      selectedDept = employees[index]["dept"];
    });
  }

  Widget buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            buildField("Employee ID", idController),
            buildField("Full Name", nameController),

            DropdownButtonFormField(
              value: selectedGender,
              items: genders
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedGender = value);
              },
              decoration: const InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField(
              value: selectedDept,
              items: departments
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedDept = value);
              },
              decoration: const InputDecoration(
                labelText: "Department",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            buildField("Username", userController),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveEmployee,
                child: Text(
                  editingIndex == null ? "Save Employee" : "Update Employee",
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Employee List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            employees.isEmpty
                ? const Text(
                    "No Employees Added",
                    style: TextStyle(color: Colors.grey),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final emp = employees[index];

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(emp["name"]![0].toUpperCase()),
                          ),

                          title: Text(emp["name"]!),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID: ${emp["id"]}"),
                              Text("Gender: ${emp["gender"]}"),
                              Text("Dept: ${emp["dept"]}"),
                              Text("User: ${emp["user"]}"),
                              Text("Pass: ${emp["pass"]}"),
                            ],
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    color: Colors.blue),
                                onPressed: () => editEmployee(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                                onPressed: () => deleteEmployee(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}