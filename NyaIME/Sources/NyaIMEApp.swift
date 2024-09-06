//
//  NyaIMEApp.swift
//  NyaIME
//
//  Created by koki sato on 2024/09/06.
//

import InputMethodKit

class NSManualApplication: NSApplication {
    let appDelegate = AppDelegate()

    override init() {
        super.init()
        self.delegate = self.appDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var server = IMKServer()

    func applicationDidFinishLaunching(_ notification: Notification) {
        self.server = IMKServer(
            name: Bundle.main.infoDictionary?["InputMethodConnectionName"] as? String,
            bundleIdentifier: Bundle.main.bundleIdentifier
        )
    }
}
