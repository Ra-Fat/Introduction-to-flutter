class BankAccount {
  // TODO
  final int _accountId;
  final String _owner;
  double _balance = 0;

  BankAccount({required int accountId, required String owner})
      : _accountId = accountId,
        _owner = owner;
  
  int get accountId => _accountId;
  String get owner => _owner;
  double get balance => _balance;

  void withdraw(double paidMoney) {
    if (paidMoney <= 0){
      throw Exception("Money that paid must be valid");
    }
    if(_balance - paidMoney < 0){
      throw Exception("Insufficient balance");
    }
    _balance -= paidMoney;
  }

  void credit(double depositMoney) {
    if (depositMoney <= 0){
      throw Exception("Money that deposit must be valid");
    }
    _balance += depositMoney;
  }
}

class Bank {
  // TODO
  final String _name;
  final List<BankAccount> _accounts = [];

  Bank({required String name}) : _name = name;
  String get name => _name;

  BankAccount createAccount(int accountId, String accountOwner){
    for(var account in _accounts){
      if(account.accountId == accountId){
        throw Exception("Account with ID $accountId already exists!!!!");
      }
    }
    final account = BankAccount(accountId: accountId, owner: accountOwner);
    _accounts.add(account);
    return account;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print("Balance: \$${ronanAccount.balance}"); // Balance: $0
  ronanAccount.credit(100);
  print("Balance: \$${ronanAccount.balance}"); // Balance: $100
  ronanAccount.withdraw(50);
  print("Balance: \$${ronanAccount.balance}"); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  }catch(e){
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
