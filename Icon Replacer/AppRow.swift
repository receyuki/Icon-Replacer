//
//  AppRow.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct AppRow: View {
//    var app: App
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
        VStack(alignment: .leading) {
            Text(path().absoluteString)
            
            Text("test")
        }
        }

    }
}

    func path() -> URL{
        do {
            let userApplicationDirectory = try FileManager.default.url(for: .applicationDirectory,
                                                                        in: .userDomainMask,
                                                            appropriateFor: nil,
                                                                    create: true)
            print(userApplicationDirectory)
            return userApplicationDirectory
        } catch {
            print(error)
            return URL(string: "nil")!
        }
    }

struct AppRow_Previews: PreviewProvider {
    static var previews: some View {
        AppRow()
    }
}
