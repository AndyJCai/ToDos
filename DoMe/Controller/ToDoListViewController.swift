//
//  ViewController.swift
//  DoMe
//
//  Created by Andy Cai on 9/5/18.
//  Copyright © 2018 Andy Cai. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [ToDoListItem]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a new DoMe Item ☺️", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem = ToDoListItem(textField.text!)
            self.itemArray.append(newItem)
            self.saveItems()
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New ToDo Item"
            textField = alertTextField
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].itemInfo
        
        cell.accessoryType = itemArray[indexPath.row].isChecked ? .checkmark : .none
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        //MARK - finish item array add checkmark using .isChecked
        item.isChecked = !item.isChecked
        saveItems()
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        }
        catch {
            print("Error encoding itemArray, \(error)")
        }
    }
    
    func loadItems() {
        let decoder = PropertyListDecoder()
        do {
            let data = try? Data(contentsOf: dataFilePath!)
            itemArray = try decoder.decode([ToDoListItem].self, from: data!)
        }
        catch {
            print("Error encoding itemArray, \(error)")
        }
    }
    
}

