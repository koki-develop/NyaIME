//
//  NyaIMEInputController.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/06.
//

import InputMethodKit

@objc(NyaIMEInputController)
class NyaIMEInputController: IMKInputController {
    override func handle(_ event: NSEvent!, client sender: Any!) -> Bool {
        guard let client = sender as? IMKTextInput else {
            return false
        }

        if let text = event.characters {
            client.insertText(
                text.uppercased(),
                replacementRange: NSRange(location: NSNotFound, length: NSNotFound)
            )
            return true
        }

        return false
    }
}
