import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xffB1001C);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.color_lens,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: 200,
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(child: Text('الهدف')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.white,
                  ),
                ),
                const Text('33'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle,color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('0',style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('33',style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('100',style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('+100',style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('+1000',style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  width: 8,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
