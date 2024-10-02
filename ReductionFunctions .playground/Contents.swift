import UIKit

let numbers = [1, 2, 3, 4, 5]

// Функция reduce в Swift — это метод, который позволяет комбинировать все элементы коллекции (например, массива) в одно значение. Этот метод принимает начальное значение и замыкание, которое определяет, как элементы будут объединяться.
// initialValue: начальное значение для аккумулятора.
// accumulator: текущее значение, которое обновляется на каждой итерации.
// element: текущий элемент из коллекции.

// let result = collection.reduce(initialValue) { (accumulator, element) in Логика объединения }

// Суммирование чисел
let sum = numbers.reduce(0) { $0 + $1 }
print(sum)

// Поиск максимального значения
let maxValue = numbers.reduce(numbers[0]) { max($0, $1) }
print(maxValue)


// Группировка слов по первой букве reduce(into:)
let words = ["apple", "banana", "cherry", "date", "elderberry"]
let groupedWords = words.reduce(into: [Character: [String]]()) { (result, word) in
    let firstLetter = word.first!
    result[firstLetter, default: []].append(word)
}
print(groupedWords)
// В этом примере reduce(into:) используется для создания словаря, где ключами являются первые буквы слов.
