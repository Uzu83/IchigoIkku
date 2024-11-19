//
//  Haiku.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/09
//  
//

import SwiftUI
import SwiftData

struct HaikuManager {
    @Environment(\.modelContext) private var context
    
    func saveHaiku(_ haikuText: String) {
        // 新しい俳句を保存
        let newHaiku = ComposedHaiku(text: haikuText)
        context.insert(newHaiku)
        
        // 古い俳句を削除
        deleteOldestHaikuIfNeeded()
        
        // 変更を保存
        try? context.save()
    }
    
    private func deleteOldestHaikuIfNeeded() {
        // 現在保存されている俳句の数を取得
        let fetchDescriptor = FetchDescriptor<ComposedHaiku>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        let haikus = try? context.fetch(fetchDescriptor)
        
        // 俳句の数が10を超えている場合、最も古い俳句を削除
        if let haikus = haikus, haikus.count > 10 {
            let oldestHaiku = haikus[0]
            context.delete(oldestHaiku)
        }
    }
}
