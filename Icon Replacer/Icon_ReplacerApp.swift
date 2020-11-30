//
//  Icon_ReplacerApp.swift
//  Icon Replacer
//
//  Created by ReceYuki on 30/11/20.
//

import SwiftUI

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
//    static func main() -> Void{
//        do {
//            let userApplicationDirectory = try FileManager.default.url(for: .applicationDirectory,
//                                                                        in: .userDomainMask,
//                                                            appropriateFor: nil,
//                                                                    create: true)
//            print(userApplicationDirectory)
//        } catch { print(error)}
//    }
    
}
