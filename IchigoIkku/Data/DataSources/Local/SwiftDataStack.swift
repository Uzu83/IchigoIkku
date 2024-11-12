//
//  CoreDataStack.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//  
//

import SwiftUI
import SwiftData

@Model
class  ComposedHaiku{
    var text: String
       
       init(text: String) {
           self.text = text
       }
}
