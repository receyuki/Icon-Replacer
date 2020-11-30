//
//  AppList.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct AppList: View {

    
    var body: some View{
        List() {
            AppRow()
            AppRow()
            AppRow()
            AppRow()
            AppRow()
            AppRow()
            AppRow()
            AppRow()
            AppRow()
            AppRow()
        }.frame(minWidth: 300)
    }
}

struct AppList_Previews: PreviewProvider {
    static var previews: some View {
        AppList()
    }
}

