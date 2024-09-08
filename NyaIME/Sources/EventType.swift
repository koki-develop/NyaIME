//
//  EventType.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/07.
//

import AppKit

enum EventType {
    case enter
    case backspace
    case space
    case input(_ text: String)
}

func getEventType(_ event: NSEvent) -> EventType? {
    switch event.keyCode {
    case 36:
        return .enter
    case 49:
        return .space
    case 51:
        return .backspace
    default:
        break
    }

    if let text = event.characters, isPrintable(text) {
        return .input(text)
    }

    return nil
}

func isPrintable(_ text: String) -> Bool {
    let printable = [
        CharacterSet.alphanumerics,
        CharacterSet.symbols,
        CharacterSet.punctuationCharacters,
    ].reduce(CharacterSet()) { $0.union($1) }
    return !text.unicodeScalars.contains(where: { !printable.contains($0) })
}
