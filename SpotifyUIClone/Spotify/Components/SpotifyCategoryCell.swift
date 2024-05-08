//
//  SpotifyCategoryCell.swift
//  SpotifyUIClone
//
//  Created by Florian on 23.04.24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
    }
}
extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            SpotifyCategoryCell(title: "title goes here")
            SpotifyCategoryCell(title: "title goes here", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
           
        }
    }
    
}
