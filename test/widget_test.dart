import 'package:flutter_test/flutter_test.dart';
import 'package:zeely_test_task/main.dart';

void main() {
  testWidgets('App builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
  });
}
