//
//  CardInfo.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 21.01.2022.
//

import SwiftUI

struct CardInfo: View {
    
    @EnvironmentObject var model: Model
    @State var starsCount : Int = 0
    @State var peopleCount : Int = 0
    @Binding var selectedTab: selectedTab
    @Binding var selectedCard : Card
    @Binding var showAnimation: Bool
    var namespace: Namespace.ID
    @State var likeAnimation = false
    @State var heartAnimation = false
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack (spacing: 40) {
                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(
                    
                    ZStack {
                        Image(selectedCard.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .zIndex(0)
                            .matchedGeometryEffect(id: "image\(selectedCard.id)", in: namespace)
                        LinearGradient(colors: [.black, .black.opacity(0)], startPoint: .bottom, endPoint: UnitPoint(x: 0.5, y: 0.8))
                    }
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .frame(width: 500, height: 300)
                                .matchedGeometryEffect(id: "mask\(selectedCard.id)", in: namespace))
                        .frame(width: UIScreen.main.bounds.width ,height: 300)
                        .frame(maxHeight: .infinity, alignment: .top)
                )
                .overlay(
                    
                    VStack {
                        
                        ScrollView {
                            VStack (spacing: 40) {
                                info
                                    .padding(.top, 20)
                                
                                peopleSelect
                                    .opacity(showAnimation ? 1 : 0)
                                
                                
                                description
                                    .opacity(showAnimation ? 1 : 0)
                                
                            }
                        }
                        
                        .padding(.bottom, 20)
                        //.frame(width: UIScreen.main.bounds.width)
                        
                        .padding(.horizontal, 25)
                        .background(.white)
                        
                        .cornerRadius(20)
                        
                        .safeAreaInset(edge: .bottom) {
                            Color.clear
                                .frame(height: 47)
                        }
                        
                        .safeAreaInset(edge: .top) {
                            Color.clear
                                .frame(height: 270)
                        }
                    }
                    // .offset(y: showAnimation ? 0 : UIScreen.main.bounds.height)
                )
            }
            .overlay(
                HStack (spacing: 10) {
                    Button  {
                        withAnimation (.spring(response: 0.6, dampingFraction: 0.7)) {
                            likeAnimation.toggle()
                        }
                        
                        withAnimation (.spring(response: 0.3, dampingFraction: 0.4)) {
                            heartAnimation.toggle()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(likeAnimation ? .red : .gray)
                                .background(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous).foregroundColor(likeAnimation ? .red : .clear)
                                )
                                .frame(width: 60, height: 60)
                                .cornerRadius(20)
                            
                            Image(systemName: "suit.heart")
                                .symbolVariant(likeAnimation ? .fill : .none)
                                .frame(width: 60, height: 60)
                                .foregroundColor(likeAnimation ? .white : .gray)
                                .scaleEffect(heartAnimation ? 1.3 : 1)
                        }
                    }
                    
                    Spacer()
                    
                    Button  {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .foregroundColor(.blue)
                                .frame(height: 60)
                            
                            HStack {
                                Text("Book Trip Now")
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 20)
                    .background(.white)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .opacity(showAnimation ? 1 : 0)
                //.offset(y: showAnimation ? 0 : UIScreen.main.bounds.height)
                
            )
            .overlay(
                NavigationBarForCard(selectedTab: $selectedTab, showAnimation: $showAnimation)
            )
            .background(.white)
        }
        .statusBar(hidden: true)
        .ignoresSafeArea()
    }
    
    var info: some View {
        VStack  (spacing: 10) {
            HStack {
                Text(selectedCard.name)
                    .foregroundColor(.black)
                    .font(.title.weight(.bold))
                    .frame(maxWidth: 250, maxHeight: 50, alignment: .bottomLeading)
                    .matchedGeometryEffect(id: "name\(selectedCard.id)", in: namespace)
                
                
                
                Spacer()
                
                Text(selectedCard.price)
                    .font(.title.weight(.bold))
                    .foregroundColor(.blue)
            }
            
            HStack (spacing: 2) {
                Image(systemName: selectedCard.icon)
                //.font(.system(size: 15))
                    .animatableFont(size: 15, weight: .bold, design: .default)
                    .foregroundColor(.blue)
                    .matchedGeometryEffect(id: "icon\(selectedCard.id)", in: namespace)
                
                Text(selectedCard.coords)
                //.font(.title3.weight(.semibold))
                    .animatableFont(size: 20, weight: .semibold, design: .default)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                    .matchedGeometryEffect(id: "coords\(selectedCard.id)", in: namespace)
            }
            
            starsSelect
                .opacity(showAnimation ? 1 : 0)
        }
    }
    
    var starsSelect: some View {
        HStack {
            ForEach(stars) { star in
                Button  {
                    starsCount = star.count
                } label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(star.count <= starsCount ? .yellow: .yellow.opacity(0.3) )
                        .font(.system(size: 20))
                }
            }
            
            Text("(\(starsCount).0)")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var peopleSelect: some View {
        VStack {
            VStack (alignment: .leading, spacing: 5) {
                Text("People")
                    .font(.title3.weight(.semibold))
                
                Text("Numbers of people in your group")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ForEach(people) { people in
                    Button  {
                        peopleCount = people.count
                    } label: {
                        Text("\(people.count)")
                            .frame(width: 55, height: 55)
                            .foregroundColor(people.count <= peopleCount ? .white: .black)
                            .background(people.count <= peopleCount ? .black : .gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.top, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var description: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Description")
                .font(.title3.weight(.semibold))
            
            Text(selectedCard.description)
                .font(.callout)
                .foregroundColor(.secondary)
                .lineLimit(5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CardInfo_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CardInfo(selectedTab: .constant(.home), selectedCard: .constant(cards[0]), showAnimation: .constant(true), namespace: namespace)
            .environmentObject(Model())
    }
}
