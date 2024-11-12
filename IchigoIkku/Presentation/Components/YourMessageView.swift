//
//  TalkingView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/11
//
//

import SwiftUI
import SwiftData

struct YourMessageView: View {
    var body: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width:60)
            ZStack{
                Text("Your Haiku is Wonderful!!\nAmazing")
                    .font(.system(size: 25, weight: .regular, design: .serif))
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(10)
            }
        }
    }
}

/*if me {
    Image on your right
    Text(from TextField)
 else{
    Image on your left
    Text(from Server)
    }
 */
#Preview {
    YourMessageView()
}
