import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list
  final List _shopItems=[
    ["Tangerine", "10.00", "images/tangerine.jpg", Colors.deepOrange],
    ["Blueberry", "5.00", "images/blueberry1.jpg", Colors.indigo],
    ["Peach", "4.00", "images/peach1.jpg", Colors.lime],
    ["Strawberry", "3.00", "images/strawberry.jpg", Colors.red],
  ];


//list of cart items
List _cartItems = [];
get shopItems => _shopItems;
get cartItems => _cartItems;

//add item to cart
void addItemToCart(int index){
  _cartItems.add(_shopItems[index]);
  notifyListeners();
}
//remove
void removeItemFromCart(int index){
  _cartItems.removeAt(index);
  notifyListeners();
}
//calculate price
String calculateTotal(){
  double totalPrice = 0;
  for (int i = 0; i < _cartItems.length; i++){
    totalPrice += double.parse(_cartItems[i][1]);

  }
  return totalPrice.toStringAsFixed(2);
}

}


