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
            HaikuCreationView()
                .tabItem {
                Label("詠む", systemImage: "pencil")
                }
            HaikuListView()
                .tabItem {
                    Label("句集", systemImage: "list.bullet")
                }
            
        }
    }
}



#Preview {
    ContentView()
}
