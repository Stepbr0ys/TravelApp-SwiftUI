//
//  NavigationBar.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 20.01.2022.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        ZStack {
            Color.white
            
            
            VStack (spacing: 15) {
                buttonAndAvatar
                
                Text("Discover")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.weight(.semibold))
            }
        }
        .frame(height: 120)
        .padding(.horizontal ,20)
        .background(.white)
        .padding(.top, 30)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(.all)
        
    }
    
    var avatar: some View {
        Image("Ava")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .cornerRadius(11)
            .frame(height: 50)
    }
    
    var buttonAndAvatar: some View {
        HStack {
            Image(systemName: "list.bullet")
                .font(.system(size: 30))
            
            Spacer()
            
            avatar
            
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
