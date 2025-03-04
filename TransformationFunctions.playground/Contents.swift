import UIKit

// Функции высшего порядка — это функции, которые принимают другие функции в качестве аргументов или возвращают их в качестве результата.

// Главное о замыканиях:
// Это как функции, но без имени.
// Их можно сохранить в переменную или передать в другую функцию.
// Они могут захватывать значения из своего окружения.

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

// MARK: - mapValues
// Transforms the values of a dictionary.
// Функция возвращает новый словарь, содержащий те же ключи, что и исходный словарь, но с новыми значениями, полученными в результате применения замыкания к каждому из старых значений

// пример
var multiply = ["first": 1, "second": 2, "third": 3]
let resultVal = multiply.mapValues({ $0 * 2 })
print(resultVal) // Вывод: ["first": 2, "second": 4, "third": 6]

// предположим, у вас есть словарь, который хранит имена студентов и их оценки по предмету. Ваша задача — создать новый словарь, в котором оценки будут увеличены на 5 баллов. Однако, если оценка превышает 100, она должна быть обрезана до 100.

var grades = [
    "Alice": 88,
    "Bob": 95,
    "Charlie": 78,
    "Diana": 99
]

// конструкция grade in используется в замыканиях для определения параметров, которые передаются в замыкание.
// grade — это имя параметра, который будет представлять значение, переданное в замыкание (в данном случае это оценка студента).
// in — ключевое слово, которое отделяет список параметров от тела замыкания. Оно указывает на то, что после этого слова начинается код, который будет выполнен при вызове замыкания.

let updatedGrades = grades.mapValues { grade in
    let newGrade = grade + 5
    // Проверяем, превышает ли новая оценка 100
    if newGrade > 100 {
        return 100
    } else {
        return newGrade
    }
}

print(updatedGrades)

//Функция min в Swift используется для определения наименьшего значения из двух или более значений. Она может принимать два или более аргументов и возвращает наименьший из них.

let updatedGrades2 = grades.mapValues { min($0 + 5, 100) }

// задача
//

let gradesNew: [Any?] = [85, nil, "A", 92, 78, "B", 88]

// Ваша задача — создать новый массив, который будет содержать только действительные оценки, преобразованные в десятичные числа (например, из целых в дробные), и отсортированные по возрастанию.

//let finalGrades = gradesNew.compactMap { grade -> Int? in
//    if let myGrade = grade, let number = Int(myGrade) {
//        return grade
//    }
//    return nil
//}

//let validUserNames = users.compactMap { user -> String? in
//    if let ageString = user["age"], let age = Int(ageString), age > 0 {
//        return user["name"]
//    }grade
//    return nil
//}

// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
// test
