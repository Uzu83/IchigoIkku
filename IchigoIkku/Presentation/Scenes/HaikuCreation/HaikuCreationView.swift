//
//  HaikuCreationView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//
//

import SwiftUI
import SwiftData
import GoogleGenerativeAI



struct HaikuCreationView: View {
    let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "YOUR_API_KEY")
    @State private var inputText = ""
    @State var composedHaiku = "かきくへば\nかねがなるなり\nほうりゅうじ" //
    
    var body: some View {
        NavigationStack {
            VStack{
                Image("SakuraPic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 450) // サイズを指定
                
                HaikuCard(haikutext: composedHaiku,size: 150)
                    .padding(.bottom, 60)
                HStack {
                    TextField("全角スペースで分けてください", text: $inputText)
                    //Wanna add a filter to the textfield to only allow hiragana characters
                    //but difficult for me :( I will try to implement it later
                    /*.onChange(of: text) { newValue in
                     text = newValue.filter { char in
                     let scalars = String(char).unicodeScalars
                     return scalars.allSatisfy { scalar in
                     (0x3041...0x3096).contains(scalar.value) || scalar.value == 0x3099 || scalar.value == 0x309A
                     }
                     }
                     }*/
                        .padding(.bottom)
                    
                    Button(action: {
                        submitHaiku()
                        print("button pushed")
                    }){
                        Text("詠む")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                    NavigationLink{
                        HaikuAnalysisView(composeHaiku: $composedHaiku)
                    } label: {
                        Text("評価する")
                            .padding(.horizontal,8)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
    
    func submitHaiku(){
        let formattedHaiku = formatHaiku(inputText)
        composedHaiku = formattedHaiku
        inputText = ""
        
    }
    
    func formatHaiku(_ text: String) -> String{
        let formattedHaiku = text
            .replacingOccurrences(of: "　", with: "\n")
            .replacingOccurrences(of: "ー", with: "｜")
        
        return formattedHaiku
    }
    
    
}

#Preview {
    HaikuCreationView()
}
