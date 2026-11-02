
import 'package:flutter/material.dart';

void main() {
  runApp(const TDSocial());
}

const green = Color(0xFF075E54);

class TDSocial extends StatelessWidget {
  const TDSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TD Social',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  final names = ['Söhbətlər', 'Zənglər', 'Status', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: Colors.white,
        title: const Text(
          'TD Social',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: IndexedStack(
        index: selected,
        children: const [
          ChatsPage(),
          CallsPage(),
          StatusPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (index) {
          setState(() => selected = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Söhbətlər',
          ),
          NavigationDestination(
            icon: Icon(Icons.call),
            label: 'Zənglər',
          ),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            label: 'Status',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
      floatingActionButton: selected == 0
          ? FloatingActionButton(
              backgroundColor: green,
              foregroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(Icons.message),
            )
          : null,
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      ['Aysel', 'Salam! Necəsən?', '10:30'],
      ['Murad', 'Sabah görüşərik!', '09:45'],
      ['Dostlar qrupu', 'Yeni şəkil göndərildi', 'Dünən'],
    ];

    return ListView(
      children: [
        Container(
          color: const Color(0xFFE4F3EE),
          padding: const EdgeInsets.all(16),
          child: const Text(
            'TD Social-a xoş gəlmisən! 💚',
            style: TextStyle(color: green),
          ),
        ),
        for (final user in users)
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFD7EEE7),
              child: Icon(Icons.person, color: green),
            ),
            title: Text(
              user[0],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(user[1]),
            trailing: Text(user[2]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(name: user[0]),
                ),
              );
            },
          ),
      ],
    );
  }
}

class ChatPage extends StatelessWidget {
  final String name;

  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: Colors.white,
        title: Text(name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        ],
      ),
      body: const Center(
        child: Text('TD Social mesajlaşma ekranı'),
      ),
    );
  }
}

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.video_call, size: 65, color: green),
        Text('Səsli və görüntülü zənglər'),
        Text('Zəng sistemi növbəti mərhələdə qoşulacaq.'),
      ],
    ),
  );
}

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Text('TD Social Statusları'),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: green,
          child: Icon(Icons.person, color: Colors.white, size: 50),
        ),
        SizedBox(height: 15),
        Text(
          'TD Social istifadəçisi',
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}
