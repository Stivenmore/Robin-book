import 'package:books/Data/Repository.dart';

import 'package:books/Logic/Provider/BookProvider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Search', () {
    test(' ', () async {
      final provider = BookProvider(Repository());
      final res = await provider.getSearchWorks(q: 'Tintin');
      expect(provider.errorGlobal, '');
    });

    test(' ', () async {
      final provider = BookProvider(Repository());
      final res = await provider.getSearchWorks(q: '');
      expect(provider.errorGlobal, 'Parametro vacio');
    });

    test(' ', () async {
      final provider = BookProvider(Repository());
      final res = provider.getStreamSearch('');
      expect(provider.errorGlobal, '');
    });
  });
}
