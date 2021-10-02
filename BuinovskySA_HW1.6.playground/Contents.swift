import UIKit
import Darwin

//: # Home Work 6

/*:
 ## Задание 1
 1.1 Создайте класс `Orange` со следующими свойствами:
 
 - `color: String`
 
 - `taste: String`
 
 - `radius: Double`
 
 Необходимо реализовать возможность создания экземпляра класса со значениями по умолчанию для свойств *color* и *taste*. Свойство *radius* должно быть обязательным для инициализации, т.е. не должно быть возможности создания экземпляра класса без радиуса.
 
 Объявите геттер *orangeVolume*, возвращающий объем апельсина. При этом расчет объема необходимо реализовать в методе *calculateOrangeVolume* (число Пи в Swift можно получить через константу `Double.pi`. Формулу расчета можно погуглить).
 
 Создайте экземпляр класса `Orange`, вызвав при этом инициализатор только для радиуса. Остальным свойствам, созданного экземпляра присвойте следующие значения:
 
 - `color` — *Orange*

 - `taste` — *Sweet*
 
 Выведите на консоль сообщение: «Orange has <...> color and <...> taste. The volume of orange is <...>», обращаясь к этим значениям через экземпляр класса.
 */
class Orange {
    var color: String
    var taste: String
    let radius: Double
    var orangeVolume: Double {
        calculateOrangeVolume()
    }
    
    func calculateOrangeVolume() -> Double {
        4/3 * Double.pi * pow(radius, 3)
    }
    
    init(radius: Double) {
        self.radius = radius
        self.color = "Orange"
        self.taste = "Sweet"
    }
}

let someOrange = Orange(radius: 5.0)
print("Orange has \(someOrange.color) color and \(someOrange.taste) taste. The volume of orange is \(String(format: "%.3f", someOrange.orangeVolume))")
 
/*:
 ## Задание 2
 2.1 Создайте базовый класс `Shape` со следующими вычисляемыми свойствами:
 
 - `square: Double`
 
 - `perimeter: Double`
 
 - `description: String`
 
 Свойство `description` должно возвращать сообщение следующего вида: «Square of shape <...> is <...>. Perimeter - <...>»
 */
class Shape {
    var square: Double { 0.0 }
    var perimeter: Double { 0.0 }
    var description: String {
        "Square of shape \(type(of: self)) is \(square). Perimeter - \(perimeter)"
    }
}
/*:
 2.2. Создайте классы `Circle` и `Rectangle`, унаследовав их от `Shape`. Переопределите свойства `square` и `perimeter` для каждого класса в соответствии с правилом расчета площади и периметра (длины) конкретной фигуры.
 */
class Circle: Shape {
    let radius: Double
    override var square: Double {
        Double.pi * pow(radius, 2)
    }
    override var perimeter: Double {
        2 * Double.pi * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}


class Rectangle: Shape {
    let width: Double
    let height: Double
    override var square: Double {
        width * height
    }
    override var perimeter: Double {
        2 * (width + height)
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}
/*:
 2.3. Создайте класс `Ellips`, унаследовав его от `Rectangle`. Переопределите свойства `square` и `perimeter` в соответствии с правилом расчета площади и периметра эллипса (для расчета нужно использовать ширину и высоту).
 */
class Ellips: Rectangle {
    override var square: Double {
        Double.pi * width * height / 4
    }
    override var perimeter: Double {
        2 * Double.pi * sqrt((pow(width, 2) + pow(height, 2)) / 8)
    }
}
//: 2.4 Создайте по экземпляру каждого класса, кроме `Shape` и выведите значение свойства `description` на консоль.
let circle = Circle(radius: 5)
let rectangle = Rectangle(width: 5, height: 10)
let ellips = Ellips(width: 5, height: 10)

print(circle.description)
print(rectangle.description)
print(ellips.description)

 
/*:
 ## Задание 3
 3.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:
 
 - `salary`
 
 - `name`
 
 - `surname`
 */
class Employee {
    let name: String
    let surname: String
    let salary: Int
    
    init(name: String, surname: String, salary: Int) {
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}

 
//: 3.2 Создайте массив `names` со следующими именами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` со следующими фамилиями: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*. Массивы должны быть созданы вне класса.
let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]
//: 3.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*
var employees: [Employee] = []

for _ in 1...10 {
    let randomEmployee = Employee(name: names.randomElement() ?? "",
                                  surname: surnames.randomElement() ?? "",
                                  salary: Int.random(in: 1000...2000))
    employees.append(randomEmployee)
}


//: 3.4 Переберите массив `employees` и выведите информацию по каждому сотруднику в виде: «<имя> <фамилия>’s salary is $<... >»
for employee in employees {
    print("\(employee.name) \(employee.surname)’s salary is $\(employee.salary)")
}


//: 3.5 Создайте еще один массив на основе `employees`, который включает только тех работников, чья зарплата чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 3.4
var employeesEvenSalary: [Employee] = []

for employee in employees {
    if employee.salary % 2 == 0 {
        employeesEvenSalary.append(employee)
        print("\(employee.name) \(employee.surname)’s salary is $\(employee.salary)")
    }
}

