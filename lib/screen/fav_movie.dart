import 'package:flutter/material.dart';
import 'package:movie_provider/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _mylist= context.watch<MovieProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${_mylist.length})"),
      ),
      body: ListView.builder(
          itemCount: _mylist.length,
          itemBuilder: (_,index){
            final currentMovie=_mylist[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.duration ?? ""),
                trailing: TextButton(
                    onPressed: (){
                      context
                      .read<MovieProvider>().deleteFromList(currentMovie);
                    },
                    child: Text("Remove",
                    style: TextStyle(color: Colors.red),)),

              ),

            );
          }),
    );
  }
}
