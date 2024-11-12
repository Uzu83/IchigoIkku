//
//  HaikuCard.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//
//

import SwiftUI
import SwiftData



struct HaikuCard: View {
    var haikutext: String
    var size: CGFloat
    
    var body: some View {
        ZStack{
            Rectangle()//俳句のカードの背景
                .aspectRatio(1 / sqrt(2), contentMode: .fit)
                .frame(width: size,alignment: .center)
                .foregroundColor(.red.opacity(0.03)) // 背景色を指定
                .cornerRadius(size * 0.057) // 角丸にする
                .border(.green, width: size * 0.0057) // 枠線をつける
                .padding(size * 0.029)
                .shadow(radius: size * 0.014) // 影をつける
                
            
            //Set it to the center of the screen
            
            HStack(alignment: .top, spacing: size * 0.14) {
                ForEach(haikutext.split(separator: "\n").reversed(), id: \.self) { line in
                    VStack(spacing: size * 0.029) {
                        ForEach(Array(line), id: \.self) { char in
                            Text(String(char))
                                .font(.system(size: size * 0.114, weight: .regular, design: .serif))
                                
                        }
                    }
                }
            }
        }
    }
}






//入力されたテキストを縦書きにして返す


#Preview {
    HaikuCard(haikutext:"かきくへば\nしるもしらぬも\nあじさいい", size: 350)
}
