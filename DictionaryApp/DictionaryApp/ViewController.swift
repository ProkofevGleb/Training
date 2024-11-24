//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Глеб on 24.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let words = ["Apple", "Pear", "Watermelon", "Carrot", "Pickle", "Potato", "Tomato"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell                                                   // 1
            
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") { // 2
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")        // 3
        }
        
        cell.textLabel?.text = words[indexPath.row]                                 // 4
        
        return cell
    }
    
    // Здесь будут наши методы dataSource
}

