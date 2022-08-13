//
//  TVStub.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import Foundation

extension TV {
    static var stubbedTvs: [TV]{
        let response : TVResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "TV_list")
        return response!.results

    }
    static var stubbedTV : TV {
        stubbedTvs[0]
    }
}

extension Bundle {
    func loadAndDecodeJSON<T: Decodable>(filename: String) throws -> T? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utility.jsonDecoder
        let decodedModel = try jsonDecoder.decode(T.self, from: data)
        return decodedModel
    }
}


