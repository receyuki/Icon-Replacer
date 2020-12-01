//
//  AppDetail.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct AppDetail: View {
    var app: AppProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: app.iconPath!)))
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .fixedSize(horizontal: true, vertical: false)
                    .cornerRadius(4.0)
                Image(systemName: "chevron.forward")
                    .font(.system(size: 64, weight: .regular))
                    .cornerRadius(4.0)
            }
            Divider()
            VStack(alignment: .leading) {
                Text(app._name)
                    .font(.title)
                Text(app.path)
            }
        }.offset(x: 10, y: -60)
    }
}

struct AppDetail_Previews: PreviewProvider {
    static var previews: some View {
        AppDetail(app: appData[0])
    }
}
