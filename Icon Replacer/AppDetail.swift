//
//  AppDetail.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct AppDetail: View {
    @State private var selectedIcon: IconProfile?
    @State var appIcon: Image
    var app: AppProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                appIcon
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .fixedSize(horizontal: true, vertical: false)
                    .cornerRadius(4.0)

                if selectedIcon != nil {
                    Button(action:{
                        print(app.iconPath!)
                        replaceIcon(app: app, icon: selectedIcon!)
                        appIcon = Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: app.iconPath!)))
                    }){
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 64, weight: .regular))
                    }.buttonStyle(PlainButtonStyle())
                    
                    Image(nsImage: NSImage(byReferencing: selectedIcon!.url!))
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .fixedSize(horizontal: true, vertical: false)
                        .cornerRadius(4.0)}
            }
            .onAppear{
                appIcon = Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: app.iconPath!)))}
            
            Divider()
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    VStack(alignment: .leading) {
                        Text(app._name)
                            .font(.title)
                        Text(app.path)
                    }
                    VStack(alignment: .leading) {
                        Text("Version:")
                        Text(app.version ?? "N/A")
                    }
                    VStack(alignment: .leading) {
                        Text("Bundle Name:")
                        Text(app.bundleName ?? "N/A")
                    }
                    Spacer()
                }
                Spacer()
                VStack{
                IconList(selectedIcon: $selectedIcon, selectedApp: app).padding(.trailing)
                }
            }
            
            
        }
        .offset(x: 10, y: 10)
        .onChange(of: app){ newApp in
            appIcon = Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: newApp.iconPath!)))}

    }
}

struct AppDetail_Previews: PreviewProvider {
    static var previews: some View {
        AppDetail(appIcon: Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: appData[0].iconPath!))), app: appData[0])
    }
}
