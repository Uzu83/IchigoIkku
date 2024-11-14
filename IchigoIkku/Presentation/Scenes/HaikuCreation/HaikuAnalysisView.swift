//
//  HaikuAnalysisView.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/11
//
//

import SwiftUI
import SwiftData
import GoogleGenerativeAI

struct HaikuAnalysisView: View {
    @Binding var composedHaiku:String
    @Environment(\.modelContext) private var context
    @State private var response = "分析中です。しばらくお待ちください。"
    
    let model = GenerativeModel(
        name:"gemini-1.5-flash-8b",
        apiKey:APIKey.default
    )
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HaikuCard(haikutext:composedHaiku, size: 200)
                Spacer()
                YourMessageView(message: response)
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
                        do{try deleteHaiku(context: context, limit: 10, sortKeyPath: \ComposedHaiku.createdAt)
                        }catch{
                            print("Error deleting haiku")
                        }
                    }) {
                        NavigationLink{ HaikuCreationView()
                    }label:{
                        Text("保存する")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                        
                    }
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
            /*.onAppear{
                Task{
                    await analyzeHaiku()

                }
            }*/
    }
    
    private func saveHaiku() {
        //まずはSwiftDataに永続的に保存する
        let data = composedHaiku
        context.insert(ComposedHaiku(text: data))
    }
    
    private func deleteHaiku<T: ComposedHaiku>(
        context: ModelContext,
        limit: Int = 10,
        sortKeyPath: KeyPath<T, Date>
    )throws{
        // 1. データの総数を取得
        let totalCount = try context.fetchCount(FetchDescriptor<T>())
        
        // 2. 制限を超えているか確認
        if totalCount > limit {
            // 3. 削除する必要がある項目数を計算
            let deleteCount = totalCount - limit
            
            // 4. 日付でソートしたFetchDescriptorを作成
            var descriptor = FetchDescriptor<T>(
                sortBy: [SortDescriptor(sortKeyPath, order: .forward)]
            )
            descriptor.fetchLimit = deleteCount
            
            // 5. 最も古い項目を取得
            let oldestEntries = try context.fetch(descriptor)
            
            // 6. 古い項目を削除
            for entry in oldestEntries {
                context.delete(entry)
            }
            
            // 7. 変更を保存
            try context.save()
            
        }
    }
    private func analyzeHaiku() async{
        let initialPrompt = InitialPrompt.content
        let prompt = initialPrompt + composedHaiku
        do{
            let generatedResponse = try await model.generateContent(prompt)
            response = generatedResponse.text ?? "分析結果を取得できませんでした。"
        }catch{
            response = "分析に失敗しました。"
        }
    }
}



#Preview {
    HaikuAnalysisView(composedHaiku: .constant("かきくへば\nしるもしらぬも\nあじさいい"))
}
