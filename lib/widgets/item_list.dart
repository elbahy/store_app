import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_products_service.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: AllProductsServic().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> product = snapshot.data!;
            return GridView.builder(
              itemCount: product.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          product[index].image,
                          height: 100,
                        ),
                        Text(product[index].title.substring(0, 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(r'$' '${product[index].price}'),
                            IconButton(
                              color: Colors.red,
                              icon: Icon(
                                Icons.favorite,
                              ),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

/* GridView.builder(
      itemCount: 10,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => Image.network(
        'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
      ),
    )*/