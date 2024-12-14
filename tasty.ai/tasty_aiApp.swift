//
//  tasty_aiApp.swift
//  tasty.ai
//
//  Created by Shinjan Patra on 14/12/24.
//

import SwiftUI

@main
struct TastyApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListView()
        }
    }
}

#Preview {
    RecipeListView()
}
