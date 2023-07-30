import 'package:flutter_test/flutter_test.dart';
import 'package:test_application/ui/extensions/help_methods.dart';

void main() {
  test('getRandomHexColor should return a valid hex color', () {
    String hexColor = getRandomHexColor();

    /// Check if the hexColor starts with '0xFF'
    expect(hexColor.startsWith('0xFF'), true);

    /// Check if the hexColor has the correct length (10 characters including '0xFF')
    expect(hexColor.length, 10);

    /// Check if all characters except '0xFF' are valid hexadecimal characters
    expect(int.tryParse(hexColor.substring(2), radix: 16), isNotNull);
  });

  test('isWhiteOrNearWhite should return true for white or near-white colors', () {
    /// Test for white color
    expect(isWhiteOrNearWhite('0xFFFFFFFF'), true);

    /// Test for near-white colors (with a threshold of 240)
    expect(isWhiteOrNearWhite('0xFFF0F0F0'), true);
    expect(isWhiteOrNearWhite('0xFFFAFAFA'), true);

    /// Test for non-white color
    expect(isWhiteOrNearWhite('0xFFE0E0E0'), false);
  });

  test('isWhiteOrNearWhite should return false for non-white colors with a custom threshold', () {
    /// Test for non-white color with threshold of 200
    expect(isWhiteOrNearWhite('0xFFC0C0C0', threshold: 200), false);

    /// Test for near-white colors (with a custom threshold of 200)
    expect(isWhiteOrNearWhite('0xFFD0D0D0', threshold: 200), true);
    expect(isWhiteOrNearWhite('0xFFE0E0E0', threshold: 200), true);
  });
}
