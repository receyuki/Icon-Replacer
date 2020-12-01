//
//  AppRow.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI
import Cocoa

struct AppRow: View {
    var app: AppProfile
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: app.iconPath!)))
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 32, height: 32)
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(4.0)
            
        VStack(alignment: .leading) {
            Text(app._name)
                .fontWeight(.bold)
                .truncationMode(.tail)
                .frame(minWidth: 20)
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
        AppRow(app:appData[0])
    }
}
