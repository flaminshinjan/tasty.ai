//
//  chat_view.swift
//  tasty.ai
//
//  Created by Shinjan Patra on 14/12/24.
//

import SwiftUI

struct ChatInterfaceView: View {
    @State private var messages: [String] = ["Hello!", "How can I help you?"]
    @State private var newMessage: String = ""

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    HStack {
                        Text(message)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
            
            HStack {
                TextField("Type a message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    guard !newMessage.isEmpty else { return }
                    messages.append(newMessage)
                    newMessage = ""
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
            }
        }
    }
}
