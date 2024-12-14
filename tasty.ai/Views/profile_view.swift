//
//  profile_view.swift
//  tasty.ai
//
//  Created by Shinjan Patra on 14/12/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text("John Doe")
                .font(.title)
                .bold()
            
            Text("johndoe@example.com")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}
