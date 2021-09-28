//
//  TableViewCell.swift
//  MovieDB
//
//  Created by Hongfei Zheng on 9/24/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableImageView: UIImageView!
   
    @IBOutlet weak var titleLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
    }
    
    func setInfo(title: String, popularity: String, date:String){
        titleLabel.text = "\(title)\n\(popularity)\n\(date)"
    }

}
