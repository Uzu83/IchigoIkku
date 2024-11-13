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
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HaikuCard(haikutext:composedHaiku, size: 200)
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
                        saveHaiku()
                        do{try deleteHaiku(context: context, limit: 10, sortKeyPath: \ComposedHaiku.createdAt)
                        }catch{
                            print("Error deleting haiku")
                        }
                        analyzeHaiku()
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
    
    private func saveHaiku() {
        //まずはSwiftDataに永続的に保存する
        let data = composedHaiku
        context.insert(ComposedHaiku(text: data))
        do{
            try context.save()
        }catch{
            print("Error saving haiku")
        }
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
    private func analyzeHaiku(){
    }
}

#Preview {
    HaikuAnalysisView(composedHaiku: .constant("かきくへば\nしるもしらぬも\nあじさいい"))
}
