//
//  HaikuCreationView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//
//

import SwiftUI

struct HaikuCreationView: View {
    @State private var inputText = ""
    @State var composedHaiku = "かきくへば\nかねがなるなり\nほうりゅうじ" //
    
    var body: some View {
        NavigationStack {
            VStack{
                Image("SakuraPic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400) // サイズを指定
                
                HaikuCard(haikutext: composedHaiku,size: 150)
                    .padding(.bottom, 60)
                Text("各句を全角スペースで分けてください。")
                HStack {
                    TextField("下暗し　麓に生ゆる　すみれかな", text: $inputText)
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
                        .padding(20)
                    
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
                        HaikuAnalysisView(composedHaiku: $composedHaiku)
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
