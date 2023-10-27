import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinemaven',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
      ),
      home:const  MainPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    return Scaffold(
      body: Center(
        child: FutureBuilder(future:controller.popularmovies , builder:(context,snapshot){
          if(snapshot.hasData){
            MovieDataModel? data = snapshot.data as MovieDataModel?;
           List<Result> results = data?.results ?? [];

             return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                String title = results[index].overview;

                return ListTile(
                  title: Text(title),
                );
              },
            );
          }else{
            return const Text("No data get");
          }
        }),
      ),
    );
  }
}
