import '../models/contact.dart';
import '../models/user.dart';

abstract class Menu{
  build();
  static User user = User(
    '1',
    "John Doe",
    'password123',
    'JohnD',
    '123456789',
    true,
    contacts: [Contacts('Friend 1', '987654321')],
  );
}