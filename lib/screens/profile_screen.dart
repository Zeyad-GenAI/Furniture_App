import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF594137),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF594137),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Store Manager',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF594137),
                    ),
                  ),
                  Text(
                    'manager@furniture-store.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileOption(
                    Icons.settings,
                    'Settings',
                        () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Settings clicked')),
                    ),
                  ),
                  _buildProfileOption(
                    Icons.notifications,
                    'Notifications',
                        () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Notifications clicked')),
                    ),
                  ),
                  _buildProfileOption(
                    Icons.help,
                    'Help & Support',
                        () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Help clicked')),
                    ),
                  ),
                  _buildProfileOption(
                    Icons.info,
                    'About',
                        () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('About clicked')),
                    ),
                  ),
                  _buildProfileOption(
                    Icons.logout,
                    'Logout',
                        () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                          (route) => false,
                    ),
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap,
      {bool isLogout = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isLogout ? Colors.red : Color(0xFF594137),
                size: 24,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isLogout ? Colors.red : Color(0xFF594137),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}