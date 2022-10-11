import 'package:flutter/material.dart';

class NewsRoom extends StatelessWidget {
  const NewsRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Figure out how to have two stream builders in me."),
      ),
      // StreamBuilder(
      //   builder: (context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     return ListView.builder(
      //       itemCount: snapshot.data!.docs.length,
      //       itemBuilder: (context, index) => Container(
      //           margin: EdgeInsets.symmetric(
      //               horizontal: width > webScreenSize ? width * 0.3 : 0,
      //               vertical: width > webScreenSize ? 15 : 0),
      //           child: PostCard(snap: snapshot.data!.docs[index].data())),
      //     );
      //   },
      //   stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      // ),Text("News Room"),
      // ),
    );
  }
}
