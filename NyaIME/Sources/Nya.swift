//
//  Nya.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/08.
//

struct Nya {
    let hiraganaZenkaku: String
    let katakanaZenkaku: String
    let katakanaHankaku: String
}

func toNya(_ text: String) -> Nya {
    let hiraganaZenkaku = text.enumerated().map { (i, char) in
        switch true {
        case "あお".contains(char):
            if i > 0 {
                return String(char)
            } else {
                return "にゃ"
            }
        case "うえかくけこがぐげごさすせそざずぜぞたつてとだづでどなぬねのはふへほばぶべぼぱぷぺぽまむめもやゆよらるれろわゎを".contains(char):
            return "にゃ"
        case "いきぎしじちぢにひびぴみり".contains(char):
            return "に"
        case "んぁぃぅぇぉっ".contains(char):
            return String(char)
        case "ゃゅょ".contains(char):
            if i > 0 {
                let prev = text[text.index(text.startIndex, offsetBy: i - 1)]
                if "きぎしじちぢにひびぴみり".contains(prev) {
                    return "ゃ"
                }
            }
            return "にゃ"
        default:
            return String(char)
        }
    }.joined()

    let katakanaZenkaku = hiraganaZenkaku.applyingTransform(.hiraganaToKatakana, reverse: false)!
    let katakanaHankaku = katakanaZenkaku.applyingTransform(.fullwidthToHalfwidth, reverse: false)!

    return Nya(
        hiraganaZenkaku: hiraganaZenkaku,
        katakanaZenkaku: katakanaZenkaku,
        katakanaHankaku: katakanaHankaku
    )
}
