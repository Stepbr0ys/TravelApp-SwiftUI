//
//  MatchedGeometryTest\.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 21.01.2022.
//

import SwiftUI

struct MatchedGeometryTest_: View {
    @Namespace var namespace
    @State var card = cards[0]
    
    var body: some View {
        ZStack {
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .matchedGeometryEffect(id: "image", in: namespace)
                .frame(height: 300)
                .frame(maxHeight: .infinity, alignment: .top)
            
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
                .offset(x: 70)
                .frame(width: 200, height: 300)
        }
    }
}

struct MatchedGeometryTest__Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryTest_()
    }
}
