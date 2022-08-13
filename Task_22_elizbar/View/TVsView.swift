//
//  TVsView.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import SwiftUI

struct TVsView: View {
    @ObservedObject private var popularState = TvListState()
    var body: some View {
        NavigationView{
            List {
                Text("aaaa")
//                if popularState.tvs != nil {
//                    TVList(title: "Popular", tvs: popularState.tvs!)
                }
            }
            .navigationBarTitle("TVs")
        }
    }



struct TVsView_Previews: PreviewProvider {
    static var previews: some View {
        TVsView()
    }
}
