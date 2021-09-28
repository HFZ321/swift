//
//  ApiManager.swift
//  MovieDB
//
//  Created by Hongfei Zheng on 9/27/21.
//

import UIKit
protocol passData {
    func retrieveData()
}
class ApiManager{
    var delegate: passData?
    static let shared = ApiManager()
    func getmoviewListFromServer(url: String, completionHandle: @escaping (MovieList) -> ()){
        let url = URL.init(string: url)!
        let objUrlSession = URLSession.shared
        let jsondecoder = JSONDecoder()
        objUrlSession.dataTask(with: url) {Data, URLResponse, Error in
            if let data = Data{
                let movieList = try! jsondecoder.decode(MovieList.self, from: data)
                completionHandle(movieList)
            }
            
        }.resume()
    }
    
}
// create object of urlsession
// 2. call method of datatask
// 3. pass url
// 4. receives value
// 5. covert jason to model using jsondecoder
