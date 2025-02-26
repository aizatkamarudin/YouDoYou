Future<void> createItem(Map<String, dynamic> newItem, todo) async {
  await todo.add(newItem);
}

Future<void> updateItem(int itemKey, Map<String, dynamic> newItem, todo) async {
  await todo.put(itemKey, newItem);
}

Future<void> deleteItem(int itemKey, todo) async {
  await todo.delete(itemKey);
}
