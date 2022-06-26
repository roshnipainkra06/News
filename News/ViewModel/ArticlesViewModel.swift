//
//  ArticlesViewModel.swift
//  News
//
//  Created by Roshini Painkra on 26/06/22.
//

import Foundation

class ArticlesViewModel: NSObject {
    
    private var apiService: APIServices!
    private(set) var articles: ArticlesModel! {
        didSet {
            self.bindArticleViewModelToController()
        }
    }
    //data binding in View Model to controler
    var bindArticleViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIServices()
        callGetArticles()
    }
    
    //Fetch list of Items from The API
    func callGetArticles() {
    }
}
