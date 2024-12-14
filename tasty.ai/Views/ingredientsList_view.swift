//
//  ingredientsList_view.swift
//  tasty.ai
//
//  Created by Shinjan Patra on 14/12/24.
//

import SwiftUI

struct IngredientListView: View {
    let ingredients = ["Milk", "Eggs", "Flour", "Sugar", "Butter"]

    var body: some View {
        NavigationView {
            List(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
            .navigationTitle("Ingredients")
        }
    }
}
