import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class Category {

  final String nom;
  final String file;
  final String nbCourses;

  Category(this.nom,this.file, this.nbCourses);

}

List<Category> categories = categoriesList.map((e) => Category(e['nom'], e['file'], e["nbCourses"])).toList();

const categoriesList = [
  {"nom": "Business", "nbCourses": "17 cours" , "file": "assets/images/business.png"},
  {"nom": "Photography", "nbCourses": "22 cours", "file": "assets/images/photography.png"},
  {"nom": "Marketing", "nbCourses": "10 cours",  "file": "assets/images/marketing.png"},
  {"nom": "Ux Design", "nbCourses": "5 cours", "file": "assets/images/ux_design.png"},
  {"nom": "Music", "nbCourses": "30 cours", "file": "assets/images/music.png"}
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyOnlineCourse(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyOnlineCourse extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.menu, size: 25),
                    Icon(Icons.account_circle_rounded, size: 25,)
                  ],
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Hey Faudel,", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Trouve un cours que tu veux apprendre",
                      style: TextStyle(color: Colors.grey, fontSize: 19)),
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 54,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: "Rechercher",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                  )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Catégories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Text("Tout voir", style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.bold, fontSize: 17))
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemCount: categories.length,
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.fit(1),
                    itemBuilder: (BuildContext context, int index) => new Container(
                      child: Container(
                        height: index.isEven ? 200 : 240,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFFF5F5F7),
                          image: DecorationImage(
                            image: AssetImage(categories[index].file),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 40, top: 20 ),
                          child: Column(
                            children: <Widget>[
                              Text(categories[index].nom,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                              ),
                              Text(categories[index].nbCourses,
                                  style: TextStyle(color: Colors.grey, fontSize: 13)
                              )
                            ]
                        )
                      )
                      )
                    )
                  )
                )]
        )
      )
    );
  }
}
