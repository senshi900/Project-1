import 'dart:io';
import 'package:libryproject/classes.dart';

void main() {
  var choice = 0;
  String title = "";
  String author = "";
  double price = 0;
  String category = "";
  double Quantity = 0;
  Book newBook = Book(title, author, price, category, Quantity);

  while (choice != 7) {
    print(' welcome to the Library Management System');
    print('1. Add a Book');
    print('2. List All Books');
    print('3. Find a Book by name');
    print('4. buy a book');
    print('5. delete a book');
    print('6. modfiy a book');
    print('7. Exit');
    stdout.write('Enter your choice: ');
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        newBook.addbook();
        break;
      case 2:
        newBook.printlist();
        break;

      case 3:
        newBook.checklist();
        break;

      case 4:
        newBook.buyBook();
        break;
      case 5:
        newBook.deletebook();

      case 6:
        newBook.modifyBook();
      case 7:
        exit(0);
    }
  }
}
