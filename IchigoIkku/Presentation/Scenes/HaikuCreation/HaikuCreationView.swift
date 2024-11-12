//
//  HaikuCreationView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//
//

import SwiftUI
import SwiftData



struct HaikuCreationView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var inputText = ""
    @State private var haikuText = "かきくへば\nかねがなるなり\nほうりゅうじ" //
    @State var isHaikuFinalized = false
    
    var body: some View {
        NavigationView {
            VStack{
                Image("SakuraPic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 450) // サイズを指定
                
                HaikuCard(haikutext: haikuText,size: 150)
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
                    VStack {
                        Button(action: {
                            submitHaiku()
                        }){
                            Text("詠む")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            sendHaikuToAI()
                        }) {
                            NavigationLink(destination: HaikuAnalysisView()) {
                                Text("評価")
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    
                }
            }
        }
    }
    func sendHaikuToAI(){
        let newHaiku = Haiku(text: haikuText)
        modelContext.insert(newHaiku)
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func submitHaiku(){
        let formattedHaiku = formatHaiku(inputText)
        haikuText = formattedHaiku
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
