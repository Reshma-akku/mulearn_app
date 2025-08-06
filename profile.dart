import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, double> karmaData = {
    "IGLU": 20,
    "General Enablement": 15,
    "Profile Building": 25,
    "AI": 10,
    "Cyber Security": 10,
    "Web Development": 15,
    "Other": 5,
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Widget toggleSwitch(String text, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget profileCard(String title, Widget child) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child
        ]),
      ),
    );
  }

  Widget karmaPieChart() {
    return PieChart(
      dataMap: karmaData,
      chartType: ChartType.disc,
      chartRadius: 150,
      legendOptions: const LegendOptions(showLegendsInRow: false),
      chartValuesOptions: const ChartValuesOptions(showChartValuesInPercentage: true),
    );
  }

  Widget tabContent(int index) {
    switch (index) {
      case 0:
        return Image.asset("ig.PNG");
      case 1:
        return Image.asset("k.PNG");
      case 2:
        return Image.asset("voy.PNG");
      case 3:
        return Image.asset("achie.PNG");
      default:
        return const Text("Invalid Tab");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [
            const CircleAvatar(radius: 35, backgroundImage: AssetImage("assets/profile.jpg")),
            const SizedBox(width: 16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text("Reshma S R (STI)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("reshmasr-1@mulearn"),
                Text("LEVEL 5"),
              ]),
            ),
            Column(children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text(""),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share),
                label: const Text(""),
              )
            ]),
          ]),
          const SizedBox(height: 16),
          // Toggles

          // Tabs
          const SizedBox(height: 12),
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue[800],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue[800],
            tabs: const [
              Tab(text: "Basic History"),
              Tab(text: "Karma Details"),
              Tab(text: "My Voyage"),
              Tab(text: "Achievements"),
            ],
            onTap: (index) => setState(() {}),
          ),
          const SizedBox(height: 12),
          Image.asset("assets/rank.PNG"),

          // Dynamic Section
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: tabContent(_tabController.index),
          ),
          const SizedBox(height: 12),
          Image.asset("profile.PNG"),
          const SizedBox(height: 12),
          Image.asset("git.PNG"),
          const SizedBox(height: 12),
          Image.asset("existing.PNG"),
          const SizedBox(height: 12),
          Image.asset("karma.PNG"),
          const SizedBox(height: 12),
          Image.asset("recent.PNG"),
        ]),
      ),
    );
  }
}
