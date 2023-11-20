import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/data_class.dart';
import 'package:provider_app/utils/utils.dart';
import 'package:provider_app/views/shopping_cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchInput);
  }

  void _onSearchInput() {
    print("${_searchController.text}");
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 245, 1),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Consumer<DataClass>(
          builder: (context, dataClass, child) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold, letterSpacing: 1.28),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      SizedBox(
                        width: 200,
                        height: 48,
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search for ...',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white), // Set the color you want
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white), // Set the color you want
                            ),
                          ),
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),

                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Recommended section'),
                const Text('Popular section'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${dataClass.x}'),
                    MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          if (context.read<DataClass>().x <= 8) {
                            context.read<DataClass>().incrementX();
                          } else {
                            Utils.showSnackBar(context, 'message');
                          }
                        }),
                    MaterialButton(
                        color: Colors.red,
                        child: const Text('Next page'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/shopping-cart');
                        })
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
