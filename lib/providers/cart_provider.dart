import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_pod/models/car.dart';

class CartProvider extends StateNotifier<List<Car>> {
  CartProvider() : super([]);

  void addCars(Car car) {
    var isExisting = state.contains(car);

    if (isExisting) {
      state = state.where((c) {
        return c.name != car.name; // false
      }).toList();
    } else {
      state = [...state, car];
    }
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartProvider, List<Car>>((ref) {
  return CartProvider();
});
