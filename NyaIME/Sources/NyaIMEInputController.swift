//
//  NyaIMEInputController.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/06.
//

import InputMethodKit

@objc(NyaIMEInputController)
class NyaIMEInputController: IMKInputController {
    var inputState: InputState = .normal
    var composingText: String = ""

    override func handle(_ event: NSEvent!, client sender: Any!) -> Bool {
        guard let eventType = getEventType(event) else {
            return false
        }

        switch (eventType, self.inputState) {
        case (.input(let text), .normal):
            self.inputState = .composing
            fallthrough
        case (.input(let text), .composing):
            self.composingText = updateComposingText(self.composingText + text)
            self.setMarkedText(self.composingText)
            return true

        case (.backspace, .composing):
            self.composingText.removeLast()
            self.setMarkedText(self.composingText)
            return true

        case (.enter, .composing):
            self.insertText(self.composingText)
            self.setMarkedText("")
            self.composingText.removeAll()
            self.inputState = .normal
            return true

        default:
            return false
        }
    }

    func insertText(_ text: String) {
        guard let client = client() else {
            return
        }
        client.insertText(text, replacementRange: NSRange(location: NSNotFound, length: NSNotFound))
    }

    func setMarkedText(_ text: String) {
        guard let client = client() else {
            return
        }
        let cursorPosition = NSRange(location: NSNotFound, length: NSNotFound)
        client.setMarkedText(text, selectionRange: cursorPosition, replacementRange: cursorPosition)
    }
}
