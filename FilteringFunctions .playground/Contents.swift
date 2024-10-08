import UIKit

var numbers = [1, 2, 3, 4, 5, 6]

// MARK: - Filtering Functions

// Функция filter позволяет отфильтровывать элементы на основе заданного условия. Она возвращает новый массив, содержащий только те элементы, которые удовлетворяют условию, определенному в замыкании (closure). Работает с массивами.

// array.filter { condition } condition: Замыкание, которое принимает элемент массива и возвращает Bool. Если замыкание возвращает true, элемент включается в результирующий массив; если false, он исключается.

let evenNumbers = numbers.filter { $0 % 2 == 0 } // проверка на четность
print(evenNumbers)

// Функция removeAll позволяет удалить все элементы, которые соответствуют заданному условию, определенному в замыкании (closure). Удаляет на месте, не создает новый массив. Работает со всеми типами коллекций.

// collection.removeAll(where: { condition }) "condition:" замыкание, которое возвращает true для элементов, которые нужно удалить. "where:" указывает на то, что вы передаете замыкание

numbers.removeAll { $0 % 2 == 0 } // удаляем все четные числа
print(numbers)

// Функция first(where:) позволяет находить первый элемент, удовлетворяющий заданному условию. Этот метод полезен для быстрого поиска элемента в массиве или другой коллекции, когда вам нужно определить, есть ли элемент, соответствующий определенному критерию.

// let element = collection.first(where: { condition })

if let firstEven = numbers.first(where: { $0 % 2 == 0 }) {
    print("Первое четное число: \(firstEven)")
} else {
    print("Четные числа не найдены.")
}

// Функция  lastIndex(where:) (другие языки last(where:)) используется для поиска индекса последнего элемента в массиве, который соответствует определенному предикату. Если ни один элемент не соответствует условию, метод возвращает nil.

// let index = array.lastIndex(where: { condition })

// Поиск последнего четного числа в массиве:

let lastNumbers = [2, 4, 6, 8, 10]
if let lastIndex = lastNumbers.lastIndex(where: { $0 > 5 }) {
    print(lastNumbers[lastIndex])
}

// Функция allSatisfy проверяет, удовлетворяют ли все элементы массива заданному условию. Если все элементы соответствуют условию, метод возвращает true; если хотя бы один элемент не удовлетворяет, возвращается false.

let result = numbers.allSatisfy { $0 > 5 }
print(result)

// тест
// тест
// тест
