import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87, // Warna latar belakang gelap
        appBar: AppBar(
          backgroundColor: Colors.black87, // Warna AppBar sesuai tema
          leading: const Icon(Icons.menu), // Icon menu di sebelah kiri
          title: const Text('Recipes'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            // Gambar makanan dengan panah navigasi
            Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://tse2.mm.bing.net/th?id=OIP.dkhLCnAvncNJ2POnoLjLtAHaFE&pid=Api&P=0&h=220',
                    width: 200,
                  ),
                  // Panah kiri dan kanan
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Bagian judul makanan dan rating
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  Text(
                    'Salad',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                ],
              ),
            ),

            // Bagian Review
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildReviewItem(
                      'User1', 'Vocent option mentitum pri et.', 5),
                  _buildReviewItem('User2', 'Option mentitum pri et.', 4),
                  _buildReviewItem(
                      'User3', 'Vocent option mentitum pri et.', 3),
                ],
              ),
            ),

            // Tombol Recipe di bagian bawah
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Recipe',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat item review
  Widget _buildReviewItem(String username, String review, int rating) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  review,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.yellow,
                size: 20,
              );
            }),
          ),
        ],
      ),
    );
  }
}
