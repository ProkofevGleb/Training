//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Глеб on 24.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let headers = ["Fruits", "Vegetables"]
    
    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.sectionHeaderHeight = 32
        
        // указываем связи для таблицы через код, если не использовать сториборды
        // tableView.dataSource = self
        // tableView.delegate = self
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section] // получили массив по номеру секции
        return vegOrFruitArray.count         // вернули количество элементов в нём
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell                                                   // 1
            
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") { // 2
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")        // 3
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    // Здесь будут наши методы dataSource
}

extension ViewController: UITableViewDelegate {
    // тут располагаются методы делегата
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: nil,
                                      message: "Вы нажали на: \(words[indexPath.section][indexPath.row])",
                                      preferredStyle: .alert)                         // 1
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in             // 2
            tableView.deselectRow(at: indexPath, animated: true)
            alert.dismiss(animated: true)                                             // 3
        }
        alert.addAction(okAction)                                                     // 4
        present(alert, animated: true)                                                // 5
    }
}

