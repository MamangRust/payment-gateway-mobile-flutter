import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/store/auth.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  int _selectedIndex = 0;
  bool emailNotifications = true;
  bool pushNotifications = true;
  bool smsNotifications = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final authState = ref.read(authProvider);
      if (authState.isAuthenticated && authState.accessToken != null) {
        ref.read(userProvider.notifier).fetchUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Column(
        children: [
          _buildProfileHeader(user),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserState user) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/46998157?v=4"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.firstName != null
                      ? "${user.firstName} ${user.lastName ?? ''}"
                      : "Loading...",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email ?? "Loading...",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Text("Member since January 2024",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Edit Profile"),
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
    final user = ref.watch(userProvider);

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
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text("Full Name",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(user.firstName != null
                  ? "${user.firstName} ${user.lastName ?? ''}"
                  : "Loading..."),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.green),
              title: const Text("Email",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(user.email ?? "Loading..."),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityInfo() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text("Password"),
          subtitle: const Text("Last changed 3 months ago"),
          trailing: TextButton(onPressed: () {}, child: const Text("Change")),
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text("Two-Factor Authentication"),
          subtitle: const Text("Not enabled"),
          trailing: TextButton(onPressed: () {}, child: const Text("Enable")),
        ),
      ],
    );
  }

  Widget _buildPreferences() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text("Email notifications"),
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
          leading: const Icon(Icons.phone_android),
          title: const Text("Push notifications"),
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
          leading: const Icon(Icons.sms),
          title: const Text("SMS notifications"),
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
