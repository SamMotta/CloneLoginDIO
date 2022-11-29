import 'dart:math';

class RNGService {
  static int rng({int max = 100}) {
    Random rng = Random();
    return rng.nextInt(max + 1);
  }
}
