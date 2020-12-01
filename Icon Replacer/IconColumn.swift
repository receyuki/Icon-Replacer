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
            Image(nsImage: NSImage(byReferencing: icon.url!))
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 32, height: 32)
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(4.0)
            Text(icon.name)
                .fontWeight(.bold)
                .truncationMode(.tail)
                .frame(minWidth: 20)
            }.frame(minWidth: 50, minHeight: 50)
        }
}

//struct IconColumn_Previews: PreviewProvider {
//    static var previews: some View {
//        IconColumn(app:appData[0])
//    }
//}
