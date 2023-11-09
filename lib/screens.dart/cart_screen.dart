import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_pod/data/dummy_data.dart';
import 'package:my_pod/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          ...cars.map(
            (cartItem) => Dismissible(
              key: ValueKey(cartItem),
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
