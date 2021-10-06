import UIKit

//: # Home Work 7

/*:
 ## Задание 1
 1.1 Создайте перечисление `CalculationType`, содержащее четыре математических действия — *сложение*, *вычитание*, *умножение* и *деление*.
 */

enum CalculationType: String {
    case addition = "сложения",
         subtraction = "вычитания",
         multiplication = "умножения",
         division = "деления"
}


//: 1.2 Напишите функцию возвращающую `Int` и принимающую в качестве параметров три значения: число один, число два и тип математической операции. Внутри функции, в зависимости от значения параметра `CalculationType` выполните соответствующую математическую операцию со значениями и верните результат. Реализуйте функцию таким образом, что бы при каждом её вызове на консоль выводилось сообщение следующего содержания: «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>».

func mathOperation(firstNumber: Int,
                   secondNumber: Int,
                   operation: CalculationType) -> Int {
    let result: Int
    
    switch operation {
    case .addition:
        result = firstNumber + secondNumber
    case .subtraction:
        result = firstNumber - secondNumber
    case .multiplication:
        result = firstNumber * secondNumber
    case .division:
        result = firstNumber / secondNumber
    }
    
    print("Результат \(operation.rawValue) \(firstNumber) и \(secondNumber) равен \(result)")
    return result
}

//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.

mathOperation(firstNumber: 3, secondNumber: 4, operation: .addition)
mathOperation(firstNumber: 3, secondNumber: 4, operation: .subtraction)
mathOperation(firstNumber: 3, secondNumber: 4, operation: .multiplication)
mathOperation(firstNumber: 3, secondNumber: 4, operation: .division)


/*:
 ## Задание 2
 2.1 Создайте перечисление `DistanceUnit` (Единица измерения расстояния) со следующими кейсами: `versta`, `kilometer`, `mile`.
 
 Внутри перечисления `DistanceUnit` создайте еще одно перечисление `NonISUCountry` в котором содержится перечень стран не принявших международную систему единиц (США, Либерия и Мьянма).
 
 Верста и километр должны иметь ассоциативный параметры следующего типа: `(title: String, denotation: String, countries: [String])`. Миля - `(title: String, denotation: String, countries: [NonISUCountry])`. Первый параметр - это название единицы измерения, второй параметр отвечает за обозначение единицы, а массив должен содержать перечень стран в которых используется эта единица (для километра не обязательно перечислять все страны).
 */

enum DistanceUnit {
    case versta(title: String, denotation: String, countries: [String]),
         kilometer(title: String, denotation: String, countries: [String])
    case mile(title: String, denotation: String, countries: [NonISUCountry])
    enum NonISUCountry: String {
        case usa = "США", liberia = "Либерия", myanma = "Мьянма"
    }
}

/*:

 2.2 Создайте по экземпляру DistanceUnit для каждого кейса и функцию, которая должна принимать единицу измерения и выводить на консоль информацию о ней, например: "Километр. Краткое наименование: км. Страны: Россия, Евросоюз".
 */

func printDistanceUnit(for unit: DistanceUnit) {
    switch unit {
    case let .versta(title,denotation,countries),
        let .kilometer(title,denotation,countries):
        print("\(title). Краткое наименование: \(denotation). Страны: \(stringFromArray(countries))")
    case let .mile(title, denotation, countries):
        print("\(title). Краткое наименование: \(denotation). Страны: \(stringFromArray(countries.map {$0.rawValue}))")
    }
}

func stringFromArray<T: Equatable>(_ array:[T]) -> String {
    var resultString = ""
    for item in array {
        if item == array.last {
            resultString += "\(item)."
            break
        }
        resultString += "\(item), "
    }
    return resultString
}

let verstaUnit = DistanceUnit.versta(title: "Верста", denotation: "верста", countries: ["Россия", "Казахстан", "Белоруссия"])
let kilometrUnit = DistanceUnit.kilometer(title: "Километр", denotation: "км", countries: ["Германия", "Франция", "Италия"])
let mileUnit = DistanceUnit.mile(title: "Миля", denotation: "миля", countries: [.usa, .liberia, .myanma])

printDistanceUnit(for: verstaUnit)
printDistanceUnit(for: kilometrUnit)
printDistanceUnit(for: mileUnit)
 
/*:
 ## Задание 3
 3.1 Создайте структуру `Car` со следующими свойствами:
 - `model: String`
 - `power: Int`
 - `description: String`
 
 Свойство `description` должно возвращать сообщение с названием автомобиля и его мощность в лошадиных силах.
 
 Так же необходимо реализовать метод `increasePower`, который должен увеличить мощность автомобиля на заданное количество лошадиных сил.
  */

struct Car {
    let model: String
    var power: Int
    var description: String {
        "Модель автомобиля: \(model), мощность: \(power) л.с."
    }
    
    mutating func increasePower(at additionalPower: Int) {
        power += additionalPower
    }
}


/*:
 3.2 Создайте экземпляр структуры и инициализируйте её свойства. Выведите значение свойства `description` на консоль, а затем вызовите метод `increasePower`. Снова выведите значение свойства `description` на консоль.
*/

var someCar = Car(model: "BMW", power: 150)
print(someCar.description)
someCar.increasePower(at: 50)
print(someCar.description)



