//
//  HaikuListView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/14
//  
//

import SwiftUI
import SwiftData

struct HaikuListView: View {
    @Query var haikus :[ComposedHaiku]
    
    var body: some View {
        List(haikus){ haiku in
            Text(haiku.text)
        }
    }
}

#Preview {
    HaikuListView()
}
