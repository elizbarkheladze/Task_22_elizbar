//
//  TvListState.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import SwiftUI

class TvListState: ObservableObject {
    @Published var tvs:[TV]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private let tvService: TVServices
    
    init (tvService: TVServices = TVs.shared){
        self.tvService = tvService
    }
    
    func loadTvS(with endpoint : TVListEndpoint) {
        self.tvs = nil
        self.isLoading = false
        self.tvService.fetchTvs(from: endpoint) { [weak self ] (result) in
            guard let self = self else {return}
            self.isLoading = false
            
            switch result{
            case .success(let response):
                self.tvs = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
