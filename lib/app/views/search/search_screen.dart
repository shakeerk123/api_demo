import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/I/71qc0maliOL._AC_UF1000,1000_QL80_.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
                          child: TextField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Colors.white24,
                              hintText: "Search.......",
                              hintStyle: TextStyle(color: Colors.white24),
                              prefixIcon: Icon(Icons.search,color: Colors.white24,),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none),
                            controller: searchTextField,
                            onSubmitted: (input) {},
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
