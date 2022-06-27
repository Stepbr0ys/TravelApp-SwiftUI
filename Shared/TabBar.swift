//
//  TabBar.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 22.01.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        HStack (spacing: 60) {
            Image(systemName: "house")
                .foregroundColor(.primary)
                .font(.system(size: 25))
            
            Image(systemName: "text.justify")
                .foregroundColor(.secondary)
                .font(.system(size: 25))
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
                .font(.system(size: 25))
            
            Image(systemName: "person")
                .foregroundColor(.secondary)
                .font(.system(size: 25))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60, alignment: .top)
        .padding(.top, 10)
        .background(.white)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
