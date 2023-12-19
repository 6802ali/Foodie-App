import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/RestaurantModel.dart';
import 'package:flutter_application_1/firebase/Restaurant.dart';

class Allrestuarant extends StatefulWidget {
  const Allrestuarant({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllrestuarantState createState() => _AllrestuarantState();
}

class _AllrestuarantState extends State<Allrestuarant> {
  List<RestaurantModel> restaurants = [];

  Future getData() async {
    restaurants = await FireRestaurant.getAllRestaurants();
    // print("rest: " + restaurants[0].toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("error: " + snapshot.error.toString());
            return Center(
              child: Text("Something went wrong" + snapshot.error.toString()),
            );
          } else {
            return buildBody();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget buildBody() {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0), // Adjust the top padding as needed
            child: Text(
              "All Restaurants",
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Text(restaurants[0].restaurantName,style: TextStyle(fontSize: 15),)
          Card(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
    children: [
      Column(
        children: [
          Image.network(
            "https://th.bing.com/th/id/OIP.623G6MWK7IC_ENU5_QsOVgHaG1?rs=1&pid=ImgDetMain",
            width: 90,
            height: 90,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: Text(
              restaurants[0].restaurantName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 2),
            child: Text(
              restaurants[0].field,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5,top: 2),
                child: Icon(
                  Icons.star,color: Colors.yellow,
                ),
              ),
              Text(restaurants[0].rating.toString())
            ],
          )
        ],
      ),
    ],
  ),
),
// Card(
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
//     children: [
//       Column(
//         children: [
//           Image.network(
//             "https://d6ozfheqtj1tz.cloudfront.net/ChIJR01E5O-rw4kR5wgy7lT-52c/g1QCIFYddM.png",
//             width: 90,
//             height: 70,
//           ),
//         ],
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10,top: 10),
//             child: Text(
//               restaurants[1].restaurantName,
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10,top: 2),
//             child: Text(
//               restaurants[1].field,
//               style: TextStyle(fontSize: 15),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 5,top: 2),
//                 child: Icon(
//                   Icons.star,color: Colors.yellow,
//                 ),
//               ),
//               Text(restaurants[1].rating.toString())
//             ],
//           )
//         ],
//       ),
//     ],
//   ),
// )
        ],
      ),
    );
  }
}

