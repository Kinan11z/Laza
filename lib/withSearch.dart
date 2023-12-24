import 'package:flutter/material.dart';
import 'package:laza/add_product.dart';
import 'package:laza/model/products_data.dart';
import 'package:laza/product_inform.dart';
import 'package:laza/service/products_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBarExample(),
    );
  }
}

String category_name = '';
int selectedIndex = 0;

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          elevation: 0,
          indicatorColor: Colors.transparent,
          // indicatorShape: CircleBorder(),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: Duration(seconds: 3),
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
                selectedIcon: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(151, 117, 250, 1),
                  ),
                ),
                tooltip: null,
                icon: Image.asset('asset/home.png'),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Text(
                  'Wishlist',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(151, 117, 250, 1),
                  ),
                ),
                icon: Image.asset('asset/Heart.png'),
                label: 'Profile'),
            NavigationDestination(
                selectedIcon: Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(151, 117, 250, 1),
                  ),
                ),
                icon: Image.asset('asset/bag_grey.png'),
                label: 'Orders'),
            NavigationDestination(
                selectedIcon: Text(
                  'My Cards',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(151, 117, 250, 1),
                  ),
                ),
                icon: Image.asset('asset/wallet.png'),
                label: 'My Cards')
          ],
        ));
  }
}

List<Widget> pages = [
  Products(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
];

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(159, 162, 173, 0.15)),
                    child: InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProduct(),
                              ),
                            ),
                        child: Image.asset('asset/list.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 260),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(159, 162, 173, 0.15)),
                    child: Image.asset('asset/Bag.png'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 270),
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 215),
            child: Text(
              'Welcome to Laza.',
              style: TextStyle(
                color: Color.fromRGBO(143, 149, 158, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 275,
                  height: 50,
                  child: Search(products: [], search_result: []),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(151, 117, 250, 1)),
                    child: Icon(
                      Icons.mic_none,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text(
                  'Choose Brand',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 155),
                  child: ViewAll(),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: ProductsServiceImp().getCategories(),
            builder: (context, snapshot) {
              print(ProductsServiceImp().getCategories());
              if (snapshot.hasData) {
                dynamic temp = snapshot.data;
                List<String> category = List.generate(
                  temp.length,
                  (index) => temp[index],
                );
                return SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: ChooseBrand(
                        category: category,
                        index: index,
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'New Arraival',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 155),
                  child: Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(143, 149, 158, 1)),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: ProductsServiceImp().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dynamic temp = snapshot.data;
                List<Products_data> product = List.generate(
                  temp['products'].length,
                  (index) => Products_data.fromMap(
                    temp['products'][index],
                  ),
                );
                bool is_category = false;
                int count_category = 0;
                product.forEach((element) {
                  if (element.category == category_name) {
                    is_category = true;
                    count_category++;
                  }
                });
                if (is_category) {
                  return SizedBox(
                    height: 300,
                    width: double.maxFinite,
                    child: ShowProduct(
                        count_category: count_category, product: product),
                  );
                } else {
                  return SizedBox(
                    height: 300,
                    width: double.maxFinite,
                    child: GridView.builder(
                      itemCount: product.length,
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.75,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductInfo(
                                      hero: index,
                                      title: product[index].title,
                                      description: product[index].description,
                                      price: product[index].price,
                                      discountPercentage:
                                          product[index].discountPercentage,
                                      rating: product[index].rating,
                                      stock: product[index].stock,
                                      brand: product[index].brand,
                                      category: product[index].category,
                                      images: product[index].images,
                                      thumbnail: product[index].thumbnail),
                                ),
                              );
                            },
                            child: Container(
                              width: 160,
                              height: 170,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(159, 162, 173, 0.15),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    height: 170,
                                    child: Hero(
                                      tag: index,
                                      child: Image.network(
                                        product[index].thumbnail,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Favorite())
                                ],
                              ),
                              alignment: Alignment.topRight,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              product[index].title,
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              '\$' + product[index].price.toString(),
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}

class Search extends StatefulWidget {
  const Search(
      {super.key, required this.products, required this.search_result});
  final List<Products_data> search_result;
  final List<Products_data> products;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(color: Color.fromRGBO(143, 149, 158, 1)),
        prefixIcon: Icon(
          Icons.search,
          color: Color.fromRGBO(143, 149, 158, 1),
        ),
        filled: true,
        fillColor: Color.fromRGBO(245, 246, 250, 1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      onChanged: (value) {
        setState(() {
          widget.search_result.clear();
          widget.products.forEach((element) {
            if (element.title.contains(value)) {
              widget.search_result.add(element);
            }
          });
        });
      },
    );
  }
}

class ViewAll extends StatefulWidget {
  const ViewAll({
    super.key,
  });

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        category_name = '';
      },
      child: Text(
        'View All',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(143, 149, 158, 1)),
      ),
    );
  }
}

class ShowProduct extends StatefulWidget {
  const ShowProduct({
    super.key,
    required this.count_category,
    required this.product,
  });

  final int count_category;
  final List<Products_data> product;

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.count_category,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (category_name == widget.product[index].category) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductInfo(
                          hero: index,
                          title: widget.product[index].title,
                          description: widget.product[index].description,
                          price: widget.product[index].price,
                          discountPercentage:
                              widget.product[index].discountPercentage,
                          rating: widget.product[index].rating,
                          stock: widget.product[index].stock,
                          brand: widget.product[index].brand,
                          category: widget.product[index].category,
                          images: widget.product[index].images,
                          thumbnail: widget.product[index].thumbnail),
                    ),
                  );
                },
                child: Container(
                  width: 160,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(159, 162, 173, 0.15),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 170,
                        child: Hero(
                          tag: index,
                          child: Image.network(
                            widget.product[index].thumbnail,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(alignment: Alignment.topRight, child: Favorite())
                    ],
                  ),
                  alignment: Alignment.topRight,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  widget.product[index].title,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  '\$' + widget.product[index].price.toString(),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              )
            ],
          );
        }
        // else {
        //   return Container();
        // }
      },
    );
  }
}

class ChooseBrand extends StatefulWidget {
  const ChooseBrand({super.key, required this.category, required this.index});

  final List<String> category;
  final int index;

  @override
  State<ChooseBrand> createState() => _ChooseBrandState();
}

class _ChooseBrandState extends State<ChooseBrand> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          category_name = widget.category[widget.index];
          print(category_name);
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 155,
        height: 50,
        decoration: BoxDecoration(
            color: Color.fromRGBO(159, 162, 173, 0.15),
            borderRadius: BorderRadius.circular(10)),
        child: Text(widget.category[widget.index]),
      ),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({
    super.key,
  });

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  Color color = Colors.grey;
  bool pressed = true;
  IconData icon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (pressed) {
            color = Colors.red;
            icon = Icons.favorite;
          } else {
            color = Colors.grey;
            icon = Icons.favorite_border;
          }
        });
        pressed = !pressed;
      },
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
