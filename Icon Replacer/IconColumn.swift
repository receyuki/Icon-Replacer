//
//  IconColumn.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import SwiftUI
import Cocoa

struct IconColumn: View {
    var icon: IconProfile
    
    var body: some View {
        HStack(alignment: .center) {
//            Image(nsImage: NSImage(byReferencing: icon.url!))
            Image(nsImage: NSImage(byReferencing: iconFolder.appendingPathComponent(icon.url!.lastPathComponent)))
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 50, height: 50)
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(4.0)
            Text(icon.name)
                .fontWeight(.bold)
                .truncationMode(.tail)
                .frame(minWidth: 20)
            }.frame(minWidth: 50, minHeight: 64)
        }
}

//struct IconColumn_Previews: PreviewProvider {
//    static var previews: some View {
//        IconColumn(app:appData[0])
//    }
//}
