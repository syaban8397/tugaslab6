import 'package:flutter/material.dart';
import 'package:tugaspertemuan6/model.dart';
import 'package:tugaspertemuan6/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Katalog Wisata",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.pink.shade200,
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "Katalog Wisata",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.list), text: "List View"),
              Tab(icon: Icon(Icons.grid_on), text: "Grid View"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(context),
            buildGridView(context),
          ],
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    Wisata wisata = Wisata();

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: wisata.data.length,
      itemBuilder: (context, index) {
        final item = wisata.data[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade200.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                item['image']!,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              item['short'] ?? "Tempat wisata populer di Indonesia.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailPage(data: item)),
            ),
          ),
        );
      },
    );
  }

  Widget buildGridView(BuildContext context) {
    Wisata wisata = Wisata();

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: wisata.data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final item = wisata.data[index];

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailPage(data: item)),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.shade200.withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.network(
                    item['image']!,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    item['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    item['short'] ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
