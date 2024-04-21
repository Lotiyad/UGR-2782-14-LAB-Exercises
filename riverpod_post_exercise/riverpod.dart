import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  final List<dynamic> responseData = json.decode(response.body);
  return responseData.map((data) => Post.fromJson(data)).toList();
});

class PostsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final postsAsyncValue = watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => context.refresh(postsProvider),
          ),
        ],
      ),
      body: postsAsyncValue.when(
        data: (posts) {
          return RefreshIndicator(
            onRefresh: () => context.refresh(postsProvider),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PostsScreen(),
  ));
}
