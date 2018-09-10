//
//  ToDoListItem.swift
//  DoMe
//
//  Created by Andy Cai on 9/8/18.
//  Copyright © 2018 Andy Cai. All rights reserved.
//

import Foundation

class ToDoListItem : Codable {
    
    
    
    var itemInfo : String = ""
    var isChecked : Bool = false
    
    init () {
        
    }
    
    convenience init(_ info : String) {
        self.init()
        self.itemInfo = info
    }
    
    convenience init(_ info : String, _ checked : Bool) {
        self.init()
        self.itemInfo = info
        self.isChecked = checked
    }
    
//    required convenience init?(coder aDecoder: NSCoder) {
//        let info = aDecoder.decodeObject(forKey: "itemInfo") as! String
//        let checked = aDecoder.decodeBool(forKey: "isChecked")
//        self.init(info, checked)
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(itemInfo, forKey: "itemInfo")
//        aCoder.encode(isChecked, forKey: "isChecked")
//    }
}

