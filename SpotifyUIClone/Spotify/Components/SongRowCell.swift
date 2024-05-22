//
//  SongRowCell.swift
//  SpotifyUIClone
//
//  Created by Florian on 22.05.24.
//

import SwiftUI

struct SongRowCell: View {
    
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some song name goes here"
    var subtitle: String = "Some artist here"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.red)
    }
}

#Preview {
    
    ZStack {
        
        Color.black.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
