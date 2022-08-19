import 'package:flutter/material.dart';
import '../app.dart';
import '../model/product_model.dart';
import '../services/product_service.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {

  late ProductService provider;

  void _navigateDetail() {
    Navigator.pushNamed(context, DetailPage.id);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyApp.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    provider = ProductService.of(context);
    provider.getAllProducts();
  }

  @override
  void didPopNext() {
    setState(() {});
    super.didPop();
  }

  @override
  Widget build(BuildContext context) {
    return ProductService(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping App", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: _navigateDetail,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.shopping_cart, color: Colors.black, size: 35,),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(provider.length.toString(), style: const TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: ProductService(
          child: ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              List<Product> items = provider.items;
              return ListTile(
                horizontalTitleGap: 30,
                leading: Image.network(items[index].image, height: 60, width: 60, fit: BoxFit.cover,),
                title: Text(items[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text("${items[index].price} so'm", style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600),),
                trailing: Checkbox(
                  value: items[index].isSelected,
                  onChanged: (value) {
                    provider.onChange(items[index]);
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}