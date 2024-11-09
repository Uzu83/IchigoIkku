//
//  HaikuCell.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//
//

import SwiftUI


struct HaikuCell: View {
    var haiku: String = "かきくへば\nかねがなるなり\nほうりゅうじ"
    
    var body: some View {
        ZStack{
            Rectangle()//俳句のカードの背景
                .aspectRatio(1 / sqrt(2), contentMode: .fit)
                .frame(width: 350 ,alignment: .center)
                .foregroundColor(.red.opacity(0.03)) // 背景色を指定
                .cornerRadius(20) // 角丸にする
                .border(.green, width: 2) // 枠線をつける
                .padding(10)
                .shadow(radius: 5) // 影をつける
                
            
            //Set it to the center of the screen
            
            HStack(alignment: .top, spacing: 49) {
                ForEach(haiku.split(separator: "\n").reversed(), id: \.self) { line in
                    VStack(spacing: 10) {
                        ForEach(Array(line), id: \.self) { char in
                            Text(String(char))
                                .font(.system(size: 40, weight: .regular, design: .serif))
                                
                        }
                    }
                }
            }
        }
    }
}






//入力されたテキストを縦書きにして返す


#Preview {
    HaikuCell()
}
