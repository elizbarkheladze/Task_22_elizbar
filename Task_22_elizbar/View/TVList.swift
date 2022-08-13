//
//  TVList.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import SwiftUI

struct TVList: View {
    let title: String
//    let tvs: [TV]
    var body: some View {
        VStack(alignment: .leading, spacing:0 ){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal){
                HStack(alignment: .top, spacing: 16){
                    ForEach(0..<15){item in
                        TVCell(tv: TV.stubbedTV)
                            .frame(width: 300)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct TVList_Previews: PreviewProvider {
    static var previews: some View {
        TVList(title: "Tvs")
    }
}
