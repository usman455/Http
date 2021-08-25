import 'package:flutter/material.dart';
import 'package:flutter_http/users.dart';
import 'package:http/http.dart' as http;
class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}
class _PostPageState extends State<PostPage> {
  List<Post> value=[];
  Future<String> getPost() async {
    final String postUrl = 'http://192.168.100.10:8888/api/org/fetch-list';
    http.Response res = await http.get(Uri.parse(postUrl));
    print(res.body);
    if (res.statusCode == 200) {
      //return res.body;
    }
    else{
      throw 'can\'t get posts';
    }
  }
  Future<List<Post>> futureAlbum;
  void initState() {
    super.initState();
    //futureAlbum=getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //List<Post> posts=snapshot.data;
              print(snapshot.data);
              return ListTile();
            }
            else {
              return CircularProgressIndicator();
            }
          }
    )
    ,);
  }
}
