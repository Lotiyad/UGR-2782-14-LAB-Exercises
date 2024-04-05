import 'package:flutter/material.dart';

void main() {
  runApp(const TrackerApp());
}

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const TrackerScreen(),
    );
  }
}

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracker'),
      ),
      body: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map, color: Colors.blue),
                Text('Map', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.location_on, color: Colors.blue),
                Text('Location', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.history, color: Colors.blue),
                Text('History', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.pin_drop, color: Colors.blue),
                Text('Set Geofence', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.info, color: Colors.blue),
                Text('Detail Info', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.edit, color: Colors.blue),
                Text('Edit Device', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.blue),
                Text('Change Center Number',
                    style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.block, color: Colors.blue),
                Text('Disabled Menu', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.gps_fixed, color: Colors.blue),
                Text('Set GPS', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.refresh, color: Colors.blue),
                Text('Restart Device', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.power_settings_new, color: Colors.blue),
                Text('Power Saving', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.toggle_on, color: Colors.blue),
                Text('Normal Mode', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.power_settings_new, color: Colors.blue),
                Text('Shutdown', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.build, color: Colors.blue),
                Text('Device Command', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20),
                Icon(Icons.contact_mail, color: Colors.blue),
                Text('Contact Us', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
