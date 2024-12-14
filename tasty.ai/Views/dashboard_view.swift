//
//  dashboard_view.swift
//  tasty.ai
//
//  Created by Shinjan Patra on 14/12/24.
//
import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }
            
            ChatInterfaceView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            
            IngredientListView()
                .tabItem {
                    Label("Ingredients", systemImage: "cart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .background(Color.white) // Set background color to white
    }
}

