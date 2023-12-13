import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';

class HistoryShoppingScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HistoryShoppingScreen({Key? key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Historial de Compras",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.separated(
            itemCount: _feedItems.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final item = _feedItems[index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: " Producto:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ]),
                              )),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            " Talla:",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            " Color:",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          if (item.imageUrl != null)
                            Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(item.imageUrl!),
                                  )),
                            ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                
                              },
                              icon: const Icon(
                                Icons.upload, 
                                size: 30,
                                color:AppColor.white 
                              ),
                              label: const Text(
                                "Subir archivo de pago",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FeedItem {
  final String? content;
  final String? imageUrl;
  final User user;
  final int commentsCount;
  final int likesCount;
  final int retweetsCount;

  FeedItem(
      {this.content,
      this.imageUrl,
      required this.user,
      this.commentsCount = 0,
      this.likesCount = 0,
      this.retweetsCount = 0});
}

class User {
  final String fullName;
  final String imageUrl;
  final String userName;

  User(
    this.fullName,
    this.userName,
    this.imageUrl,
  );
}

final List<User> _users = [
  User(
    "John Doe",
    "john_doe",
    "https://picsum.photos/id/1062/80/80",
  ),
];

final List<FeedItem> _feedItems = [
  FeedItem(
    content:
        "A son asked his father (a programmer) why the sun rises in the east, and sets in the west. His response? It works, don’t touch!",
    user: _users[0],
    imageUrl: "https://picsum.photos/id/1000/960/540",
    likesCount: 100,
    commentsCount: 10,
    retweetsCount: 1,
  ),
];
