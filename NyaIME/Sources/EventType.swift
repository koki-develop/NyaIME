//
//  EventType.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/07.
//

import AppKit

enum EventType {
    case enter
    case space
    case input(_ text: String)
}

let keycodeMap: [UInt16: EventType] = [
    36: .enter,
    49: .space,
]

func getEventType(_ event: NSEvent) -> EventType? {
    if let eventType = keycodeMap[event.keyCode] {
        return eventType
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
