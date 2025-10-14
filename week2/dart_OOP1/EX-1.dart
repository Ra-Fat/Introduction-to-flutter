enum Skill { FLUTTER, DART, OTHER }

class Employee{
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final EmpAddress _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  Employee.mobileDev(String name, EmpAddress address, int years)
    : _name = name,
      _baseSalary = 40000,
      _skills = [Skill.FLUTTER, Skill.DART],
      _address = address,
      _yearsOfExperience = years;  

  String get name => _name;
  double get baseSalary => _baseSalary;
  //  protected it from change it's content
  List<Skill> get skills => List.unmodifiable(_skills);
  EmpAddress get address => _address;
  int get yearsOfExperience => _yearsOfExperience;


  double salaryCalculation(){
    double salary = _baseSalary + (_yearsOfExperience * 2000);
    for(var skill in _skills){
      switch(skill){
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void DetailEmp() {
    print('////////////////////////////////////////////////////////');
    print('Employee           : $_name');
    print('Address            : ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Skills             : ${_skills.map((s)=> s.name).join(', ')}');
    print('Years of Experience: $_yearsOfExperience');
    print('Total Salary       : \$${salaryCalculation()}');
    print('////////////////////////////////////////////////////////');
    print("________________________________________________________");
  }
}

class EmpAddress{
  final String street;
  final String city;
  final String zipCode;

  const EmpAddress(this.street, this.city, this.zipCode);
}

void main() {
  var emp1 = Employee(
    'Ra Fat',
    40000,
    [Skill.FLUTTER, Skill.DART, Skill.OTHER],
    const EmpAddress('103 hokly2', 'Phnom Penh', '123'),
    2
  );
  emp1.DetailEmp();

  // Test it with default salary
  var emp2 = Employee.mobileDev(
    'Ma4ter of J4zz',
    const EmpAddress('456 KPC', 'Kampong Chnnange', '321'),
    3
  );
  emp2.DetailEmp();
}