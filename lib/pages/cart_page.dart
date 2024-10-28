import 'package:eazi_shoppin/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<CartProvider>(context).cart;
    // OR U CAN ALSO USE 
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: Theme.of(context).textTheme.bodyLarge,),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          final itemCart = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(itemCart["imageUrl"].toString()),
            ),
            title: Text(itemCart["title"].toString()),
            subtitle: Text("Size: ${itemCart["sizes"]}"),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  barrierDismissible: false,
                  context: context,
                   builder: (context){
                    return AlertDialog(
                      
                      title: Text("Delete product", style: Theme.of(context).textTheme.titleMedium,),
                      content: const Text("Are you sure you want to remove the product from cart"),
                      actions: [
                        TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child:const  Text("NO",
                         style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                         )),
                         TextButton(
                        onPressed: (){
                          // Provider.of<CartProvider>(context, listen: false).removeProduct(itemCart);
                          // or
                          context.read<CartProvider>().removeProduct(itemCart);
                           Navigator.pop(context);
                        }, 
                        child:const  Text("YES",
                         style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                         ))
                      ],
                    );
                   });
              },
               icon: const Icon(Icons.delete, color: Colors.red,)),
          );
        })
    );
  }
}