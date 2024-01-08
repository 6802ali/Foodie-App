import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Firestore/Models/Reservation.dart';
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
  DateTime dateTime = DateTime(2024, 02, 25, 12, 30);

  List<Meal> meals = [];
  List<Reservation> reservation = [];
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
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          if (newDate == null) return;

                          TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                  hour: dateTime.hour,
                                  minute: dateTime.minute));

                          if (newTime == null) return;

                          final newDateTime = DateTime(
                            newDate.year,
                            newDate.month,
                            newDate.day,
                            newTime.hour,
                            newTime.minute,
                          );

                          setState(() {
                            dateTime = newDateTime;
                          });
                          print('datetimetest----------------------------');
                          print(dateTime);
                          print(DateTime.now());
                          print(dateTime.hour);
                          if (dateTime.hour < dateTime.minute) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'Reservation already booked',
                              btnOkOnPress: () {},
                            ).show();
                          }else{
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'success',
                              desc: 'reservation completed',
                              btnOkOnPress: () {},
                            ).show();
                          }
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
