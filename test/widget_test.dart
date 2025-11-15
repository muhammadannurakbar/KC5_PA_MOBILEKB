// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rempah_id/main.dart';

void main() {
  testWidgets('REMPAH.ID app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RempahApp());
    
    expect(find.text('🌿 REMPAH.ID'), findsOneWidget);
    expect(find.text('Identifikasi Rempah Indonesia'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });

  testWidgets('Navigation menu test', (WidgetTester tester) async {
    await tester.pumpWidget(const RempahApp());
    
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Tentang'), findsOneWidget);
    expect(find.text('Galeri'), findsOneWidget);
    expect(find.text('Upload'), findsOneWidget);
  });
}