//
//  DiscoverView.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 20.01.2022.
//

import SwiftUI

struct DiscoverView: View {
    
    @State var selectedCategory: category = .places
    @EnvironmentObject var model: Model
    @Binding var selectedTab: selectedTab
    @Binding var selectedCard: Card
    @Binding var showAnimation: Bool
    var namespace: Namespace.ID
    @State var selectedID = UUID()
    @Binding var itemNumber: Int
    
    
    var body: some View {
        ZStack  {
            ScrollView {
                categoryScroller
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                
                cardScroller
                    .padding(.vertical, 15)
                
                exploreMore
                    .padding(.vertical, 15)
                
            }
            .safeAreaInset(edge: .top) {
                Color.clear
                    .frame(height: 120)
            }
            .overlay(
                NavigationBar()
                
            )
            .overlay(
                TabBar()
            )
        }
    }
    
    var categoryScroller: some View {
        VStack {
            ScrollView (.horizontal) {
                HStack {
                    ForEach(categories) { category in
                        VStack (spacing: 8) {
                            Button {
                                withAnimation (.spring(response: 0.3, dampingFraction: 0.4)) {
                                    selectedCategory = category.category
                                }
                                
                            } label: {
                                Text(category.name)
                                    .foregroundColor(.black)
                                    .font(.headline)
                            }
                            
                            Circle()
                                .frame(width: 7 ,height: 7)
                                .opacity(category.category == selectedCategory ? 1 : 0)
                                .foregroundColor(.black)
                        }
                        
                    }
                }
            }
        }
    }
    
    var cardScroller: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(cards) { card in
                        Button {
                            withAnimation (.spring(response: 0.4, dampingFraction: 0.8)) {
                                selectedCard = cards[card.index]
                                selectedTab = .info
                            }
                            
                            withAnimation (.spring(response: 0.6, dampingFraction: 0.7).delay(0.1)) {
                                showAnimation.toggle()
                            }
                            
                        } label: {
                            ZStack {
                                Image(card.image)
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .matchedGeometryEffect(id: "image\(card.id)", in: namespace)
                                
                                LinearGradient(colors: [.black, .black.opacity(0)], startPoint: .bottom, endPoint: UnitPoint(x: 0.5, y: 0.7))
                                
                                VStack (alignment: .leading, spacing: 5){
                                    Text(card.name)
                                        .foregroundColor(.white)
                                        .font(.title3.weight(.bold))
                                        .frame(maxWidth: 250, maxHeight: 30, alignment: .bottomLeading)
                                        .matchedGeometryEffect(id: "name\(card.id)", in: namespace)
                                    
                                    HStack {
                                        Image(systemName: card.icon)
                                            .foregroundColor(.white)
                                            .animatableFont(size: 20, weight: .regular, design: .default)
                                        //.font(.system(size: 20))
                                            .matchedGeometryEffect(id: "icon\(card.id)", in: namespace)
                                        
                                        
                                        Text(card.coords)
                                            .foregroundColor(.white)
                                            .animatableFont(size: 15, weight: .regular, design: .default)
                                            .frame(width: 150, alignment: .leading)
                                            .matchedGeometryEffect(id: "coords\(card.id)", in: namespace)
                                            .lineLimit(1)
                                        
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                .padding()
                                .padding(.bottom, 10)
                                .frame(width: 200, height: 300)
                                
                            }
                            .onAppear {
                                proxy.scrollTo(itemNumber, anchor: .center)
                            }
                            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .frame(width: 200, height: 300)
                                    .matchedGeometryEffect(id: "mask\(card.id)", in: namespace))
                            .frame(width: 200, height: 300)
                        }
                    }
                }
                .padding(.leading, 20)
            }
        }
    }
    
    var exploreMore: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Explore more")
                .font(.title3.weight(.semibold))
                .padding(.leading, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 25) {
                    ForEach(exploreIcons) { item in
                        Button  {
                            
                        } label: {
                            VStack {
                                ZStack {
                                    item.color.opacity(0.2)
                                    item.color
                                        .mask {
                                            Image(item.icon)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding()
                                        }
                                }
                                .frame(width: 65, height: 65)
                                .cornerRadius(15)
                                
                                Text(item.name)
                                    .lineLimit(1)
                                    .foregroundColor(.secondary)
                            }
                            .frame(width: 85)
                        }
                    }
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        DiscoverView(selectedTab: .constant(.home), selectedCard: .constant(cards[0]), showAnimation: .constant(false), namespace: namespace, itemNumber: .constant(0))
            .environmentObject(Model())
    }
}
