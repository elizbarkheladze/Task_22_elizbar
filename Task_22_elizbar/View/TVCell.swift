//
//  TVCell.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import SwiftUI

struct TVCell: View {
    
    let tv : TV
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(1/1,contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            Text("movie")
        }
        .onAppear{
            self.imageLoader.loadIMage(with: self.tv.backdropURL)
        }
    }
}

struct TVCell_Previews: PreviewProvider {
    static var previews: some View {
        TVCell(tv: TV.stubbedTV)
    }
}
