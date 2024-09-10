//
//  NyaIMEInputController.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/06.
//

import InputMethodKit

@objc(NyaIMEInputController)
class NyaIMEInputController: IMKInputController {
    let candidates: IMKCandidates
    var inputState: InputState = .normal
    var composingText: String = ""

    override init!(server: IMKServer!, delegate: Any!, client inputClient: Any!) {
        self.candidates = IMKCandidates(
            server: server, panelType: kIMKSingleColumnScrollingCandidatePanel)
        super.init(server: server, delegate: delegate, client: inputClient)
    }

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

        case (.space, .normal):
            self.insertText("　")
            return true
        case (.space, .composing):
            self.inputState = .selecting
            self.candidates.update()
            self.candidates.show()
            return true
        case (.space, .selecting):
            self.candidates.moveDown(sender)
            return true

        case (.enter, .composing):
            self.insertText(self.composingText)
            self.setMarkedText("")
            self.composingText.removeAll()
            self.inputState = .normal
            return true

        case (.esc, .selecting):
            self.inputState = .composing
            self.setMarkedText(self.composingText)
            self.candidates.hide()
            return true

        case (.down, .selecting):
            fallthrough
        case (.up, .selecting):
            fallthrough
        case (.enter, .selecting):
            self.candidates.interpretKeyEvents([event])
            return true

        default:
            return false
        }
    }

    override func deactivateServer(_ sender: Any!) {
        self.candidates.hide()
        self.insertText(self.composingText)
        self.setMarkedText("")
        self.composingText.removeAll()
        self.inputState = .normal
    }

    override func candidates(_ sender: Any!) -> [Any]! {
        let nya = toNya(self.composingText)
        return [
            nya.katakanaZenkaku,
            nya.hiraganaZenkaku,
            nya.katakanaHankaku,
        ]
    }

    override func candidateSelected(_ candidateString: NSAttributedString!) {
        self.insertText(candidateString.string)
        self.setMarkedText("")
        self.candidates.hide()
        self.composingText.removeAll()
        self.inputState = .normal
    }

    override func candidateSelectionChanged(_ candidateString: NSAttributedString!) {
        self.setMarkedText(candidateString.string)
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
