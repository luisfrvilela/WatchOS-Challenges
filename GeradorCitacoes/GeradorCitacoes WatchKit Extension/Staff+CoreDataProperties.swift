//
//  Staff+CoreDataProperties.swift
//  GeradorCitacoes
//
//  Created by Luís Resende on 12/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Staff {

    @NSManaged var staff: String?
    
    // Insert code here to add functionality to your managed object subclass
    
    class func saveObjectData(stringStaff :String!){
        
        if let stringStaff : String = stringStaff{
            
            let newStaff = NSEntityDescription.insertNewObjectForEntityForName("Staff", inManagedObjectContext: Staff.returnContext()!) as! Staff
            newStaff.staff = stringStaff
            Staff.saveContext()
        }
        
    }
    
    static func showAllObjects()->[String]?{
        let fetchRequest = NSFetchRequest(entityName: "Staff")
        
        do{
            
            let results = try Staff.returnContext()!.executeFetchRequest(fetchRequest) as! [Staff]
            
            var staffsStrings: [String] = []
            
            for staffStored: Staff in results{
                
                staffsStrings.append(staffStored.staff!)
            }
            
            return staffsStrings
            
        }catch let error as NSError{
            print("Nao foi possivel carregar \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
}
