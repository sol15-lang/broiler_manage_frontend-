import 'package:broilermanage/pages/profilepage/changepassword.dart';
import 'package:broilermanage/pages/profilepage/editprofilepage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // User Header
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/green-hill_53876-33577.avif',
              ), // replace later with network image
            ),
            const SizedBox(height: 10),
            Text(
              "Ethan Ithondeka",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Farm Manager @ GreenField Farm",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 30),

            // Account Info
            ListTile(
              leading: Icon(Icons.email),
              title: Text("super_admin@example.com"),
            ),
            ListTile(leading: Icon(Icons.phone), title: Text("0711222333")),
            ListTile(leading: Icon(Icons.work), title: Text("Role: Manager")),
            ListTile(
              leading: Icon(Icons.agriculture),
              title: Text("Farm: GreenField Farm"),
            ),

            const Divider(),

            // Actions
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit data"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text(
                        "Edit data",
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfilePage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minWidth: 50,
                            height: 50,
                            color: Colors.green,
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangePasswordPage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minWidth: 50,
                            height: 50,
                            color: Colors.green,
                            child: const Text(
                              "Change Password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                // handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
