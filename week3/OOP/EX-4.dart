enum DeliveryMethod {delivery, pickup}

class Product{
  final int _id;
  final String _name;
  final double _price;

  Product({required int id, required String name , required double price})
      : _id = id,
        _name = name,
        _price = price;

  int get id => _id;
  String get name => _name;
  double get price => _price;

}

class ProductOrdered{
  final Product _product;
  final int _quantity;

  ProductOrdered({required Product product, required int quantity})
      : _product = product,
        _quantity = quantity;

  Product get product => _product;
  int get quantity => _quantity;

  double total()=> _product.price * _quantity;
}

class CustomerAddress{
  final String _street;
  final String _district;
  final String _commune;
  final String _capital;

  CustomerAddress({required String street, required String district, required String commune, required String capital})
      : _street = street,
        _district = district,
        _commune = commune,
        _capital = capital;

  String get street => _street;
  String get district => _district;
  String get commune => _commune;
  String get capital => _capital;

  @override
  String toString() {
    return "$_street , $_commune , $_district , $_capital";
  }
}

class Customer{
  final String _name;
  final String _phoneNumber;
  final CustomerAddress _address;

  Customer({required String name, required String phoneNumber, required CustomerAddress address})
      : _name = name,
        _phoneNumber = phoneNumber,
        _address = address;

  String get name => _name;
  String get phoneNumber => _phoneNumber;
  CustomerAddress get address => _address;
}

class Order{
  final List<ProductOrdered> _items = [];
  final Customer _customer;
  final DeliveryMethod _deliveryMethod;

  Order({required Customer customer, required DeliveryMethod deliveryMethod})
      : _customer = customer,
        _deliveryMethod = deliveryMethod;

  void addItem(ProductOrdered item){
    _items.add(item);

  }

  double get totalAmount{
    double temp = 0;
    for(var item in _items){
      temp += item.total();
    }
    if (_deliveryMethod == DeliveryMethod.delivery) {
      temp += 2.0;
    }
    return temp;
  }

  void printInvoice() {
    print("\n-*-*-+-*-*-*-* INVOICE -*-*-*-+-*-*-*\n");
    print("Customer: ${_customer.name}");
    print("Phone Number: ${_customer.phoneNumber}");
    print("Address: ${_customer.address}");
    print("Delivery Method: ${_deliveryMethod.name}");
    print("--------------------------------------");
    print("No  Product         Qty     Unit Price    Total");
    for (int i = 0; i < _items.length; i++) {
      var item = _items[i];
      print(
          "${i + 1}   ${item.product.name.padRight(14)} ${item.quantity.toString().padLeft(3)}  ${item.product.price.toStringAsFixed(2).padLeft(10)}\$  ${item.total().toStringAsFixed(2).padLeft(10)}\$");
    }
    if (_deliveryMethod == DeliveryMethod.delivery) {
      print("--------------------------------------");
      print("Delivery Fee: \$2.00");
    }
    print("--------------------------------------");
    print("TOTAL Price: \$${totalAmount.toStringAsFixed(2)}");
    // print("-*-*-+-*-*-*-*-*-*-*-+-*-*-*-*-*-*-*-*");
  }
}

void main(){
  var computer = Product(id: 1, name: "Dell Vostro", price: 250);
  var headset = Product(id: 2, name: "IEM", price: 12);
  var mouse = Product(id: 3, name: "Marvo", price: 28);

  var address1 = CustomerAddress(
    street: "St. 271",
    commune: "Toul Tompoung",
    district: "Chamkarmon",
    capital: "Phnom Penh",
  );

  var address2 = CustomerAddress(
    street: "St. 592",
    commune: "Chrang Chomreh",
    district: "Resey keo",
    capital: "Phnom Penh",
  );

  var customer1 = Customer(
    name: "RaFat21",
    phoneNumber: "012345678",
    address: address1,
  );

  var customer2 = Customer(
    name: "Jazz the god",
    phoneNumber: "09876543",
    address: address2,
  );

  var order1 = Order(customer: customer1, deliveryMethod: DeliveryMethod.delivery);
  var order2 = Order(customer: customer2, deliveryMethod: DeliveryMethod.pickup);

  order1.addItem(ProductOrdered(product: computer, quantity: 1));
  order1.addItem(ProductOrdered(product: headset, quantity: 2));
  order2.addItem(ProductOrdered(product: mouse, quantity: 3));

  order1.printInvoice();
  order2.printInvoice();

}