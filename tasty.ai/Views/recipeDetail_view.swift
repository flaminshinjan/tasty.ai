//
//  recipeDetail_view.swift
//  tasty.ai
//
//  Created by Shinjan Patra on 14/12/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: recipe.thumbnailURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)

                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()

                if let description = recipe.description {
                    Text(description)
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
