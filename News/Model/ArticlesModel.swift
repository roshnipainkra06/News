//
//  ArticlesModel.swift
//  News
//
//  Created by Roshini Painkra on 26/06/22.
//

import Foundation

struct ArticlesModel: Decodable {
    let articles : [Articles]
}

//Model created having different properties
struct Articles: Decodable {
    
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case urlToImage = "urlToImage"
        case url = "url"
    }
}
