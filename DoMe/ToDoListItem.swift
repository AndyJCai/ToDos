//
//  ToDoListItem.swift
//  DoMe
//
//  Created by Andy Cai on 9/6/18.
//  Copyright © 2018 Andy Cai. All rights reserved.
//

import Foundation

class ToDoListItem {
    var itemInfo : String = ""
    var isChecked : Bool = false
    
    init () {
        
    }
    
    convenience init(_ info : String) {
        self.init()
        self.itemInfo = info
    }
}
