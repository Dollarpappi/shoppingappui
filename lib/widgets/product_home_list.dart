import 'package:flutter/material.dart';

import '../global_variable.dart';
import 'product_card.dart';
import '../pages/products_detail.dart';

class ProductHomeList extends StatefulWidget {
  const ProductHomeList({super.key});

  @override
  State<ProductHomeList> createState() => _ProductHomeListState();
}

class _ProductHomeListState extends State<ProductHomeList> {
   final List<String> categ = [
      "All",
      "Addidas",
      "Nike",
      "Bata",
     ];
    late String selectedCateg;

    @override
    void initState() {
      super.initState();
      selectedCateg = categ[0];
    }
    
  @override
  Widget build(BuildContext context) {

    //inherited model is used to specify a single proper in a wiget.. sizeOf
    //inherited widget specifies the entire property of a widget
    //final size = MediaQuery.sizeOf(context);
     const  border =  OutlineInputBorder(
         borderSide: BorderSide(
         color: Color.fromRGBO(225, 225, 225, 1)
          ),
         borderRadius: BorderRadius.horizontal(
         left: Radius.circular(50),
          )
        );
    return 
    Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          //heaader
          Row(
            children: [
              //wrap makes the text take the next line when at its limit
              Padding(
               padding: const EdgeInsets.all(20),
               child: Text("Get\nShopping",
                style: Theme.of(context).textTheme.titleLarge,
                   ),
                 ),
                 const SizedBox(
                  width: 10,
                 ),
                 Expanded(
                  child: TextFormField(
                    obscureText: false,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                ),
               ),
              ),
            ],
          ),
        
         SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, 
              itemCount: categ.length,
              itemBuilder: (context, index){
                final filter = categ[index];
                return Padding(
                  
                  padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                       selectedCateg = filter; 
                    });
                      
                          },
                  child: Chip(
                    label: Text(filter),
                    labelStyle: const TextStyle(
                      fontSize: 16
                    ),
                    backgroundColor: selectedCateg ==  filter ? Theme.of(context).colorScheme.primary :  const Color.fromRGBO(245, 247, 249, 1),
                    side: const BorderSide(
                      color:  Color.fromRGBO(245, 247, 249, 1),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    ),
                ),
                );
              }),
          ),
          
          //layout builder replaces mediaquery, u dont need it wen using layout builder
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints){
                if(constraints.maxHeight > 650){
                  return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //Child aspect ratio the ratio of the crossaxis to the main axis
                childAspectRatio: 2,
                crossAxisCount: 2), 
              itemBuilder: (context, index){
                 final product = products[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (c)=>ProductsDetail(product: product)));
                    },
                    child: ProductCard(
                      backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                      title: product["title"] as String,
                      price: product["prices"] as double,
                        image: product["imageUrl"] as String,),
                  );
              });
                } else {
                  return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index){
                  final product = products[index];
                  return Container(
                   // padding: EdgeInsets.all(2),
                    margin:const  EdgeInsets.all( 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (c)=>ProductsDetail(product: product)));
                      },
                      child: ProductCard(
                        backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                        title: product["title"] as String,
                        price: product["prices"] as double,
                          image: product["imageUrl"] as String,),
                    ),
                  );
                });
                }
              }),
          ),
        
          ],
        ),
      ),
    );
    
  }
}