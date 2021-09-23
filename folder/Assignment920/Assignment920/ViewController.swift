//
//  ViewController.swift
//  Assignment920
//
//  Created by Hongfei Zheng on 9/20/21.
//

import UIKit

class ViewController: UIViewController {
    var Brands = [carMakers]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let detail = "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods"
        let car1 = carInfo(description: "A nice car", price: 40000, carImage: UIImage.init(named: "bwm1") ?? UIImage.init(), details: detail)
        let car2 = carInfo(description: "A nice car", price: 40000, carImage: UIImage.init(named: "bwm2") ?? UIImage.init(), details: detail)
        let car3 = carInfo(description: "A nice car", price: 40000, carImage: UIImage.init(named: "bwm3") ?? UIImage.init(), details: detail)
        let car4 = carInfo(description: "A nice car", price: 40000, carImage: UIImage.init(named: "bwm4") ?? UIImage.init(), details: detail)
        let carMaker1 = carMakers(company: "BWM", cars: [car1,car2,car3,car4])
        
        let car5 = carInfo(description: "An good car", price: 44000, carImage: UIImage.init(named: "audi1") ?? UIImage.init(), details: detail)
        let car6 = carInfo(description: "An good car", price: 44000, carImage: UIImage.init(named: "audi2") ?? UIImage.init(), details: detail)
        let car7 = carInfo(description: "An good car", price: 44000, carImage: UIImage.init(named: "audi3") ?? UIImage.init(), details: detail)
        let car8 = carInfo(description: "An good car", price: 44000, carImage: UIImage.init(named: "audi4") ?? UIImage.init(), details: detail)
        let carMaker2 = carMakers(company: "Audi", cars: [car5,car6,car7,car8])
        Brands = [carMaker1,carMaker2]
        
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Brands[section].cars.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        Brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        let section = indexPath.section
        let row = indexPath.row
        cell?.imageView1?.image = Brands[section].cars[row].carImage
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        let description = Brands[section].cars[row].description
        let price = Brands[section].cars[row].price
        let alert = UIAlertController.init(title: "Car Info", message: "Description:\(description) \n Cost: \(price)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "More Info?", style: .default, handler: { _ in
            let st = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            if let v = vc{
                v.image = self.Brands[section].cars[row].carImage
                v.text = self.Brands[section].cars[row].details
                v.company = self.Brands[section].company
                self.navigationController?.pushViewController(v, animated: true)
            }
        }))
        present(alert, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(Brands[section].company)"
    }
    
    
}

struct carInfo {
    let description: String
    let price: Int
    let carImage: UIImage
    let details: String
}
struct carMakers {
    let company: String
    let cars: [carInfo]
}
