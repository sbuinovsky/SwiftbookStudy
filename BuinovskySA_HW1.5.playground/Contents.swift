import UIKit

//: # Home Work 5
/*:
 ## Задание 1
 Создайте словарь, который содержит результаты игр спортивной команды. Ключом словаря должно быть название команды соперника, а в качестве значения должен быть массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр.
 */

let gamesResults = [
    "Салават Юлаев": ["3:6", "5:5", "N/A"],
    "Авангард": ["2:1", "3:3", "1:2"],
    "Динамо": ["N/A", "1:0", "4:6"]
]

func gamesResultsPrint(results: [String : [String]]) {
    for (team, scores) in results {
        for score in scores {
            print("Игра с \(team) - \(score)")
        }
    }
}

gamesResultsPrint(results: gamesResults)

/*:
 ## Задание 2
 Создайте функцию, которая считает общую сумму переданных в нее целочисленных значений и возвращает итоговый результат. Числа можно передавать либо в массиве, либо по отдельности, на ваше усмотрение. Вызовите функцию.
 */

func summOfIntNumbers(_ numbers: Int...) -> Int {
    var summ = 0
    for number in numbers {
        summ += number
    }
    
    return summ
}

summOfIntNumbers(1, 2, 3, 4)


/*:
 ## Задание 3
 3.1 Создайте функцию, которая определяет является ли число четным. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`.
 */

func numberIsEven(_ number: Int) -> Bool {
    number % 2 == 0 ? true : false
}

numberIsEven(3)

/*:
3.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение.
*/

func numberIsDevideByThree(_ number: Int) -> Bool {
    number % 3 == 0 ? true : false
}

numberIsDevideByThree(9)

/*:
 3.3 Создайте функцию, которая возвращает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен задаваться при вызове функции при помощи параметров. Вы должны самостоятельно реализовать логику создания массива. Если хотите усложнить задание, то можете возвращать не сортированный массив чисел в заданном интервале. Главное, что бы числа были уникальными и не повторялись. При этом количество элементов массива должно соответствовать количеству элементов заданного интервала.
 */

func generateArrayFromRange(startValue: Int,
                            endValue: Int,
                            step: Int) -> [Int] {
    var stepValue = startValue
    var resultArray: [Int] = []
    while stepValue <= endValue {
        resultArray.append(stepValue)
        stepValue += step
    }

    return resultArray
}

func generateRandomArrayFromRange(startValue: Int,
                                  endValue: Int,
                                  quantity: Int) -> [Int] {
    var resultArray: [Int] = []
    while resultArray.count != quantity {
        let randomNumber = Int.random(in: startValue...endValue)
        if resultArray.contains(randomNumber) {
            continue
        }
        resultArray.append(randomNumber)
    }

    return resultArray
}

/*:
3.4 Создайте массив чисел от *1* до *100*, используя для этого выше созданную функцию
 */

let arrayOfNumbers = generateArrayFromRange(startValue: 1,
                                            endValue: 100,
                                            step: 2)

let arrayOfRandomNumbers = generateRandomArrayFromRange(startValue: 1,
                                                        endValue: 100,
                                                        quantity: 60)

/*:
 3.5 Создайте функцию для фильтрации переданного в неё массива и отфильтруйте при помощи неё массив из задания **3.4**. Функция должна возвращать новый массив без четных чисел или без чисел, кратных трем. Для определения фильтруемых значений используйте ранее созданные функции из заданий **3.1** и **3.2**.
 */

func filterArrayOfNumbers(_ array: [Int]) -> [Int] {
    var filteredArray: [Int] = []
    for item in array {
        if !numberIsEven(item) && !numberIsDevideByThree(item) {
            filteredArray.append(item)
        }
    }
    
    return filteredArray
}

print(filterArrayOfNumbers(arrayOfNumbers))
print(filterArrayOfNumbers(arrayOfRandomNumbers))


// Вариант с использованием замыкания просьба дать коммент стоило ли и насколько криво написано
func filterArrayOfNumbersClosure(_ array: [Int],
                                 closure: (Int) -> Bool) -> [Int] {
    var filteredArray: [Int] = []
    for item in array {
        if closure(item) {
            filteredArray.append(item)
        }
    }
    
    return filteredArray
}

filterArrayOfNumbersClosure(arrayOfRandomNumbers) {
    !numberIsEven($0) && !numberIsDevideByThree($0)
}

filterArrayOfNumbersClosure(arrayOfRandomNumbers) {
    !($0 % 2 == 0) && !($0 % 3 == 0)
}
