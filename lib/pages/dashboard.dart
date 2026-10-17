import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String imageUrl = 'https://i.pinimg.com/736x/a0/f6/48/a0f6480cf0c5dd9b09c3c0d6ae0e0022.jpg';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCard(size),
            buildCard(size),
            buildCard(size),
            buildCard(size),
          ],
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    final cardHeight = size.height / 5;
    final cardWidth = size.width / 1.1;

    return Container(
      margin: const EdgeInsets.all(10),
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) =>
              const Center(child: Icon(Icons.broken_image)),
            ),
            Container(color: Colors.black38),
            const Positioned(
              bottom: 20,
              left: 20,
              child: Icon(Icons.play_circle, color: Colors.green, size: 30),
            ),
            Positioned(
              bottom: 55,
              left: 20,
              right: 20,
              child: const Text(
                'Do worship, Om Namayan shiva! "RAKSHYA KARUNGI MAE TUM LOGH KO" ',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Positioned(
              bottom: 26,
              left: 60,
              child: Text(
                'October 16, 2026',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}