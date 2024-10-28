
import 'package:eazi_shoppin/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDetail extends StatefulWidget {
  final Map<String, Object> product;
  const ProductsDetail({super.key, required this.product});

  @override
  State<ProductsDetail> createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  int clickSize = 0;

  void onTap (){
    if (clickSize != 0) {
        Provider.of<CartProvider>(context, listen: false).addProduct({
          "id": widget.product["id"],
          "title": widget.product["title"],
          "prices": widget.product["prices"],
          "imageUrl": widget.product["imageUrl"],
          "company": widget.product["company"],
          "sizes": clickSize,
         });
         ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product added to cart"))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a shoe sise"))
      );
    }
       
                
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.product["title"] as String, style: Theme.of(context).textTheme.titleLarge,),
          // spacer gives flexible spacing 
          const Spacer(),
          Image.asset(widget.product["imageUrl"] as String),
          const Spacer(flex: 2,),
          Container(
            padding: const EdgeInsets.all(8),
            height: 190,
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
              ),
              color:  Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              children: [
                Text("\$${widget.product["prices"]}", style: Theme.of(context).textTheme.titleLarge,),
              const   SizedBox(height: 10,),
             
                Expanded(
                  child: ListView.builder(
                    
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product["sizes"] as List<int>).length,
                    itemBuilder: (context, index){
                      final size  = (widget.product["sizes"] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                               clickSize = size;
                            });
                            
                          },
                          child: Chip(
                            backgroundColor: clickSize == size ? Theme.of(context).colorScheme.primary: null,
                            label: Text(size.toString()),
                            ),
                        ),
                      );
                    }),
                ),
                 const  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.shopping_cart, color: Colors.black,),
                      label: Text("Add to cart", style:  Theme.of(context).textTheme.bodySmall),
                      onPressed: (){
                        onTap();
                         },
                     style:  ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize:const  Size(250, 50),
                      
                     ),
                       ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}