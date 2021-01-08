//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Gustavo Anjos on 08/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Pegar todos os dados do BD
    func getAllItems(){
        do{
            let items = try context.fetch(ToDoListItem.fetchRequest())
        }catch{
            // error
        }
    }
    
    // Criar um novo item
    func createItem(name: String){
        
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do{
            try context.save()
        }catch{
            
        }
        
    }
    
    func deleteItem(item: ToDoListItem){
        
        context.delete(item)
        
        do{
            try context.save()
        }catch{
            
        }
        
    }
    
    func updateItem(item: ToDoListItem, newName: String){
        item.name = newName
        
        do{
            try context.save()
        }catch{
            
        }
    }


}

