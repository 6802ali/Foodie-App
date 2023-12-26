// Import the testing library
import 'package:flutter_test/flutter_test.dart';

// The function you want to test
int add(int a, int b) {
  return a + b;
}

void main() {
  test('Restaurant Service Operations', () {
    // Assert
    expect(add(2, 3), 5);
    expect(add(3, 3), 6);
    expect(add(4, 3), 7);
  });
}
