//
//  NyaIMEInputController.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/06.
//

import InputMethodKit

@objc(NyaIMEInputController)
class NyaIMEInputController: IMKInputController {
    let appMenu: NSMenu
    let candidates: IMKCandidates
    var inputState: InputState = .normal
    var composingText: String = ""
    var selectionText: String = ""

    override init!(server: IMKServer!, delegate: Any!, client inputClient: Any!) {
        self.appMenu = NSMenu(title: "NyaIME")
        self.appMenu.addItem(
            NSMenuItem(
                title: "View on GitHub", action: #selector(self.viewOnGitHub(_:)), keyEquivalent: ""
            ))

        self.candidates = IMKCandidates(
            server: server, panelType: kIMKSingleColumnScrollingCandidatePanel)

        super.init(server: server, delegate: delegate, client: inputClient)
    }

    override func menu() -> NSMenu! {
        return self.appMenu
    }

    override func handle(_ event: NSEvent!, client sender: Any!) -> Bool {
        guard let eventType = getEventType(event) else {
            return false
        }

        switch (eventType, self.inputState) {
        case (.input(let text), .selecting):
            self.insertText(self.selectionText)
            self.candidates.hide()
            self.composingText.removeAll()
            fallthrough
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
        case (.backspace, .selecting):
            self.insertText(String(self.selectionText.dropLast()))
            self.setMarkedText("")
            self.candidates.hide()
            self.inputState = .normal
            self.composingText.removeAll()
            return true

        case (.space, .normal):
            self.insertText("　")
            return true
        case (.space, .composing):
            if self.composingText.hasSuffix("n") {
                self.composingText.removeLast()
                self.composingText.append("ん")
            }
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

        case (.esc, .composing):
            self.setMarkedText("")
            self.composingText.removeAll()
            self.inputState = .normal
            return true
        case (.esc, .selecting):
            self.inputState = .composing
            self.setMarkedText(self.composingText)
            self.candidates.hide()
            return true
        case (.down, .selecting), (.up, .selecting), (.enter, .selecting):
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
        self.selectionText = candidateString.string
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

        let highlight =
            self.mark(forStyle: kTSMHiliteSelectedConvertedText, at: cursorPosition)
            as? [NSAttributedString.Key: Any]
        let underline =
            self.mark(
                forStyle: kTSMHiliteConvertedText,
                at: NSRange(location: NSNotFound, length: 0)
            ) as? [NSAttributedString.Key: Any]

        let str =
            switch self.inputState {
            case .selecting:
                NSMutableAttributedString(string: text, attributes: highlight)
            default:
                NSMutableAttributedString(string: text, attributes: underline)
            }
        client.setMarkedText(str, selectionRange: cursorPosition, replacementRange: cursorPosition)
    }

    @objc
    func viewOnGitHub(_ sender: Any) {
        guard let url = URL(string: "https://github.com/koki-develop/NyaIME") else {
            return
        }
        NSWorkspace.shared.open(url)
    }
}
