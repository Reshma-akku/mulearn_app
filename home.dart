import 'package:flutter/material.dart';
import 'package:mulearn/leader.dart';
import 'package:mulearn/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 60),
            Center(
              child: Text(
                'µLearn',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),
            buildDrawerItem(context, Icons.home, 'Home', selected: true),
            buildDrawerItem(context, Icons.person, 'Profile', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            }),
            buildDrawerItem(context, Icons.map, 'µJourney'),
            buildDrawerItem(context, Icons.groups, 'Interest Groups'),
            buildDrawerItem(context, Icons.menu_book, 'Learning Circle'),
            buildDrawerItem(context, Icons.search, 'Search'),
            buildDrawerItem(context, Icons.leaderboard, 'Leaderboard', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LeaderboardPage()));
            }),
            buildDrawerItem(context, Icons.rocket_launch, 'Launchpad'),
            const Divider(height: 32),
            buildDrawerItem(context, Icons.settings, 'Account Setting', iconColor: Colors.grey),
            buildDrawerItem(context, Icons.logout, 'Logout', iconColor: Colors.red, textColor: Colors.red),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "All Rights Reserved © µLearn Foundation 2025",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'CODER',
            style: TextStyle(color: Colors.white,fontSize: 14),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            welcomeCard(),
            const SizedBox(height: 20),
            sectionTitle("Learning Circles"),
            learningCard(),
            const SizedBox(height: 20),
            sectionTitle("Karma Earners"),
            karmaCard("Highest Karma Earner (Student)", "Shreyas Jayakrishnan", "shreyasjayakrishnan-1@mulearn", "17160", Colors.blue.shade50),
            karmaCard("Highest Karma Earner (College/Organisation)", "Mar Baselios College of Engineering and Technology", "", "333290", Colors.green.shade50),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionTitle("Interest groups in coder"),
                Text("Show more >", style: TextStyle(color: Colors.blue)),
              ],
            ),
            interestGroupTile("CLOUD AND DEVOPS", "assets/devops.jpg"),
            interestGroupTile("GAME DEV", "assets/game.jpg"),
            interestGroupTile("CYBER SECURITY", "assets/cyber.jpg"),
            interestGroupTile("WEB DEVELOPMENT", "assets/web.jpg"),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, IconData icon, String text,
      {bool selected = false, Color? iconColor, Color? textColor, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? (selected ? Colors.blueAccent : Colors.black)),
      title: Text(text, style: TextStyle(color: textColor ?? (selected ? Colors.blueAccent : Colors.black))),
      tileColor: selected ? Colors.deepPurple.shade50 : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: onTap ?? () {},
    );
  }

  Widget welcomeCard() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Text("Welcome Reshma 👋", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            const Text(
              "This dashboard is being updated. Expect improvements and possible bugs. Thanks for your patience!",
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text("Start Learning"),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("Join Learning"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget learningCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("AI in Cloud Computing", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 6),
            const Text("Using of AI in cloud computing"),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Cloud And Devops"),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.yellow),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.wifi_off, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text("Offline", style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {},
                child: const Text("View Details", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget karmaCard(String title, String name, String email, String karma, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(name),
          if (email.isNotEmpty) Text(email),
          Text("Karma: $karma", style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget interestGroupTile(String title, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(imagePath)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
