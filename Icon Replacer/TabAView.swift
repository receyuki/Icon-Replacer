//
//  TabAView.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI
import ActivityIndicatorView

struct TabAView: View {
    @State private var selectedApp: AppProfile?
    @State private var isLoading = true
    @State private var showLoadingIndicator: Bool = true
    var body: some View {
        NavigationView() {
            if isLoading {
                VStack(spacing: 20.0){
                ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .rotatingDots).frame(width: 64, height: 64)
                    .foregroundColor(.gray)
                Text("Loading List")
                }.onAppear{
                    DispatchQueue.global(qos: .userInitiated).async {
                        appData = loadApps().sorted{
                            $0._name<$1._name
                        }
                        isLoading = false
                    }
                }
            }
            else {
            
                VStack(spacing:10){
                    Button(action:{
                        isLoading = true
                        DispatchQueue.global(qos: .userInitiated).async {
                            appData = loadApps().sorted{
                                $0._name<$1._name
                            }
                            isLoading = false
                        }
                    }){
                            Image(systemName: "goforward")
                                .font(.system(size: 16, weight: .heavy))
                    }.buttonStyle(PlainButtonStyle())
                    
                AppList(selectedApp: $selectedApp)
                }
                if selectedApp != nil {
                    AppDetail(appIcon: Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: selectedApp!.iconPath!))), app: selectedApp!)
                }
            }
            
        }.padding([.leading, .bottom, .trailing])
            
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
