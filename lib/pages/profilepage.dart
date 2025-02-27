import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  bool emailNotifications = true;
  bool pushNotifications = true;
  bool smsNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Column(
        children: [
          _buildProfileHeader(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=400&h=400&q=80"),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Doe",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("john.doe@example.com",
                    style: TextStyle(color: Colors.grey)),
                Text("Member since January 2024",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Edit Profile"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildPersonalInfo();
      case 1:
        return _buildSecurityInfo();
      case 2:
        return _buildPreferences();
      default:
        return Container();
    }
  }

  Widget _buildPersonalInfo() {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Personal Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text("Full Name",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("John Doe"),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title:
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("john.doe@example.com"),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.orange),
              title:
                  Text("Phone", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("+62 812 3456 7890"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityInfo() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Password"),
          subtitle: Text("Last changed 3 months ago"),
          trailing: TextButton(onPressed: () {}, child: Text("Change")),
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: Text("Two-Factor Authentication"),
          subtitle: Text("Not enabled"),
          trailing: TextButton(onPressed: () {}, child: Text("Enable")),
        ),
      ],
    );
  }

  Widget _buildPreferences() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Email notifications"),
          trailing: Switch(
            value: emailNotifications,
            onChanged: (value) {
              setState(() {
                emailNotifications = value;
              });
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone_android),
          title: Text("Push notifications"),
          trailing: Switch(
            value: pushNotifications,
            onChanged: (value) {
              setState(() {
                pushNotifications = value;
              });
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.sms),
          title: Text("SMS notifications"),
          trailing: Switch(
            value: smsNotifications,
            onChanged: (value) {
              setState(() {
                smsNotifications = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
