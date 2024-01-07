import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Meal.dart';

class MealDetails extends StatefulWidget {
  final Meal meal;

  MealDetails({required this.meal});

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Future<String> getImage() async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final String restaurantImage =
        'gs://project-b2728.appspot.com/meals/' + widget.meal.id + '.png';

    String image = await storage.refFromURL(restaurantImage).getDownloadURL();

    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
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
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set the width to full screen width
                    fit: BoxFit.cover, // Adjust the BoxFit as needed
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
                    widget.meal.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.meal.description,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.meal.price.toString()+' '+'\$',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: Text("Add to Cart"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Display the menu or meals based on the button press
          ],
        ),
      ),
    );
  }
}
