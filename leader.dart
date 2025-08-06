import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String selectedCategory = 'Student';
  String selectedTab = 'Monthly';

  List<Map<String, dynamic>> getData() {
    if (selectedCategory == 'College') {
      if (selectedTab == 'Monthly') {
        return [
          {"rank": 1, "name": "SJC", "karma": 12500},
          {"rank": 2, "name": "AWH", "karma": 12000},
          {"rank": 3, "name": "SCTCE", "karma": 11900},
          ...List.generate(17, (i) => {
                "rank": i + 4,
                "name": "College ${i + 4}",
                "karma": 11000 - i * 100,
              }),
        ];
      } else {
        return [
          {"rank": 1, "name": "SJC", "karma": 52200},
          {"rank": 2, "name": "AWH", "karma": 48900},
          {"rank": 3, "name": "SCTCE", "karma": 47000},
          ...List.generate(17, (i) => {
                "rank": i + 4,
                "name": "College ${i + 4}",
                "karma": 46000 - i * 300,
              }),
        ];
      }
    } else {
      if (selectedTab == 'Monthly') {
        return [
          {"rank": 1, "name": "Niranj R", "karma": 4302},
          {"rank": 2, "name": "Fathima Mahruban", "karma": 2800},
          {"rank": 3, "name": "Keziah Mariam", "karma": 2500},
          ...List.generate(17, (i) => {
                "rank": i + 4,
                "name": "User ${i + 4}",
                "karma": 2400 - i * 50,
              }),
        ];
      } else {
        return [
          {"rank": 1, "name": "Anjali M", "karma": 9200},
          {"rank": 2, "name": "Harshavardhan", "karma": 8800},
          {"rank": 3, "name": "Sneha T", "karma": 8500},
          ...List.generate(17, (i) => {
                "rank": i + 4,
                "name": "User ${i + 4}",
                "karma": 8400 - i * 100,
              }),
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = getData();
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF147CE0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("CODER", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Toggle Tabs
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => setState(() => selectedTab = 'Monthly'),
                    child: Text(
                      "Monthly",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedTab == 'Monthly' ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => setState(() => selectedTab = 'Overall'),
                    child: Text(
                      "Overall",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedTab == 'Overall' ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                items: ['Student', 'College'].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 16),

            // Top 3 Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                (index) {
                  final user = data[index];
                  return TopUserCard(
                    name: user['name'],
                    points: "${user['karma']} Karma pts",
                    badge: index == 0
                        ? "Diamond"
                        : index == 1
                            ? "Gold"
                            : "Silver",
                    imageUrl: "https://i.pravatar.cc/100?img=${index + 1}",
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Leaderboard List
            Column(
              children: data.sublist(3).map((user) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text("${user["rank"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: NetworkImage("https://i.pravatar.cc/100?img=${user["rank"]}"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(user["name"])),
                      Text("${user["karma"]}"),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_drop_up, color: Colors.green)
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class TopUserCard extends StatelessWidget {
  final String name;
  final String points;
  final String badge;
  final String imageUrl;

  const TopUserCard({
    required this.name,
    required this.points,
    required this.badge,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 6),
        Text(name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        Text(points, style: const TextStyle(fontSize: 11)),
        Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(badge, style: const TextStyle(fontSize: 10)),
        )
      ],
    );
  }
}
