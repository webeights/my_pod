import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_pod/data/dummy_data.dart';
import 'package:my_pod/models/car.dart';
import 'package:my_pod/providers/cart_provider.dart';
import 'package:my_pod/screens.dart/cart_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Car> cart = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Cars'),
        actions: [
          IconButton(
            onPressed: () async {
              var data = await Navigator.of(context).push<List<Car>>(
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart),
                ),
              );
              print('$data hereeeees the data');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: cars.map((car) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: car.color,
              child: ListTile(
                title: Text(car.name),
                subtitle: Text('\$ ${car.price}'),
                trailing: IconButton(
                  onPressed: () =>
                      ref.read(cartNotifierProvider.notifier).addCars(car),
                  icon: Icon(cart.contains(car)
                      ? Icons.remove_circle_outline
                      : Icons.add_circle_outlined),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
