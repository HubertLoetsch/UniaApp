import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Test extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Test> {
  List<String> imageList = [
    'https://picsum.photos/209/607/?random',
    'https://picsum.photos/209/300/?random',
    'https://picsum.photos/412/400/?random',
    'https://picsum.photos/524/982/?random',
    'https://picsum.photos/209/500/?random',
    'https://picsum.photos/209/300/?random',
    'https://picsum.photos/209/100/?random',
    'https://picsum.photos/502/300/?random',
    'https://picsum.photos/180/355/?random',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(12),
          child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              }),
        ),
      ),
    );
  }
}
