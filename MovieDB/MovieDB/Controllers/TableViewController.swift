//
//  ViewController.swift
//  MovieDB
//
//  Created by Hongfei Zheng on 9/24/21.
//

import UIKit

class TableViewController: UIViewController{
        
    @IBOutlet weak var tableView: UITableView!
    var objMovieList: MovieList?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        ApiManager.shared.delegate = self
        ApiManager.shared.delegate?.retrieveData()
//        ApiManager.shared.getmoviewListFromServer(url: constant.url.rawValue) { MovieList in
//            self.objMovieList  = MovieList
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//            
//        }
        
       
    }

}
//faster
//let imgUrlString = "https://www.themoviedb.org/t/p/original" + (movie?.backdrop_path ?? "")
//        if let imgDataUrl = URL(string: imgUrlString) {
//            do {
//                let imgData = try Data(contentsOf: imgDataUrl as URL)
//                movieCell?.movieCellImage.image = UIImage.init(data: imgData)
//            } catch {
//                print("uhoh")
//            }
//        }

extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objMovieList?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        let movie = objMovieList?.results[indexPath.row]
        cell?.tableImageView.imageFromServerURL(movie?.backdrop_path ?? "")
        cell?.setInfo(title: movie?.title ?? "", popularity: "\(movie?.popularity ?? 0) ", date: movie?.release_date ?? "")
        return cell ?? UITableViewCell()
    }
}

extension TableViewController: passData{
    func retrieveData() {
        ApiManager.shared.getmoviewListFromServer(url: constant.url.rawValue) { MovieList in
            self.objMovieList  = MovieList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    }
}
}

