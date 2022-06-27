//
//  Prtfl3App.swift
//  Shared
//
//  Created by Борис Ларионов on 20.01.2022.
//

import SwiftUI

@main
struct Prtfl3App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
