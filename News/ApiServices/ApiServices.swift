//
//  ApiServices.swift
//  News
//
//  Created by Roshini Painkra on 26/06/22.
//

import Foundation


class APIServices: NSObject {
    
    private let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d19ec9c915eb41308c0c3a5dd0fefc2c")!
    
    var articles: Articles?
    //Fetch all the data from API using json Decoder
    
    func getFullArticleList(completion: @escaping (Result<ArticlesModel, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let articles = try JSONDecoder().decode(ArticlesModel.self, from: data)
                    completion(.success(articles))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}


