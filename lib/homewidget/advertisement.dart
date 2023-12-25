import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({Key? key}) : super(key: key);

  @override
  _AdvertisementState createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  // late FirebaseStorage storage;
  // late Reference imagesRef;

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize FirebaseStorage instance and create a reference to the "images" folder
  //   storage = FirebaseStorage.instanceFor(bucket: "gs://project-b2728.appspot.com");
  //   imagesRef = storage.ref().child("burgerking_wide.jpg");
  // }

  final FirebaseStorage storage = FirebaseStorage.instance;
  final String imageUrl = 'gs://project-b2728.appspot.com/burgerking_wide.jpg';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 571,
        height: 164,
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Use the imagesRef to get the URL of the image in the "images" folder
            FutureBuilder(
              future: storage.refFromURL(imageUrl).getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network(
                    snapshot.data.toString(),
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
            const SizedBox(
              width: 11,
            ),
            // Similarly, use the imagesRef for the second image
            // FutureBuilder(
            //   future: imagesRef.child('burgerking_wide.jpg').getDownloadURL(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       return Image.network(snapshot.data.toString());
            //     } else {
            //       return CircularProgressIndicator();
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
