import 'dart:io';

class Book {
  String title;
  String author;
  double price;
  String category;
  double Quantity;

  Book(this.title, this.author, this.price, this.category, this.Quantity);

  Map<String, dynamic> mymap() {
    return {
      'title': title,
      'author': author,
      'price': price,
      'category': category,
      'Quantity': Quantity
    };
  }

  List<Map<String, dynamic>> booksList = [
    {
      "title": "The Silent Conspirac",
      "author": "James Harper",
      "price": 15,
      "category": "Mystery",
      'Quantity': 200
    },
    {
      "title": "Echoes of Eternity",
      "author": "Emily Caldwell",
      "price": 10.99,
      "category": "Science Fiction",
      'Quantity': 65
    },
    {
      "title": "Lost in the Wilderness",
      "author": "David Mitchell",
      "price": 29.99,
      "category": "Adventure",
      'Quantity': 1000
    }
  ];

  addbook() {
    print("Enter title:");
    String? title = stdin.readLineSync();

    print("Enter author:");
    String? author = stdin.readLineSync();

    print("Enter price:");
    double price = double.tryParse(stdin.readLineSync()!) ?? 0.0;

    print("Enter category:");
    String? category = stdin.readLineSync();

    print("Enter Quantity:");
    double Quantity = double.tryParse(stdin.readLineSync()!) ?? 0.0;
    Book newBook1 = Book(title!, author!, price, category!, Quantity);
    booksList.add(newBook1.mymap());
  }

  printlist() {
    print("\nList of Books:");
    for (var bookMap in booksList) {
      print("-------------------------");
      print("Title: ${bookMap['title']}");
      print("Author: ${bookMap['author']}");
      print("Price: \$${bookMap['price']}");
      print("category: ${bookMap['category']}");
      print("Quantity: ${bookMap['Quantity']}");
      print("-------------------------");
    }
  }

// Function to check if the book exsist
  checklist() {
    print("Enter a title to search for a book:");
    String? check = stdin.readLineSync();

    print("\nSearch Results:");

    for (var bookMap in booksList) {
      if (bookMap['title'].contains(check)) {
        print("-------------------------");
        print("Title: ${bookMap['title']}");
        print("Author: ${bookMap['author']}");
        print("Price: \$${bookMap['price']}");
        print("category: ${bookMap['category']}");
        print("Quantity: ${bookMap['Quantity']}");
        print("-------------------------");
      }
    }
  }

// Function to buy a book
  buyBook() {
    print("Enter the book title you want to buy:");
    String? title = stdin.readLineSync();

    var bookMap = booksList.firstWhere((book) => book['title'] == title);

    if (bookMap != null) {
      double availableQuantity = double.parse(bookMap['Quantity']);

      print("Available copies: $availableQuantity");

      if (availableQuantity > 0) {
        print("How many copies do you want to buy?");
        double quantityToBuy = double.tryParse(stdin.readLineSync()!) ?? 0.0;

        if (quantityToBuy > 0 && quantityToBuy <= availableQuantity) {
          bookMap['Quantity'] = availableQuantity - quantityToBuy;
          print("Book(s) purchased successfully.");
        } else {
          print("Invalid quantity. Please enter a valid number.");
        }
      } else {
        print("The book '$title' is out of stock.");
      }
    } else {
      print("Book with the title '$title' not found.");
    }
  }

// Function to delete a book
  deletebook() {
    print("enter the book name you want to delete");
    String? title = stdin.readLineSync();
    booksList.removeWhere((element) => element.containsValue(title));

    print("the book $title had been deleted");
    print("this is the books left after the changes$booksList");
  }

  // Function to modify a book
  void modifyBook() {
    print("Enter the book title you want to modify:");
    String? title = stdin.readLineSync();

    var bookToModify = booksList.firstWhere((book) => book['title'] == title);

    if (bookToModify.containsValue(title)) {
      print("Current book information:");
      print("Title: ${bookToModify['title']}");
      print("Author: ${bookToModify['author']}");
      print("Price: ${bookToModify['price']}");
      print("category: ${bookToModify['category']}");
      print("Quantity: ${bookToModify['Quantity']}");

      print("Enter new information (leave empty to keep current):");
      print("New Title: ");
      String? newTitle = stdin.readLineSync() ?? bookToModify['title'];
      print("New Author: ");
      String? newAuthor = stdin.readLineSync() ?? bookToModify['author'];
      print("New Price: ");
      double? newPrice =
          double.tryParse(stdin.readLineSync()!) ?? bookToModify['price'];
      print("New category :");
      String? newCategory = stdin.readLineSync() ?? bookToModify['author'];
      print("New Quantity: ");
      double? newQuantity =
          double.tryParse(stdin.readLineSync()!) ?? bookToModify['Quantity'];

      // Update book information
      bookToModify['title'] = newTitle;
      bookToModify['author'] = newAuthor;
      bookToModify['price'] = newPrice;
      bookToModify['category'] = newCategory;
      bookToModify['Quantity'] = newQuantity;

      print("Book information updated successfully.");
    } else {
      print("Book with the title '$title' not found.");
    }
  }
}
