import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
         Positioned(
          left: 325,
            top: 10,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              radius: 30,
              child: const Icon(Icons.search_rounded,color: Colors.white,size: 28,),
            ))
      ],
    );
  }
}
