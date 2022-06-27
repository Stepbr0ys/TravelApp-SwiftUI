//
//  NavigationBarForCard.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 22.01.2022.
//

import SwiftUI

struct NavigationBarForCard: View {
    @Binding var selectedTab: selectedTab
    @Binding var showAnimation: Bool
    
    var body: some View {
        ZStack {
            
            VStack (spacing: 15) {
                buttonAndAvatar
                
                Text("")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.weight(.semibold))
                    .frame(height: 40)

            }
        }
        .frame(height: 120)
        .padding(.horizontal ,20)
        .padding(.top, 30)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(.all)
        
    }
    
    var avatar: some View {
        VStack {
            Circle().foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                .frame(width: 8, height: 8)
            Circle().foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                .frame(width: 8, height: 8)
        }
        .frame(width: 50, height: 50, alignment: .center)
        
    }
    
    var buttonAndAvatar: some View {
        HStack {
            Button  {
                withAnimation (.spring(response: 0.6, dampingFraction: 0.9)) {
                    
                    selectedTab = .home
                }
                
                withAnimation (.spring(response: 0.6, dampingFraction: 0.7)) {
                    showAnimation.toggle()
                }
                
            } label: {
                Image(systemName: "list.bullet")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
            Spacer()
            
            avatar
            
        }
    }
}

struct NavigationBarForCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarForCard(selectedTab: .constant(.home), showAnimation: .constant(false))
    }
}
