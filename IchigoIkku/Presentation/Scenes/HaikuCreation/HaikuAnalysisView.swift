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
    @Binding var composeHaiku:String
    
    var body: some View {
        NavigationStack {
            VStack {
                HaikuCard(haikutext:composeHaiku, size: 200)
                Spacer()
                YourMessageView()
                Spacer()
                HStack{
                    Button(action: {
                        // ここで何かしらの処理を行う
                    }) {
                        NavigationLink{ HaikuCreationView()
                        }label:{
                            Text("やり直す")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }}
                    Button(action: {
                        // ここで何かしらの処理を行う
                    }) {
                        Text("俳句提出")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                        
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HaikuAnalysisView(composeHaiku: .constant("かきくへば\nしるもしらぬも\nあじさいい"))
}
