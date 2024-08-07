import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:placehold_img/placehold_img.dart';

void main() {
  testWidgets('PlaceholdImg creates CachedNetworkImage with correct URL',
      (WidgetTester tester) async {
    final placeholderImage = PlaceholdImg();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: placeholderImage.image(width: 800, height: 600),
        ),
      ),
    );

    // Check if CachedNetworkImage is found
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Verify that the CachedNetworkImage has the correct URL
    final cachedNetworkImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedNetworkImage.imageUrl, "https://placehold.co/800x600");
  });

  testWidgets('PlaceholdImg shows CircularProgressIndicator while loading',
      (WidgetTester tester) async {
    final placeholderImage = PlaceholdImg();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: placeholderImage.image(width: 800, height: 600),
        ),
      ),
    );

    // Since the image is still loading, the CircularProgressIndicator should be displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
