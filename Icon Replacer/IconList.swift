//
//  IconList.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import SwiftUI
import ActivityIndicatorView

struct IconList: View {
    @Binding var selectedIcon: IconProfile?
    @State private var isLoading = true
    @State private var showLoadingIndicator: Bool = true
    var selectedApp: AppProfile
    
    
    var body: some View {
        VStack{
            if isLoading {
                VStack(spacing: 20){
                ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .rotatingDots).frame(width: 32, height: 32)
                    .foregroundColor(.gray)
                }.frame(minWidth: 250, maxWidth: 250)
                .onAppear{
                    DispatchQueue.global(qos: .userInitiated).async {
                        iconList = getIconList(iconNameList: matchIcon(app: selectedApp)!)
                            .sorted{$0.name<$1.name}
                        downloadIconList(iconList: iconList)
                        isLoading = false
                    }
                }
            }
            else {
                List(selection: $selectedIcon) {
                    ForEach(iconList)
                    { icon in
                        IconColumn(icon: icon).tag(icon)
                    }.frame(minHeight: 30)
                }.frame(minWidth: 250, maxWidth: 250)
            }
            
        }
        .onChange(of: selectedApp, perform: { value in
            isLoading = true
        })
    }
}


//struct IconList_Previews: PreviewProvider {
//    static var previews: some View {
//        IconList()
//    }
//}
