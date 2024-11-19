//
//  IchigoIkkuApp.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//
//

import SwiftUI

@main
struct IchigoIkkuApp: App {
    var body: some Scene {
        WindowGroup {
            HaikuCreationView()
                .modelContainer(for: ComposedHaiku.self) // ここが重要！
        }
        
    }
}
