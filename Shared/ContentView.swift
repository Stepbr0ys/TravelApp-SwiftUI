//
//  ContentView.swift
//  Shared
//
//  Created by Борис Ларионов on 20.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: selectedTab = .home
    @EnvironmentObject var model: Model
    @Namespace var namespace
    @State var selectedCard : Card = cards[0]
    @State var showAnimation = false
    @State private var itemNumber = 0
    
    var body: some View {
        ZStack (alignment: .bottom) {
            switch selectedTab {
            case .home:
                DiscoverView(selectedTab: $selectedTab, selectedCard: $selectedCard, showAnimation: $showAnimation, namespace: namespace, itemNumber: $itemNumber)
            case .info:
                CardInfo(selectedTab: $selectedTab, selectedCard: $selectedCard, showAnimation: $showAnimation, namespace: namespace)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
