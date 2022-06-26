//
//  TableViewCell.swift
//  News
//
//  Created by Roshini Painkra on 25/06/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    
    /*
    var articles: Articles? {
        didSet {
            newsTitle.text = articles?.title
            newsAuthor.text = articles?.author
            newsDescription.text = articles?.description
            
            if let imgData =  try? Data(contentsOf: URL(string: articles?.urlToImage ?? "")!) {
                newsImage.image = UIImage(data: imgData)
            }
        }
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
