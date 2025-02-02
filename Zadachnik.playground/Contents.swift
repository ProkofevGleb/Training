import UIKit

//1) Напишите переменные и константы всех базовых типов данных: int, UInt, float, double, string.
//У чисел вывести их минимальные и максимальные значения.

// тип переменных и констант можно задавать явно или неявно
var num1: Int = 5
var num2 = 8


var num3: UInt = 83

// Float 32 бит, 6 знаков после запятой, используют для экономии памяти.
let temp: Float = 4.8

// Double 64 бит, 15 знаков после запятой, используют по умолчанию для более точных вычислений и рекомендует Apple.
var num4: Double = 5.0

let word: String = "курица, не яйцо"

let minInt8 = Int8.min  // -128
let maxInt8 = Int8.max  // 127

print(type(of: num3))

// 2) Создайте список товаров с различными характеристиками (количество, название).
// Используйте typealias.
//  позволяет создавать псевдонимы для существующих типов данных, что делает код более читаемым и удобным для восприятия.

struct Product {
    let name: String
    let quantity: Int
}

typealias ProductList = [Product]

let products: ProductList = [
    Product(name: "Яблоки", quantity: 10),
    Product(name: "Бананы", quantity: 5),
    Product(name: "Апельсины", quantity: 8),
    Product(name: "Груши", quantity: 12)
]

for product in products {
    print("Название продукта: \(product.name), Кол-во: \(product.quantity)")
}

// 3)Напишите различные выражения с приведением типа.
// приведение типов — это механизм, который позволяет работать с объектами разных типов в рамках одной иерархии классов или преобразовывать значения между различными типами. Приведение типов осуществляется с помощью операторов is, as, as? и as!.

// Оператор is позволяет проверить, является ли объект экземпляром определенного класса или структуры.

let animal: Animal = Dog()

if animal is Dog {
    print("Это собака.")
} else {
    print("Это не собака.")
}

// Оператор as? используется для безопасного приведения типов, возвращая nil, если приведение не удалось.
class Animal {}
class Dog: Animal {
    func bark() {
        print("Woof!")
    }
}

let anotherAnimal: Animal = Dog()

if let dog = anotherAnimal as? Dog {
    dog.bark() // Вывод: Woof!
} else {
    print("Это не собака.")
}

// Оператор as! используется для принудительного приведения типов. Если приведение не удастся, программа завершится с ошибкой.

let someAnimal: Animal = Dog()

let dog = someAnimal as! Dog // Принудительное приведение
dog.bark() // Вывод: Woof!

// Вы можете использовать приведение типов в коллекциях, чтобы работать с элементами различных типов:

let items: [Any] = [1, "Hello", 3.14, Dog()]

for item in items {
    if let number = item as? Int {
        print("Целое число: \(number)")
    } else if let text = item as? String {
        print("Строка: \(text)")
    } else if let dog = item as? Dog {
        dog.bark() // Вывод: Woof!
    }
}

// Вычисления с операторами (умножение, деление, сложение, вычитание): создайте консольный калькулятор.
// Результат вычислений должен быть похож на: «3 + 2 = 5».

// Функция для выполнения вычислений
func calculate(_ a: Double, _ b: Double, operation: String) -> Double? {
    switch operation {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        return b != 0 ? a / b : nil // Проверка на деление на ноль
    default:
        return nil
    }
}

// Основная программа
print("Введите первое число:")
guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
    print("Некорректный ввод числа.")
    exit(1)
}

print("Введите второе число:")
guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
    print("Некорректный ввод числа.")
    exit(1)
}

print("Введите операцию (+, -, *, /):")
guard let operation = readLine() else {
    print("Некорректный ввод операции.")
    exit(1)
}

// Выполнение вычислений
if let result = calculate(firstNumber, secondNumber, operation: operation) {
    print("\(firstNumber) \(operation) \(secondNumber) = \(result)")
} else {
    print("Ошибка: некорректная операция или деление на ноль.")
}

