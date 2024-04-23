//
//  SpotifyCategoryCell.swift
//  SpotifyUIClone
//
//  Created by Florian on 23.04.24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "Music"
    var isSelected: Bool = false
    
    
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
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
