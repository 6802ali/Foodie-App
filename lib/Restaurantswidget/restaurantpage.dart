import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Restaurantpage extends StatefulWidget {
  const Restaurantpage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Restaurantpage();
  }
}

class _Restaurantpage extends State<Restaurantpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Restaurant'),
        //   centerTitle: true,
        // ),
        body: Column(
      children: [
        Image.network(
          "https://2.bp.blogspot.com/-NPsKYcJ4-6M/WpKLY93w5oI/AAAAAAAALsg/oM_UoN9TybInfutJcOqVX9RqKzgpx8dLwCLcBGAs/s1600/IMG_20180221_175909_728.jpg",
          fit: BoxFit.cover,
          height: 250,
          width: 500,
        ),
        Container(
          child:  Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Smash Burger',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Serve american smashed burgers with style',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
        
      ],
    )
        // CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       expandedHeight: 200,
        //       flexibleSpace: FlexibleSpaceBar(
        //         background: Image.network(
        //           "https://2.bp.blogspot.com/-NPsKYcJ4-6M/WpKLY93w5oI/AAAAAAAALsg/oM_UoN9TybInfutJcOqVX9RqKzgpx8dLwCLcBGAs/s1600/IMG_20180221_175909_728.jpg",
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       leading: const Padding(
        //         padding: EdgeInsets.only(left: 16),
        //         child: CircleAvatar(
        //           backgroundColor: Colors.white,
        //           child: Icon(
        //             Icons.arrow_back,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
