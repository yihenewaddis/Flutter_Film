import 'package:flutter/material.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});
  
  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  
  @override
  Widget build(BuildContext context) {
    print('top rated movie movie');
    return const Scaffold(
      body: Center(
        child: Text('TopRated'),
      ),
    );
  }
}