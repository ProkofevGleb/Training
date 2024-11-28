import UIKit


import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Closures в Swift представляют собой самодостаточные блоки функциональности, которые можно передавать и использовать в коде. Они аналогичны лямбдам в других языках программирования и обеспечивают гибкий способ работы с функциями.

// Closure — это блок кода, который может захватывать и сохранять ссылки на переменные и константы из контекста, в котором он был определён.
//  Это называется "замыканием" (capturing). В Swift существует три основных типа замыканий:

// 1. Глобальные функции: имеют имя и не захватывают значения.
// 2. Вложенные функции: имеют имя и могут захватывать значения из внешней функции.
// 3. Closure-выражения: безымянные замыкания, написанные в компактном синтаксисе.

// 1

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

let result = multiply(a: 3, b: 4)
print(result)

// 2

func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    
    // Вложенная функция, которая захватывает переменные из родительской функции
    func incrementer() -> Int {
        total += incrementAmount
        return total
    }
    
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo())
print(incrementByTwo())

// 3

let numbers = [1, 2, 3, 4, 5]

// Использование замыкания для фильтрации четных чисел
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers) // Вывод: [2, 4]

// Замыкание для сложения двух чисел
let add: (Int, Int) -> Int = { $0 + $1 }
let sum = add(5, 3)
print(sum)

// Задачи:

//Создайте функцию, которая принимает массив целых чисел и два замыкания:
//Первое замыкание должно фильтровать числа (например, оставлять только четные).
//Второе замыкание должно преобразовывать отфильтрованные числа (например, умножать каждое число на 2).

func filterAndTransform(numbers: [Int], filter: (Int) -> Bool, transform: (Int) -> Int) -> [Int] {
    
    let filteredNumbers = numbers.filter(filter)
    
    let transformedNumbers = filteredNumbers.map(transform)
    
    return transformedNumbers
}

// Замыкание для фильтрации четных чисел
let isEven: (Int) -> Bool = { $0 % 2 == 0 }

// Замыкание для умножения на 2
let multiplyByTwo: (Int) -> Int = { $0 * 2 }

// Вызов функции
let resultTransform = filterAndTransform(numbers: numbers, filter: isEven, transform: multiplyByTwo)

print(resultTransform)

// test
// test
// test
// test
// test
// test
// test


