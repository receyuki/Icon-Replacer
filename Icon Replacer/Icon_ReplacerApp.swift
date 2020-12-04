//
//  Icon_ReplacerApp.swift
//  Icon Replacer
//
//  Created by ReceYuki on 30/11/20.
//

import SwiftUI
import Sparkle

@main
struct Icon_ReplacerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    static func test() -> Void {
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let url = urlForDocument[0] as URL
        print(url)
    }
    
    func checkForUpdates(_ sender: Any) {
            let updater = SUUpdater.shared()
            updater?.feedURL = URL(string: "https://receyuki.com/IconReplacer/appcast.xml")
            updater?.checkForUpdates(self)
    }
    
}
