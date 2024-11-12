//
//  HaikuAnalysisView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/11
//
//

import SwiftUI
import SwiftData

struct HaikuAnalysisView: View {
    @Query private var haikus: [Haiku]
    
    var body: some View {
        NavigationView{
            VStack {
                if let latestHaiku = haikus.last {
                    HaikuCard(haikutext: latestHaiku.text, size: 250)
                } else {
                    Text("俳句がありません")
                }
                YourMessageView()
            }
           
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HaikuAnalysisView()
}
