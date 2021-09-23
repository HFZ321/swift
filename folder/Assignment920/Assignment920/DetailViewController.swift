//
//  DetailViewController.swift
//  Assignment920
//
//  Created by Hongfei Zheng on 9/20/21.
//

import UIKit

class DetailViewController: UIViewController {
    var image: UIImage?
    var text: String?
    var company: String?
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var labelView1: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView1.image = image
        labelView1.text = text
        companyLabel.text = company
    }

}
