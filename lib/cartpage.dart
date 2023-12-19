import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Item 1',
      'details': 'Details for Item 1',
      'price': 19.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 2',
      'details': 'Details for Item 2',
      'price': 231,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 3',
      'details': 'Details for Item 3',
      'price': 123.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 4',
      'details': 'Details for Item 4',
      'price': 164.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 4',
      'details': 'Details for Item 4',
      'price': 164.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 4',
      'details': 'Details for Item 4',
      'price': 164.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 4',
      'details': 'Details for Item 4',
      'price': 164.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 4',
      'details': 'Details for Item 4',
      'price': 164.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },
    {
      'name': 'Item 4',
      'details': 'Details for Item 4',
      'price': 164.99,
      'image': 'https://placekitten.com/100/100', // Replace with your image URL
    },

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    double totalCost = cartItems.fold(0, (sum, item) => sum + item['price']);
    String deletedItemName = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      color: Colors.white, // Set the card color
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(cartItems[index]['image']),
                          radius: 30.0,
                        ),
                        title: Text(cartItems[index]['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItems[index]['details']),
                            Text('\$${cartItems[index]['price']}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              deletedItemName = cartItems[index]['name'];
                              cartItems.removeAt(index);
                              showUndoSnackbar(deletedItemName, index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add a rounded circle containing the total cost
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                color: Colors.redAccent,
              ),
              child: Text(
                '\$$totalCost',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Move the "Confirm" button to the right
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Do you want to confirm your order?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirm'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                padding: EdgeInsets.all(18.0),
              ),
              child: Text(
                'Confirm',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show a snackbar for undoing deletion
  void showUndoSnackbar(String itemName, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item "$itemName" deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Undo the deletion by adding the item back to the list
            setState(() {
              cartItems.insert(index, {
                'name': itemName,
                'details': 'Details for $itemName',
                'price':
                    19.99, // Set a default price or retrieve it from somewhere
                'image': 'https://placekitten.com/100/100',
              });
            });
          },
        ),
      ),
    );
  }
}
