import 'package:flutter/material.dart';
import 'package:flutter_homework/login.dart';
import 'package:flutter_homework/pharmamate.dart';

class Dashboard2 extends StatelessWidget {
  const Dashboard2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> devices = [
      {'name': 'Living room', 'image': 'images/livingroom.png'},
      {'name': 'Desk lamp', 'image': 'images/desklamp.png'},
      {'name': 'Garage door', 'image': 'images/garagedoor.png'},
      {'name': 'Kids room', 'image': 'images/kidsroom.png'},
      {'name': 'DHT 12', 'image': 'images/dht12.png'},
      {'name': 'Backyard lights', 'image': 'images/backyard.png'},
      {'name': 'Mother room', 'image': 'images/mother-room.png'},
      {
        'name': 'Pharma',
        'image': 'images/pharma.png',
        'route': const PharmaMateApp()
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/h.png',
              height: 50,
            ),
            const Text(
              'iSHOP',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              iconSize: 32,
              color: Colors.blue,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.support_agent_outlined),
            iconSize: 32,
            color: Colors.blue,
            onPressed: () {
              // Handle support icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 32,
            color: Colors.blue,
            onPressed: () {
              // Handle menu icon press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (devices[index]['name'] == 'Pharma') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PharmaMateApp(),
                    ),
                  );
                }
              },
              child: DeviceTile(
                deviceName: devices[index]['name'],
                icon: devices[index]['icon'],
                image: devices[index]['image'],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/devices.png',
              height: 24,
              width: 24,
              color: Colors.blue,
            ),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/automation.png',
              height: 24,
              width: 24,
              color: Colors.blue,
            ),
            label: 'Automation',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/notification.png',
              height: 24,
              width: 24,
              color: Colors.blue,
            ),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation
        },
      ),
    );
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final IconData? icon;
  final String? image;

  const DeviceTile(
      {super.key, required this.deviceName, this.icon, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Icon(
                  icon,
                  size: 50,
                  color: Colors.blue,
                )
              : image != null
                  ? Image.asset(
                      image!,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
          const SizedBox(height: 10),
          Text(
            deviceName,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
