//
//  MatchedGeometry.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 21.01.2022.
//

import SwiftUI

struct MatchedGeometry: View {
    @State var show = true
    @Namespace var namespace
    @State var card = cards[0]
    
    var body: some View {
        VStack {
            if show {
                imageOne
            } else {
                imageTwo
            }
            
            
        }
        .onTapGesture {
            withAnimation (.easeOut){
                show.toggle()
            }
        }
    }
    
    var imageOne: some View {
        Image(card.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            
            .offset(x: 70)
            .matchedGeometryEffect(id: "image", in: namespace)
            //.frame(maxWidth: .infinity)
            .frame(height: 300)
            //.frame(maxHeight: .infinity, alignment: .top)
        
    }
    
    var imageTwo: some View {
        Image(card.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
            .offset(x: 70)
            .frame(width: 200, height: 300)
            .matchedGeometryEffect(id: "image", in: namespace)
            
    }
}

struct MatchedGeometry_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometry()
    }
}
