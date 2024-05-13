//
//  ImageTitleRowCell.swift
//  SpotifyUIClone
//
//  Created by Florian on 12.05.24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var title: String = "some item name afhdknfdjsgbskegbs"
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .padding(4)
                .lineLimit(2)
                
                
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
