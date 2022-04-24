import 'package:f_e_book/common/util/app_colors.dart' as AppColors;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List popularBooks = [
    {"rating": "4.5", "title": "the water cure", "text": "margin hyatt", "img": "", "audio": ""},
    {"rating": "4.0", "title": "aaa", "text": "a text", "img": "", "audio": ""},
    {"rating": "4.6", "title": "peace life", "text": "hazard bin", "img": "", "audio": ""}
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopIcon(),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 5, bottom: 20),
                child: Text(
                  "Popular Books",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  itemCount: popularBooks == null ? 0 : popularBooks.length,
                  controller: PageController(viewportFraction: 0.9),
                  itemBuilder: (_, int index) {
                    return Container(
                      height: 180,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), color: AppColors.loveColor),
                      child: Center(child: Text("${popularBooks[index]["title"]}")),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopIcon() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.zoom_out_map),
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 8),
              Icon(Icons.lock_clock),
            ],
          )
        ],
      ),
    );
  }
}
