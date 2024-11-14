//
//  ContentView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("句集", systemImage: "square.on.square"){
                HaikuListView()
            }
            Tab("作成", systemImage: "plus"){
                HaikuCreationView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
