import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_provider/providers/movie_provider.dart';

import 'fav_movie.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var mylist = context.watch<MovieProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.square(1.0),
            child: SizedBox(
              height: 1.0,
            )),
        backgroundColor: Colors.blue,
        elevation: 4,
        title: Text(
          "Movie_List_using_Provider",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyListScreen()));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text(
                "Go to my list (${mylist.length})",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Border radius
                ),
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),

              /*  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStatePropertyAll(EdgeInsets.all(20.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  )
                )
              ),
*/
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (_, index) {
                      final currentMovie = movies[index];
                      return Card(
                        key: ValueKey(currentMovie.title),
                        color: Colors.blue,
                        elevation: 4,
                        child: ListTile(
                          title: Text(currentMovie.title,
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                            currentMovie.duration ?? "No Information",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                if (!mylist.contains(currentMovie)) {
                                  context
                                      .read<MovieProvider>()
                                      .addToList(currentMovie);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .deleteFromList(currentMovie);
                                  //Provider.of<MovieProvider>(context, listen: false).deleteFromList(currentMovie);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: mylist.contains(currentMovie)
                                    ? Colors.red
                                    : Colors.white,
                                size: 30.0,
                              )),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
