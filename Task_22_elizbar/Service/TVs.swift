//
//  TVs.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import Foundation


class TVs : TVServices {
    func fetchTV(id: Int, completion: @escaping (Result<TV, TVError>) -> ()) {
        guard let url = URL(string: "\(baseURL)/tv/\(id)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url,indicator: 2, completion: completion)
    }
    
    func fetchTvs(from endpoint: TVListEndpoint, completion: @escaping (Result<TVResponse, TVError>) -> ()) {
        guard let url = URL(string: "\(baseURL)/tv/\(endpoint.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url,indicator: 1, completion: completion)
    }
    
    static let shared = TVs()
    private init () {}
    
    private let apiKey = "69f3298313159cd426f1593b628d72ca"
    private let baseURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utility.jsonDecoder
    
    
    private func loadURLAndDecode<T: Decodable>(url: URL,indicator: Int, parameters: [String: String]? = nil,completion: @escaping (Result<T, TVError>) -> ()){
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let parameters = parameters {
            queryItems.append(contentsOf: parameters.map{URLQueryItem(name: $0.key, value: $0.value)})
        }
        urlComponents.queryItems = queryItems
        
        guard let finalUrl = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalUrl) {[weak self] data, response, error in
            guard let self = self else {return}
            if error != nil {
                self.runCompletionOnMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
//            guard let httpResponse = response as? HTTPURLResponse, 200...300 -= httpResponse.statusCode else {
//                self.runCompletionOnMainThread(with: .failure(.invalidResponse), completion: completion)
//                return
//            }
            
            guard let data = data else {
                self.runCompletionOnMainThread(with: .failure(.noData), completion: completion)
                return
            }
            var result: TVResponse?
            var tvResult: TV
            do {
                result = try JSONDecoder().decode(TVResponse.self,from: data)
            } catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else{
                return
            }
            
            print(json.results[0].name)
        }.resume()
        
    }
    
    private func runCompletionOnMainThread<T: Decodable>(with result: Result<T, TVError>, completion: @escaping (Result<T,TVError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
}
