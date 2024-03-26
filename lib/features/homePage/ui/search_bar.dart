import 'package:flutter/material.dart';

class Search extends StatefulWidget {

  final void Function(String)onSearch;

   const Search({super.key, required this.onSearch,});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final TextEditingController _searchController = TextEditingController();


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
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
              child: IconButton(onPressed: () {
                widget.onSearch(_searchController.text);
                print("Searching : ${_searchController.text}");
              }, icon:
              const Icon(Icons.search_rounded, color: Colors.white, size: 28,)),
            ))
      ],
    );
  }


}
