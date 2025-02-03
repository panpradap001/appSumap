import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([SharedPreferences])
void main() {
  // Mocking SharedPreferences
  setUp(() async {
    SharedPreferences.setMockInitialValues(
        {}); // ตั้งค่า mock สำหรับ SharedPreferences

    await Supabase.initialize(
      url: 'https://qivufhdbbhjtauakjqrm.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFpdnVmaGRiYmhqdGF1YWtqcXJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc5Njk0MjEsImV4cCI6MjA0MzU0NTQyMX0.ykrkBsgQzEVfSbEF9i4B8K84BPARkgVTtYIYK3HsWUg',
    );
  });

  test('ทดสอบการดึงข้อมูลจาก Supabase', () async {
    await Supabase.instance.client
        .from('floor1')
        .select()
        .eq('id', 9)
        .then((response) {
      expect(response, isNotEmpty);
      expect(response[0]['name'], equals('Co-working space (AA)'));
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  });
}
