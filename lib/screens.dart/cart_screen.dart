import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_pod/models/car.dart';
import 'package:my_pod/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen(this.cartList, {super.key});
  final List<Car> cartList;

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          ...widget.cartList.map(
            (cartItem) => Dismissible(
              key: ValueKey(cartItem),
              // onDismissed: (value) {
              //   setState(() {
              //     widget.cartList.remove(cartItem);
              //   });
              // },

              onDismissed: (value) =>
                  ref.read(cartNotifierProvider.notifier).addCars(cartItem),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        width: double.infinity,
                        color: cartItem.color,
                        child: Text(cartItem.name),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
