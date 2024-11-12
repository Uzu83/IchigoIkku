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
    @Query var haikus: [ComposedHaiku]
    
    var body: some View {
        NavigationView{
            VStack {
                if !haikus.isEmpty {
                    
                    List(haikus){haiku in
                        HaikuCard(haikutext:haiku.text,size: 100)
                    }}else{
                        Text("俳句を提出してください")
                    }
                YourMessageView()
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
    HaikuAnalysisView()
}
