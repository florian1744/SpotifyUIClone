//
//  ContentView.swift
//  SpotifyUIClone
//
//  Created by Florian on 03.04.24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { user in
                    Text(user.title)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
