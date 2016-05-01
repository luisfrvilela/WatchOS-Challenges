//
//  InterfaceController.swift
//  DesafioSectionTable WatchKit Extension
//
//  Created by Luís Resende on 17/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation

internal let jsonFile  = "https://api.myjson.com/bins/2nqw7"

class InterfaceController: WKInterfaceController {

    var arrayProducts:NSMutableArray!
    var arraySections:Array<String>!
    var dictionaryProducts:NSMutableDictionary!
    
    @IBOutlet var tableInformation: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            let dictionary = iOSRequest.getAllProductsAndSections(jsonFile)
            
            self.dictionaryProducts = NSMutableDictionary()
            self.arraySections = dictionary.objectForKey("sections") as! Array<String>
            self.arrayProducts = dictionary.objectForKey("products") as! NSMutableArray
            
            //Popular dicionario
            for itemSection in self.arraySections.enumerate(){
                let arrayProductsInSection:NSMutableArray! = NSMutableArray()
                for product in self.arrayProducts.enumerate(){
                    let stringProduct:ModelJSON = product.element as! ModelJSON
                    if stringProduct.category == itemSection.element{
                        if let _ = stringProduct.product{
                            arrayProductsInSection.addObject(stringProduct)
                        }
                        
                    }
                }
                self.dictionaryProducts.setObject(arrayProductsInSection, forKey: itemSection.element as String)
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                //Variaveis para pegar o index dos elementos
                let headerIndexes:NSMutableIndexSet = NSMutableIndexSet()
                var arrayRowsIndexes:Array<NSIndexSet> = Array<NSIndexSet>()
                
                //Prencher os tipos da table
                for itemSection in self.arraySections.enumerate(){
                    
                    let rows = self.tableInformation.numberOfRows
                    let headerIndex = NSIndexSet(index: rows)
                    headerIndexes.addIndexes(headerIndex)
                    self.tableInformation.insertRowsAtIndexes(headerIndex, withRowType:"section")
                    
                    let arrayProductsThisSection = self.dictionaryProducts.objectForKey(itemSection.element) as! NSMutableArray
                    
                    let rowsRange = NSRange(location: rows+1, length:arrayProductsThisSection.count)
                    let itemRows = NSIndexSet(indexesInRange: rowsRange)
                    arrayRowsIndexes.append(itemRows)
                    self.tableInformation.insertRowsAtIndexes(itemRows, withRowType: "row")
                }
                
                //Populando as sections
                for (indexArray,indexTable) in headerIndexes.enumerate(){
                    let section = self.tableInformation.rowControllerAtIndex(indexTable) as! SectionController
                    let nameSection = self.arraySections[indexArray] as String
                    section.labelName.setText(nameSection)
                    section.image.setImage(UIImage(named:nameSection))
                    //Populando as rows
                    let arrayProductsThisSection = self.dictionaryProducts.objectForKey(nameSection) as! NSMutableArray
                    
                    for (indexArrayProduct,indexTableRow) in arrayRowsIndexes[indexArray].enumerate(){
                        let row = self.tableInformation.rowControllerAtIndex(indexTableRow) as! RowController
                        row.labelName.setText("\(arrayProductsThisSection[indexArrayProduct].product)")
                        row.product = arrayProductsThisSection[indexArrayProduct] as! ModelJSON
                    }
                }
            })
            
        }
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        if segueIdentifier == "callDetail"{
            
            let row = self.tableInformation.rowControllerAtIndex(rowIndex) as! RowController
            
            return row.product
            
        }
        
        return nil
    }

}
