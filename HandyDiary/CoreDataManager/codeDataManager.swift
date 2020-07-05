//
//  codeDataManager.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 13/04/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//

import Foundation
import CoreData

enum entityList{
    case diaryNotes
    
    func returnEntityName() -> String{
        switch self {
        case .diaryNotes:
            return "DiaryNotes"
        }
    }
}


struct CoreDataManager{
    
    
    public static var shared : CoreDataManager = CoreDataManager()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
      
      let container = NSPersistentContainer(name: "PersonData")
      
      
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
    
    func saveContext () {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges {
          do {
            try context.save()
          } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
        }
      }
    }
    
        private func insertInto<T>(entity : entityList, modelRefrence : T ){
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        
            switch entity {
            case .diaryNotes:
                
                let entity = NSEntityDescription.entity(forEntityName: entity.returnEntityName(),
                                                        in: managedContext)!
                let value = NSManagedObject(entity: entity,
                                                         insertInto: managedContext)
                guard let modelValue : ModelDiaryNote = modelRefrence as? ModelDiaryNote else{
                    print("Could not create object.")
                    return
                }
                
                value.setValue(modelValue.title, forKey: ModelDiaryNote.CodingKeys.title.rawValue)
                value.setValue(modelValue.diaryNote, forKey: ModelDiaryNote.CodingKeys.diaryNote.rawValue)
                value.setValue(modelValue.timestemp, forKey: ModelDiaryNote.CodingKeys.timestemp.rawValue )
               
            }
            
        
        
         
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
        

    }



