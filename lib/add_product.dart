import 'package:flutter/material.dart';
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
      home: AddProduct(),
    );
  }
}

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  GlobalKey<FormState> addNewProduct = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController thumbnail = TextEditingController();
  TextEditingController image1 = TextEditingController();
  TextEditingController image2 = TextEditingController();
  TextEditingController image3 = TextEditingController();
  TextEditingController image4 = TextEditingController();
  TextEditingController image5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Products'),
      ),
      body: ListView(
        children: [
          Form(
            key: addNewProduct,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: title,
                          decoration: InputDecoration(
                            hintText: 'title',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: description,
                          decoration: InputDecoration(
                            hintText: 'description',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: price,
                          decoration: InputDecoration(
                            hintText: 'price',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Brand',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: brand,
                          decoration: InputDecoration(
                            hintText: 'brand',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: category,
                          decoration: InputDecoration(
                            hintText: 'category',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thumbnail',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: thumbnail,
                          decoration: InputDecoration(
                            hintText: 'thumbnail',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Images',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        width: 275,
                        height: 50,
                        child: TextField(
                          controller: image1,
                          decoration: InputDecoration(
                            hintText: 'image',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(143, 149, 158, 1)),
                            filled: true,
                            fillColor: Color.fromRGBO(245, 246, 250, 1),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 275,
                          height: 50,
                          child: TextField(
                            controller: image2,
                            decoration: InputDecoration(
                              hintText: 'image',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(143, 149, 158, 1)),
                              filled: true,
                              fillColor: Color.fromRGBO(245, 246, 250, 1),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 275,
                          height: 50,
                          child: TextField(
                            controller: image3,
                            decoration: InputDecoration(
                              hintText: 'image',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(143, 149, 158, 1)),
                              filled: true,
                              fillColor: Color.fromRGBO(245, 246, 250, 1),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 275,
                          height: 50,
                          child: TextField(
                            controller: image4,
                            decoration: InputDecoration(
                              hintText: 'image',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(143, 149, 158, 1)),
                              filled: true,
                              fillColor: Color.fromRGBO(245, 246, 250, 1),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 275,
                          height: 50,
                          child: TextField(
                            controller: image5,
                            decoration: InputDecoration(
                              hintText: 'image',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(143, 149, 158, 1)),
                              filled: true,
                              fillColor: Color.fromRGBO(245, 246, 250, 1),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ProductsServiceImp().setNewproduct(
                title.text,
                description.text,
                num.parse(price.text),
                brand.text,
                category.text,
                thumbnail.text,
                [
                  image1.text,
                  image2.text,
                  image3.text,
                  image4.text,
                  image5.text,
                ],
              );
            },
            child: Container(
              width: 100,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(151, 117, 250, 1)),
            ),
          )
        ],
      ),
    );
  }
}
