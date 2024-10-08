//
//  ComposingText.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/07.
//

let composingTextmap: [String: String] = [
    // a
    "a": "あ", "i": "い", "u": "う", "e": "え", "o": "お",
    // b
    "bb": "っb",
    "ba": "ば", "bi": "び", "bu": "ぶ", "be": "べ", "bo": "ぼ",
    "bya": "びゃ", "byi": "びぃ", "byu": "びゅ", "bye": "びぇ", "byo": "びょ",
    // c
    "cc": "っc",
    "cha": "ちゃ", "chi": "ち", "chu": "ちゅ", "che": "ちぇ", "cho": "ちょ",
    "cya": "ちゃ", "cyi": "ちぃ", "cyu": "ちゅ", "cye": "ちぇ", "cyo": "ちょ",
    // d
    "dd": "っd",
    "da": "だ", "di": "ぢ", "du": "づ", "de": "で", "do": "ど",
    "dha": "でゃ", "dhi": "でぃ", "dhu": "でゅ", "dhe": "でぇ", "dho": "でょ",
    "dya": "ぢゃ", "dyi": "ぢぃ", "dyu": "ぢゅ", "dye": "ぢぇ", "dyo": "ぢょ",
    // f
    "ff": "っf",
    "fa": "ふぁ", "fi": "ふぃ", "fu": "ふ", "fe": "ふぇ", "fo": "ふぉ",
    "fya": "ふゃ", "fyi": "ふぃ", "fyu": "ふゅ", "fye": "ふぇ", "fyo": "ふょ",
    // g
    "gg": "っg",
    "ga": "が", "gi": "ぎ", "gu": "ぐ", "ge": "げ", "go": "ご",
    "gya": "ぎゃ", "gyi": "ぎぃ", "gyu": "ぎゅ", "gye": "ぎぇ", "gyo": "ぎょ",
    // h
    "hh": "っh",
    "ha": "は", "hi": "ひ", "hu": "ふ", "he": "へ", "ho": "ほ",
    "hya": "ひゃ", "hyi": "ひぃ", "hyu": "ひゅ", "hye": "ひぇ", "hyo": "ひょ",
    // j
    "jj": "っj",
    "ja": "じゃ", "ji": "じ", "ju": "じゅ", "je": "じぇ", "jo": "じょ",
    "jya": "じゃ", "jyi": "じぃ", "jyu": "じゅ", "jye": "じぇ", "jyo": "じょ",
    // k
    "kk": "っk",
    "ka": "か", "ki": "き", "ku": "く", "ke": "け", "ko": "こ",
    "kya": "きゃ", "kyi": "きぃ", "kyu": "きゅ", "kye": "きぇ", "kyo": "きょ",
    // l
    "ll": "っl",
    "la": "ぁ", "li": "ぃ", "lu": "ぅ", "le": "ぇ", "lo": "ぉ",
    "ltu": "っ",
    "lya": "ゃ", "lyu": "ゅ", "lyo": "ょ",
    "lwa": "ゎ",
    // m
    "mm": "っm",
    "ma": "ま", "mi": "み", "mu": "む", "me": "め", "mo": "も",
    "mya": "みゃ", "myi": "みぃ", "myu": "みゅ", "mye": "みぇ", "myo": "みょ",
    // n
    "nn": "ん",
    "na": "な", "ni": "に", "nu": "ぬ", "ne": "ね", "no": "の",
    "nya": "にゃ", "nyi": "にぃ", "nyu": "にゅ", "nye": "にぇ", "nyo": "にょ",
    "nb": "んb", "nc": "んc", "nd": "んd", "nf": "んf", "ng": "んg",
    "nh": "んh", "nj": "んj", "nk": "んk", "nl": "んl", "nm": "んm",
    "np": "んp", "nq": "んq", "nr": "んr", "ns": "んs", "nt": "んt",
    "nv": "んv", "nw": "んw", "nx": "んx", "nz": "んz",
    // p
    "pp": "っp",
    "pa": "ぱ", "pi": "ぴ", "pu": "ぷ", "pe": "ぺ", "po": "ぽ",
    "pya": "ぴゃ", "pyi": "ぴぃ", "pyu": "ぴゅ", "pye": "ぴぇ", "pyo": "ぴょ",
    // q
    "qq": "っq",
    "qa": "くぁ", "qi": "くぃ", "qu": "くぅ", "qe": "くぇ", "qo": "くぉ",
    "qya": "くゃ", "qyi": "くぃ", "qyu": "くゅ", "qye": "くぇ", "qyo": "くょ",
    // r
    "rr": "っr",
    "ra": "ら", "ri": "り", "ru": "る", "re": "れ", "ro": "ろ",
    "rya": "りゃ", "ryi": "りぃ", "ryu": "りゅ", "rye": "りぇ", "ryo": "りょ",
    // s
    "ss": "っs",
    "sa": "さ", "si": "し", "su": "す", "se": "せ", "so": "そ",
    "sha": "しゃ", "shi": "し", "shu": "しゅ", "she": "しぇ", "sho": "しょ",
    "sya": "しゃ", "syi": "しぃ", "syu": "しゅ", "sye": "しぇ", "syo": "しょ",
    // t
    "tt": "っt",
    "ta": "た", "ti": "ち", "tu": "つ", "te": "て", "to": "と",
    "tha": "てゃ", "thi": "てぃ", "thu": "てゅ", "the": "てぇ", "tho": "てょ",
    "tya": "ちゃ", "tyi": "ちぃ", "tyu": "ちゅ", "tye": "ちぇ", "tyo": "ちょ",
    // v
    "vv": "っv",
    "va": "ゔぁ", "vi": "ゔぃ", "vu": "ゔ", "ve": "ゔぇ", "vo": "ゔぉ",
    "vya": "ゔゃ", "vyu": "ゔゅ", "vyo": "ゔょ",
    // w
    "ww": "っw",
    "wa": "わ", "wi": "うぃ", "we": "うぇ", "wo": "を",
    "wha": "うぁ", "whi": "うぃ", "wu": "う", "whe": "うぇ", "who": "うぉ",
    // x
    "xx": "っx",
    "xa": "ぁ", "xi": "ぃ", "xu": "ぅ", "xe": "ぇ", "xo": "ぉ",
    "xtu": "っ",
    "xya": "ゃ", "xyu": "ゅ", "xyo": "ょ",
    "xwa": "ゎ",
    // y
    "yy": "っy",
    "ya": "や", "yu": "ゆ", "ye": "いぇ", "yo": "よ",
    // z
    "zz": "っz",
    "za": "ざ", "zi": "じ", "zu": "ず", "ze": "ぜ", "zo": "ぞ",
    "zya": "じゃ", "zyi": "じぃ", "zyu": "じゅ", "zye": "じぇ", "zyo": "じょ",
    // 矢印
    "zh": "←", "zj": "↓", "zk": "↑", "zl": "→",
    // 記号
    "!": "！", "\"": "”", "#": "＃", "$": "＄", "%": "％",
    "&": "＆", "'": "’", "(": "（", ")": "）", "*": "＊",
    "+": "＋", ",": "、", "-": "ー", ".": "。", "/": "・",
    ":": "：", ";": "；", "<": "＜", "=": "＝", ">": "＞",
    "?": "？", "@": "＠", "[": "「", "¥": "￥", "]": "」",
    "^": "＾", "_": "＿", "`": "｀", "{": "『", "|": "｜",
    "}": "』", "~": "〜",
    // 数字
    "0": "０", "1": "１", "2": "２", "3": "３", "4": "４",
    "5": "５", "6": "６", "7": "７", "8": "８", "9": "９",
]

// NOTE: 変換対象は末尾 3 文字まで
func updateComposingText(_ text: String) -> String {
    if text.count == 0 {
        return ""
    }

    // 末尾 3 文字を変換
    let last3 = text.suffix(3)
    var prefix = text.prefix(text.count - last3.count)
    for (i, char) in last3.enumerated() {
        if let suffix = composingTextmap[String(last3.suffix(last3.count - i))] {
            return prefix + suffix
        }
        prefix.append(char)
    }

    // 変換できなかった場合はそのまま返す
    return text
}
