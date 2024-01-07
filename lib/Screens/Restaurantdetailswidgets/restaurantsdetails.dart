import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Firestore/Models/Restaurant.dart';
import 'package:foodie/Firestore/Services/MealService.dart';
import 'package:foodie/Models/MenuModel.dart';
import 'package:foodie/Models/RestaurantModel.dart';
import 'package:foodie/Screens/mealdetailswidgets/mealDetails.dart';
import 'package:foodie/firebase/Restaurant.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetailsPage({required this.restaurant});

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  List<Meal> meals = [];
  bool showMenu = false;

  @override
  void initState() {
    super.initState();
    getMeals();
  }

  getMeals() async {
    meals = await MealService.getAllByIds(widget.restaurant.meals_id);

    print(
        '---------------------------------------------------------------------------------------------------------------');
    print('meals');
    print(meals);
    print(meals.length);
    print(
        '---------------------------------------------------------------------------------------------------------------');
  }

  Future<String> getImage() async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final String restaurantImage =
        'gs://project-b2728.appspot.com/restaurants/' +
            widget.restaurant.id +
            '.png';

    String image = await storage.refFromURL(restaurantImage).getDownloadURL();

    return image;
  }

  /* Future<void> getData() async {
    try {
      List<MenuModel> fetchedMenu = await FireRestaurant.getRestaurantMenu(widget.restaurant.id);
      setState(() {
        menu = fetchedMenu;
        showMenu = true; // Set showMenu to true after fetching data
      });
    } catch (e) {
      print('Error fetching menu: $e');
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network(
                    snapshot.data.toString(),
                    width: MediaQuery.of(context).size.width,
                    height: 150, // Set the desired height
                    fit: BoxFit.cover,
                  );
                } else if (snapshot.hasError) {
                  // Handle error
                  return Text('Error loading image');
                } else {
                  // Return a loading indicator or placeholder
                  return CircularProgressIndicator();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurant.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.restaurant.location,
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showMenu = true;
                          });
                        },
                        child: Text("Menu"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic for "Reservations" button
                        },
                        child: Text("Reservations"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic for "Reviews" button
                        },
                        child: Text("Reviews"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Display the menu or meals based on the button press
            if (showMenu && meals.isNotEmpty) buildMenu(),
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          // Display the meals as cards
          buildMealList(meals),
        ],
      ),
    );
  }

  Widget buildMealList(List<Meal> meals) {
    return Container(
        height: 480, // Set a proper height for the container
        child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MealDetails(meal: meals[index])));
                      },
                      title: Text(meals[index].name ?? ''),
                      subtitle: Text(meals[index].description ?? ''),
                      trailing: Text('\$${meals[index].price ?? ''}'),
                    ),
                  )
                ],
              );
            }));
  }
}



//   Widget buildMealList(List<MenuModel> menuList) {
//     return ListView.builder(
//       itemCount: menuList.length, //cheeseburger, rebeye, chickenfile, .length 3
//       itemBuilder: (context, index) {
//         MenuModel menu = menuList[index]; //data of cheese

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 8),
//             ListView.builder(
//               itemCount: menu.meals.length,
//               itemBuilder: (context, mealIndex) {
//                 MealModel meal = menu.meals[mealIndex];
//                 return ListTile(
//                   contentPadding: EdgeInsets.all(8.0),
//                   title: Text(
//                     meal.mealName,
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     meal.mealDescription,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//               },
//             ),
//             Divider(), // Add a divider between menu categories
//           ],
//         );
//       },
//     );
//   }
// }

// Widget BuildMealCard(List<MenuModel> menuList) {
//   return ListView.builder(
//       itemCount: menuList.length,
//       itemBuilder: (context, index) {
//         MenuModel menu = menuList[index];
//         Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           SizedBox(height: 8),
//           ListView.builder(
//               itemCount: menu.meals.length,
//               itemBuilder: (context, mealIndex) {
//                 MealModel meal = menu.meals[mealIndex];
//                 return Card();
//               })
//         ]);

        // return Card(
        //     child:ListView.builder(  menu.meals.length,itemBuilder: (context, mealIndex)){
        //       MealModel meal = menu.meals[mealIndex];
        //     : Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10, top: 10),
        //           child: Text(
        //             meal.
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10, top: 2),
        //           child: Text(
        //             restaurant.field,
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10, top: 10),
        //           child: Text(
        //             restaurant.restaurantName,
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // );
        //     }
        // );
//       });
// }


// class RestaurantDetailsPage extends StatelessWidget {
//   final RestaurantModel restaurant;

//   RestaurantDetailsPage({required this.restaurant});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(restaurant.restaurantName),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               Uri.encodeFull(restaurant.restaurant_img_link.trim()),
//               width: double.infinity,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     restaurant.restaurantName,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     restaurant.field,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                       Text(restaurant.rating.toString()),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Menu"),                
//                 Text("Reservations"),
//                 Text("Reviews")
//               ],
//             )
//             // Add the links for Menu, Reservation, and Reviews here
//           ],
//         ),
//        )
//       );
//   }
//   }

//       //-------------------------------------------------------------------------------------------------------------------------------------------------------------------->
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.restaurant_menu),
//       //       label: 'Menu',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.calendar_today),
//       //       label: 'Reservation',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.rate_review),
//       //       label: 'Reviews',
//       //     ),
//       //   ],
//       //   onTap: (index) {
//       //     // Handle navigation to different sections
//       //     // You can use a PageView or other methods to switch between sections
//       //   },
//       // ),
//     );
//    }
//  }