import 'package:flutter/material.dart';
import 'package:product_list_page_app/controller/product_list_screen_controller.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<ProductListScreenController>().getProductDetails();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 235, 235),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 235, 235),
          title: Icon(
            Icons.menu_rounded,
            size: 40,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 300,
                height: 35,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    Text("Search products")
                  ],
                ),
              ),
            )
          ],
        ),
        body: Consumer<ProductListScreenController>(
          builder: (context, providerObj, child) => providerObj
                      .products.length ==
                  0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sneakers",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Icon(Icons.sort),
                                Icon(Icons.filter_alt_outlined)
                              ],
                            ),
                            Text(
                              "25 products found",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: providerObj.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 308,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15),
                          itemBuilder: (context, index) => Column(
                            children: [
                              Card(
                                elevation: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(Icons.favorite_border)),
                                      ),
                                      Image(
                                        image: NetworkImage(providerObj
                                                .products[index]
                                                .images
                                                ?.first ??
                                            ""),
                                        height: 120,
                                        width: 170,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          providerObj.products[index].title
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.attach_money,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            Text(providerObj
                                                .products[index].price
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Text(providerObj
                                                .products[index].rating
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  // height: 250,
                                  width: 165,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
