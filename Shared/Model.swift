//
//  Model.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 21.01.2022.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedCard: Card = cards[0]
}
