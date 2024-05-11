//
//  SpotifyHomeView.swift
//  SpotifyUIClone
//
//  Created by Florian on 23.04.24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack {
                            recentsSection
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                            }
 
                        }
                    } header: {
                        header
                    }
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.red)
                            .frame(width: 200, height: 200)
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .toolbar(.hidden, for: .navigationBar)

        .task {
            await getData()
        }
    }
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            
        }
    }
    private var header: some View {
        HStack {
            
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(Color.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 30, height: 30)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
        
    }
    private var recentsSection: some View {
        NonLazyVGrid(items: products) { product in
            if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                )
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
            
        )

    }
}




#Preview {
    SpotifyHomeView()
}
