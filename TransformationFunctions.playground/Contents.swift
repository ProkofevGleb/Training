import UIKit

// Функции высшего порядка — это функции, которые принимают другие функции в качестве аргументов или возвращают их в качестве результата.

// MARK: - Transformation Functions

// MARK: - map
// позволяет преобразовывать элементы массива, словаря или другого типа коллекции, применяя к каждому элементу заданное замыкание и возвращая новый массив.

// синтаксис
// func map<T>(_ transform: (Element) -> T) -> [T]

// Element — тип элементов исходной коллекции.
// T — тип элементов новой коллекции.
// transform — замыкание, которое принимает элемент исходной коллекции и возвращает преобразованный элемент.

// вопрос по синтаксису: что такое здесь - map<T>

// пример
let numbers = [1, 2, 3, 4]
let squares = numbers.map { $0 * $0 }
print(squares)

// Напишите программу, которая принимает массив температур в градусах Цельсия и преобразует их в градусы Фаренгейта. Используйте функцию map для выполнения преобразования.

let celsiusTemperatures = [0, 20, 37, 100]
let fahrenheitTemperatures = celsiusTemperatures.map { $0 * 9 / 5 + 32 }
print(fahrenheitTemperatures)

// MARK: - compactMap
// позволяет обрабатывать коллекции, удаляя значения nil (null) из результата преобразования.

// пример
let stringNumbers = ["1", "2", "three", "4", "5"]
let validNumbers = stringNumbers.compactMap { Int($0) }
print(validNumbers) // [1, 2, 4, 5]

// у вас есть массив словарей, представляющих пользователей. Каждый словарь содержит имя и возраст пользователя. Ваша задача — создать новый массив, который будет содержать только имена пользователей, чей возраст является допустимым целым числом (например, больше 0) и преобразовать возраст в целое число.

let users: [[String: String]] = [
    ["name": "Alice", "age": "30"],
    ["name": "Bob", "age": "invalid"],
    ["name": "Charlie", "age": "-5"],
    ["name": "David", "age": "25"],
    ["name": "Eve", "age": "twenty"]
]

let validUserNames = users.compactMap { user -> String? in
    if let ageString = user["age"], let age = Int(ageString), age > 0 {
        return user["name"]
    }
    return nil
}

print("Пользователи с допустимым возрастом: \(validUserNames)")

// MARK: - flatMap
// Flattens a collection of collections.
// Применяется для преобразования элементов коллекции, возвращая одномерный массив, который "разворачивает" вложенные структуры.
// Принимает замыкание (closure) и применяет его к каждому элементу коллекции. В результате получается новая коллекция, состоящая из всех элементов, которые были возвращены из замыкания, но без вложенности.
// Это делает его особенно полезным для работы с массивами, содержащими другие массивы или опциональные значения.

// пример
let numbers1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let result = numbers1.flatMap { $0 }
print(result) // [1, 2, 3, 4, 5, 6, 7, 8, 9]

// у вас есть массив студентов, каждый из которых имеет имя и список оценок. Вам нужно создать одномерный массив, содержащий все оценки всех студентов.

struct Student {
    let name: String
    let grades: [Int]
}

let students = [
    Student(name: "Alice", grades: [90, 85, 88]),
    Student(name: "Bob", grades: []),
    Student(name: "Charlie", grades: [95, 100, 92])
]

let resultNum = students.flatMap { $0.grades }
print(resultNum)



