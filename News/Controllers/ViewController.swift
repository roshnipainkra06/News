//
//  ViewController.swift
//  News
//
//  Created by Roshini Painkra on 25/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var articlesViewModel: ArticlesViewModel!
    let refreshControl = UIRefreshControl()
    private var totalItemList: [Articles]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.title = "News"
        let nib: UINib = UINib.init(nibName:"TableViewCell", bundle: nil)
        newsTableView.register(nib, forCellReuseIdentifier: "NewsTableCell")
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        activityIndicator.startAnimating()
        
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        newsTableView.addSubview(refreshControl)
        callviewModelForUIUpdate()
    }
    
    
    func callviewModelForUIUpdate() {
        self.articlesViewModel = ArticlesViewModel()
        self.articlesViewModel.bindArticleViewModelToController = {
            self.totalItemList = self.articlesViewModel?.articles?.articles
            self.updateTableView()
        }
    }
    
    //Update Tableview when we receive response from api and realod tableview
    func updateTableView() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalItemList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell", for: indexPath) as! TableViewCell
        
        let articles = self.totalItemList[indexPath.row]
        cell.newsTitle.text = "Title: " + articles.title!
        cell.newsAuthor.text = "Author: " + articles.author!
        cell.newsDescription.text = articles.description
        
        if let imgData =  try? Data(contentsOf: URL(string: articles.urlToImage ?? "")!) {
            cell.newsImage.image = UIImage(data: imgData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articles = self.totalItemList[indexPath.row]
        
        let detailView = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailView.url = articles.url
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        callviewModelForUIUpdate()
        self.refreshControl.endRefreshing()
    }

}

