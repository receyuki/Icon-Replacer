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
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30) {
                VStack(alignment: .leading) {
                    Text(app._name)
                        .font(.title)
                    Text(app.path)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Version:")
                    Text(app.version ?? "N/A")
                }
                VStack(alignment: .leading) {
                    Text("Bundle Name:")
                    Text(app.bundleName ?? "N/A")
                }
                .padding(.trailing, 20)
            }
            Divider()
            Image(nsImage: NSImage(byReferencing: URL(string: "https://github.com/elrumo/macOS_Big_Sur_icons_replacements/raw/master/icons/1Blocker.icns")!))
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 32, height: 32)
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(4.0)
//            Text(matchIcon(app: app)?.joined(separator:"\n") ?? "no matching icon")
//                .font(.title)
        }.offset(x: 10, y: -60)
        
        
    }
}

struct AppDetail_Previews: PreviewProvider {
    static var previews: some View {
        AppDetail(app: appData[0])
    }
}
