//
//  Searches+CoreDataProperties.swift
//  
//
//  Created by abhay mone on 4/22/18.
//
//

import Foundation
import CoreData


extension Searches {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Searches> {
        return NSFetchRequest<Searches>(entityName: "Searches")
    }

    @NSManaged public var foodItem: String?

}
