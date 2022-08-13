//
//  TV.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import Foundation
var api = "69f3298313159cd426f1593b628d72ca"
struct TVResponse : Decodable {
    let results: [TV]
}

struct TV : Decodable, Identifiable {
    let id: Int
    let name: String
    let backdrop_path: String?
    let poster_path: String?
    let overview: String
    let vote_average: Double
    let vote_count: Int
    
    var backdropURL : URL {
        return URL(string: "https://api.themoviedb.org/3/tv/\(id)/images?api_key=\(api)")!
    }

    
}
