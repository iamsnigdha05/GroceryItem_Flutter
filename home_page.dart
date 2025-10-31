import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryshop/components/grocery_item_tile.dart';
import 'package:groceryshop/model/cart_model.dart';
import 'package:groceryshop/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
              MaterialPageRoute(
                  builder: (context){
                    return CartPage();
                  },
              ),
          ),
        backgroundColor: Colors.black,
      child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
          
          const Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text("Eat Fresh, Be Safe"),
          ),

            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
                "Let's order some fresh items for you",
            style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),

            const SizedBox(height: 24),
            
            //divider
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            
            const SizedBox(height: 24),
            
            //fresh items grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Choose Your Favourite Fruit",
              style: TextStyle(fontSize: 16),
                ),
            ),

            Expanded(
                child: Consumer<CartModel>(
                     builder: (context, value, child){
                       return GridView.builder(
                       itemCount: value.shopItems.length,
                       padding: EdgeInsets.all(12), gridDelegate:
                       const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       childAspectRatio: 1 / 1.3,),
                       itemBuilder: (context, index){
                       return GroceryItemTile(
                       itemName: value.shopItems[index][0],
                       itemPrice: value.shopItems[index][1],
                       imagePath: value.shopItems[index][2],
                       color: value.shopItems[index][3],
                         onPressed: (){
                         Provider.of<CartModel>(context, listen: false)
                             .addItemToCart(index);
                         },
                      );
                  },
                );
            },
          ),
        )
      ],
    ),
    ),
    );
  }
}