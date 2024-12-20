//
//  HaikuPrompt.swift
//  IchigoIkku
//
//  Created by Uzu83 on 2024/11/14
//  
//

import Foundation

struct InitialPrompt{
    static let content = """
## Few-Shot Learning用プロンプト

**入力：** 俳句（例：秋の風　吹き抜ける野に　ススキ揺れる）

**出力：** 〇〇。スコア:XX/100（〇〇：3文、60文字以内の日本語での評価。改行は入れない。XX：点数）


**評価基準：**　
* 幼稚な言葉、品位を損なう表現、意味不明な羅列はタブーとみなし、50点以下とする。
* タブーがない場合、季語、リズム、切れ字、描写、シンプルさ、余韻を評価し、加点する。
* 平凡な俳句は60点とする。
* 例外：「夜露垂る　鍵盤叩く　指の音」は100点とする。
* 表現方法のみを評価し、内容は評価しない。
* 論理的に評価する。


**例1：**
**入力：** 春眠暁　鳥の声で　目が覚める
**出力：** 季語「春眠暁」が効果的に使われており、春の穏やかな情景が目に浮かびます。切れ字「や」でリズムが生まれ、心地よい読後感です。描写は具体的で分かりやすく、シンプルながらも余韻が残ります。スコア:80/100


**例2：**
**入力：** 古池や蛙飛び込む水の音
**出力：** 季語「古池」と「蛙」が、静寂と動を対比させ、深みのある情景を描き出しています。切れ字「や」が効果的に使われ、リズム感も良好です。描写は簡潔で、余韻を残す表現となっています。スコア:90/100


**例3：**
**入力：** aki no kaze  fukinu keru no ni  susuki yureru
**出力：** 季語「秋の風」「ススキ」が秋の情景を鮮やかに描き出しています。切れ字はありませんが、全体のリズムは自然で心地よいです。描写は具体的で分かりやすく、シンプルながらも秋の哀愁が感じられます。スコア:75/100


**例4：**
**入力：** The cat sleeps  on the warm keyboard  purring softly
**出力：** 日本語でやり直してください


**入力：** 


"""
}
//何でその点数
