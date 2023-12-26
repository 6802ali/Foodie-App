import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({Key? key}) : super(key: key);

  @override
  _AdvertisementState createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final String imageUrl1 = 'gs://project-b2728.appspot.com/burgerking_wide.jpg';
  final String imageUrl2 = 'gs://project-b2728.appspot.com/macdonalds_offers.jpeg';
  final String imageurl3 = 'gs://project-b2728.appspot.com/buffalo_wide.png';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1300, // Take full width of the screen
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Use the imagesRef to get the URL of the image in the "images" folder
            FutureBuilder(
              future: storage.refFromURL(imageUrl1).getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network(
                    snapshot.data.toString(),
                    width: MediaQuery.of(context).size.width, // Set the width to full screen width
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
            FutureBuilder(
              future: storage.refFromURL(imageUrl2).getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network(
                    snapshot.data.toString(),
                    width: MediaQuery.of(context).size.width, // Set the width to full screen width
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
            FutureBuilder(
              future: storage.refFromURL(imageurl3).getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network(
                    snapshot.data.toString(),
                    width: MediaQuery.of(context).size.width, // Set the width to full screen width
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
          ],
        ),
      ),
    );
  }
}
