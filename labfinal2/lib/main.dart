import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xender UI ',
      theme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Phone Storage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> fileCategories = [
    {"title": "Documents", "subtitle": "Includes Word, PPT, Excel, WPS, etc."},
    {"title": "Ebooks", "subtitle": "Includes .umd, .ebk, .txt, .chm, etc."},
    {"title": "Apks", "subtitle": "Includes .apk files"},
    {"title": "Archives", "subtitle": "Includes .7z, .rar, .zip, .iso, etc."},
    {"title": "Big files", "subtitle": "Includes files > 50 MB"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Builder(
              builder:
                  (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.greenAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.greenAccent,
            tabs: [
              Tab(text: 'DOWNLOAD'),
              Tab(text: 'APP'),
              Tab(text: 'PHOTO'),
              Tab(text: 'MUSIC'),
              Tab(text: 'VIDEO'),
              Tab(text: 'FILE'),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Text("Xender", style: TextStyle(fontSize: 24)),
              ),
              const ListTile(
                leading: Icon(Icons.language, color: Colors.blue),
                title: Text("Language"),
              ),
              const ListTile(
                leading: Icon(Icons.wifi, color: Colors.blue),
                title: Text("High-speed Mode supported"),
                trailing: Icon(Icons.check_circle, color: Colors.green),
              ),
              const ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text("Settings"),
              ),
              SwitchListTile(
                secondary: const Icon(
                  Icons.nightlight_round,
                  color: Colors.blue,
                ),
                title: const Text("Night mode"),
                value: true,
                onChanged: (_) {},
              ),
              const ListTile(
                leading: Icon(
                  Icons.phone_android,
                  color: Color.fromARGB(255, 243, 149, 33),
                ),
                title: Text("Mi Phone Settings"),
              ),
              const ListTile(
                leading: Icon(Icons.help, color: Colors.blue),
                title: Text("Help & Feedback"),
              ),
              const ListTile(
                leading: Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 243, 33, 33),
                ),
                title: Text("Ratings"),
              ),
              const ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text("About"),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Total: 244GB  Available: 135GB',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Download Content')),
                  Center(child: Text('App Files')),
                  Center(child: Text('Photos')),
                  Center(child: Text('Music')),
                  Center(child: Text('Videos')),
                  ListView.builder(
                    itemCount: fileCategories.length,
                    itemBuilder: (context, index) {
                      final item = fileCategories[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.folder),
                          title: Text(item["title"]!),
                          subtitle: Text(item["subtitle"]!),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: const Color.fromARGB(255, 232, 234, 233),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play),
              label: "PLAYLIST",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: "TOMP3",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: "SOCIAL",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "ME"),
          ],
        ),
      ),
    );
  }
}
