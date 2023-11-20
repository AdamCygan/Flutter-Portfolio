import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/data_class.dart';
import 'package:provider_app/utils/utils.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<DataClass>(
          builder: (context, dataClass, child) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${dataClass.x}'),
                    MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          if (context.read<DataClass>().x > 0) {
                            context.read<DataClass>().decrementX();
                          } else {
                            Utils.showSnackBar(context, 'message');
                          }
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
