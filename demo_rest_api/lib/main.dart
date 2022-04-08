import 'package:demo_rest_api/services/new_services_api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/NewsReponse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Find intresting article and news",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Articles>?>(
                  future: NewsApiServices().fetchNewsArticle(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      List<Articles>? newsArticle = snapshot.data;
                      return ListView.builder(
                        itemCount: newsArticle?.length,
                        itemBuilder: (context, index) {
                          return NewsTile(article: newsArticle![index]);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final Articles article;

  const NewsTile({Key? key, required this.article}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: ListTile(
        onTap: () async {
          await canLaunch(article.url.toString())
              ? await launch(article.url.toString())
              : throw 'Could not launch ${article.url}';
        },
        title: Text(
          article.title.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description.toString(),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        leading: article.urlToImage != null
            ? Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(article.urlToImage.toString()),
            ),
          ),
        )
            : null,
      ),
    );
  }
}