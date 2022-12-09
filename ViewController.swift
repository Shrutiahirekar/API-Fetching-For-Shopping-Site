//
//  ViewController.swift
//  IndividualAPIFetching
//
//  Created by Mac on 23/11/22.
//

import UIKit
import SDWebImage


class ViewController: UIViewController{
@IBOutlet weak var TableView: UITableView!
    var arrayUserData = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        fetchingDataFromAPI()
        tableViewDataSourceAndDelegate()
        registerXIB()
         
    }
    func fetchingDataFromAPI()
    {
        let urlString = "https://fakestoreapi.com/products/1"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        var dataTask = session.dataTask(with: request) {
            data,response, error in
            print(response)
            
            let getJsonObject = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
        
                let eachdict = getJsonObject as! [String : Any]
               print(eachdict)
                let productId = eachdict["id"] as! Int
                let productTitle = eachdict["title"] as! String
                let productPrice = eachdict["price"] as! Double
                let productDescription = eachdict["description"] as! String
                let productCategory = eachdict["category"] as! String
                let productImage = eachdict["image"] as! String
                let productRating = eachdict["rating"] as! [String : Any]
                let rate = productRating["rate"] as! Double
                let count = productRating["count"] as! Int
            
                let newObj = Product(id: productId, title: productTitle, price:productPrice, description:productDescription, category:productCategory, image:productImage, rating:Rating(rate: rate, count: count))
            self.arrayUserData.append(newObj)
            
            
            
          
            DispatchQueue.main.async {
                self.TableView.reloadData()
            }
        }
        dataTask.resume()
    }



func registerXIB()
    {
        let nibName = UINib(nibName: "ProductData", bundle: nil)
        TableView.register(nibName, forCellReuseIdentifier: "ProductData")
    }
    func tableViewDataSourceAndDelegate()
    {
        TableView.delegate = self
        TableView.dataSource = self
    }
}
extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableView.dequeueReusableCell(withIdentifier: "ProductData", for: indexPath) as! ProductData
        cell.labelID.text = String(self.arrayUserData[indexPath.row].id)
        cell.labelTitle.text = self.arrayUserData[indexPath.row].title
        cell.labelPrice.text = String(self.arrayUserData[indexPath.row].price)
        cell.labelDescription.text = self.arrayUserData[indexPath.row].description
        cell.labelCategory.text = self.arrayUserData[indexPath.row].category
        cell.labelRating.text = String(self.arrayUserData[indexPath.row].rating.rate)
       let imgUrl = NSURL(string: self.arrayUserData[indexPath.row].image)
        cell.productImage.sd_setImage(with:imgUrl as URL?)
        return cell
        
    }
}
    
            
            
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}
