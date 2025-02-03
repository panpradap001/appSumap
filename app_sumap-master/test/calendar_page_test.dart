import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app_project/pages/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock SharedPreferences
  SharedPreferences.setMockInitialValues({});

  // Use setUp to initialize Supabase before each test
  setUp(() async {
    await Supabase.initialize(
      url: 'https://qivufhdbbhjtauakjqrm.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFpdnVmaGRiYmhqdGF1YWtqcXJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc5Njk0MjEsImV4cCI6MjA0MzU0NTQyMX0.ykrkBsgQzEVfSbEF9i4B8K84BPARkgVTtYIYK3HsWUg',
    );
  });

  testWidgets('CalendarPage displays calendar', (WidgetTester tester) async {
    // Build the CalendarPage
    await tester.pumpWidget(const MaterialApp(home: CalendarPage()));

    // Wait for Calendar to load
    await tester.pumpAndSettle();

    // Check if TableCalendar is displayed on screen
    expect(find.byType(TableCalendar), findsOneWidget);

    // Check if AppBar displays 'Activity'
    expect(find.text('Activity'), findsOneWidget);
  });
}
