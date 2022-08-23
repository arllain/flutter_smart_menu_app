import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';

void main() {
  test('CategoryEntity expected not to be null', () {
    var dateCreated = DateTime.now();

    CategoryEntity categoryEntity = CategoryEntity(
        id: 1,
        name: 'category 1',
        description: "description",
        dateCreated: dateCreated);

    expect(categoryEntity, isNotNull);
  });
}
