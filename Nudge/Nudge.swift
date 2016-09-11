//
//  Nudge.swift
//  Nudge
//
//  Created by Gregory Hanson on 9/8/16.
//  Copyright © 2016 Hyper Elephant. All rights reserved.
//

import UIKit

class Nudge: NSObject, NSCoding {
    
    var name: String
    
    //Designated initializer
    init?(name: String){
        
        //Required Properties, don't create a new nudge if these don't exist
        if !name.isEmpty {
            
            //Initialize properties
            self.name = name
            
            super.init()
            
        } else {
            
            //If required properties don't exist, don't create a new nudge
            return nil
            
        }
    }
    
    struct PropertyKey {
        static let nameKey = "name"
    }
    
    //MARK: Archiving Paths
    //Ouside of Nudge, access path using Nudge.ArchiveURL.path!
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("nudges")
    
    //MARK: NSCoding, functions used to encode and decode from stored data
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        //Convenience initializer must call designated initializer
        self.init(name: name)
        
    }

}
