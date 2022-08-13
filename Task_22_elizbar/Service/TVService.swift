//
//  TVService.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import Foundation



protocol TVServices {
    
    func fetchTvs(from endpoint : TVListEndpoint, completion: @escaping (Result<TVResponse, TVError>) -> ())
    func fetchTV(id: Int ,completion: @escaping (Result<TV, TVError>) -> ())
    
}


enum TVListEndpoint: String,CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    
    var description : String {
        switch self{
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum TVError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription : String {
        switch self {
        case .apiError: return "Faied to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "invalid Response"
        case .noData: return "No Data"
        case.serializationError: return "failed to decode data"
        }
        
        var errorUserInfo: [String : Any] {
            [NSLocalizedDescriptionKey: localizedDescription]
        }
    }
}

