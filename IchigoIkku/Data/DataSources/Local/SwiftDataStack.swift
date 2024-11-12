//
//  CoreDataStack.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//  
//

import Foundation
import SwiftData

@Model
class  Haiku{
    var text: String
       
       init(text: String) {
           self.text = text
       }
}
