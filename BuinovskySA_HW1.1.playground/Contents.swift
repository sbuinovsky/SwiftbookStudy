import Foundation

// Задание 1
/*
 Объявите константу firstString со значением "I can" и secondString со значением "code". В значениях констант ни каких хитростей с лишними пробелами быть не должно. Выведите на консоль фразу "I can code!" с восклицательным знаком, используя эти строковые свойства.
 */

let firstString = "I can"
let secondString = "code"
let resultString = firstString + " " + secondString + "!"

print(resultString)


// Задание 2
/*
 2.1 Объявите свойство myAge и присвойте ему значение вашего возраста.
 */

let myAge = 36

/*
 2.2 Объявите свойство myAgeInTenYears и присвойте ему значение вашего возраста через 10 лет (используйте для этого константу myAge и оператор сложения).
 */

let myAgeInTenYears = myAge + 10

/*
 2.3 Объявите свойство daysInYear и присвойте ему значение 365.25 (число дней в году с учетом високосных лет). Тип данных, которое свойство примет по умолчанию менять не нужно.
 */

let daysInYear = 365.25

/*
 2.4 Объявите свойство daysPassed с типом Float и присвойте ему значение количества дней с момента вашего рождения плюс 10 лет (используйте для этого myAgeInTenYears и daysInYear).
 */

let daysPassed: Float = Float(Double(myAgeInTenYears) * daysInYear)

/*
 2.5 При помощи функции print() выведите в консоль фразу: «Мой возраст <...> лет. Через 10 лет, мне будет <...> лет, с момента моего рождения пройдет <...> дней". Символы (<...>) необходимо заменить на значения свойств.
 */

let myAgeString = "Мой возраст \(myAge) лет. Через 10 лет, мне будет \(myAgeInTenYears) лет, с момента моего рождения пройдет \(Int(daysPassed)) дней."

print(myAgeString)


// Задание 3

/*
 Необходимо вычислить площадь и периметр прямоугольного треугольника.

 Катет AC = 8.0

 Катет CB = 6.0.

 Гипотенузу AB вычисляем при помощи функции sqrt(Double), поместив в скобки вместо Double сумму квадратов катетов.

 В расчетах можно использовать только арифметические операторы. Функцию pow использовать не надо.
 */

let firstCathetus = 8.0
let secondCathetus = 6.0
let hypotenuse = sqrt(firstCathetus*firstCathetus + secondCathetus*secondCathetus)

let trianglePerimeter = firstCathetus + secondCathetus + hypotenuse
let triangleArea = firstCathetus*secondCathetus / 2

print("В заданном треугольнике периметр = \(trianglePerimeter), площадь = \(triangleArea)")
