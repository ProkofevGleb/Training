import UIKit

// Automatic Reference Counting (ARC) — это механизм управления памятью в Swift, который автоматически отслеживает и управляет выделением и освобождением памяти для экземпляров классов. ARC помогает предотвратить утечки памяти, обеспечивая, чтобы память освобождалась, когда объекты больше не нужны.

// Когда вы создаете экземпляр класса в Swift, ARC выделяет память для этого экземпляра и устанавливает его счетчик ссылок (reference count) на 1. Этот счетчик увеличивается каждый раз, когда другой объект создает ссылку на этот экземпляр, и уменьшается, когда ссылка удаляется. Когда счетчик ссылок достигает нуля, память, используемая экземпляром, автоматически освобождается.

// Пример сильной ссылки:

class Owner {
    var pet: Pet?
}

class Pet {
    var owner: Owner?
}

var owner: Owner? = Owner()
var pet: Pet? = Pet()

owner?.pet = pet
pet?.owner = owner // Здесь создается цикл ссылок.

// Пример слабой ссылки:

class Owner2 {
    weak var pet2: Pet2?
}

class Pet2 {
    var owner2: Owner2?
}

var owner2: Owner2? = Owner2()
var pet2: Pet2? = Pet2()

owner2?.pet2 = pet2
pet2?.owner2 = owner2 // Цикл ссылок устранен.

// Пример замыкания со слабой ссылкой:
// замыкание захватывает self как слабую ссылку, что позволяет ARC освобождать память при необходимости.

class HTMLElement {
    let name: String
    lazy var asHTML: () -> String = { [weak self] in
        guard let self = self else { return "" }
        return "<\(self.name)>Hello World</\(self.name)>"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

//Задача: Управление питомцами
//Описание
//Создайте две сущности: Owner (владелец) и Pet (питомец). Владелец должен иметь возможность иметь питомца, а питомец должен иметь возможность ссылаться на своего владельца. Используйте ARC для управления памятью и убедитесь, что вы избегаете циклов ссылок.

class Owner3 {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Pet3 {
    var name: String
    weak var owner: Owner? // Используем слабую ссылку
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

// Создаем экземпляры Owner и Pet
var owner3: Owner3? = Owner3(name: "Gleb")
var pet3: Pet3? = Pet3(name: "Barsik")

// Устанавливаем взаимные ссылки
owner3?.pet = pet
pet3?.owner = owner

// Проверяем, что ссылки работают
print("\(owner3?.name ?? "") has a pet named \(pet3?.name ?? "")")

// Устанавливаем ссылки в nil, чтобы проверить освобождение памяти
owner3 = nil
pet3 = nil

// Ожидаем, что деструкторы будут вызваны

// Задача

//Избежание циклов ссылок
//Описание: Создайте два класса: Parent и Child. Каждый объект Child должен иметь слабую ссылку на своего родителя. Проверьте, что при установке родителя в nil, объекты корректно освобождаются.

class Parent {
    var name: String
    var children: [Child] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addChild(name: String) {
        let child = Child(name: name, parent: self)
        children.append(child)
    }
    
    deinit {
        print("Parent \(name) is being deinitialized")
    }
}

class Child {
    var name: String
    weak var parent: Parent? // Слабая ссылка на родителя
    
    init(name: String, parent: Parent) {
        self.name = name
        self.parent = parent
    }
    
    deinit {
        print("Child \(name) is being deinitialized")
    }
}

// Создаем экземпляр класса Parent
var parent: Parent? = Parent(name: "Sandy")

// Добавляем детей к родителю
parent!.addChild(name: "Patrick")
parent!.addChild(name: "Emily")
parent!.addChild(name: "Joanna")

// Устанавливаем родителя в nil, чтобы проверить освобождение памяти
parent = nil

// Ожидаем, что деструкторы будут вызваны


// test
// test

// test
