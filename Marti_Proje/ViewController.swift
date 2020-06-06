//
//  ViewController.swift
//  Marti_Proje
//
//  Created by Yasemin salan on 3.06.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    
    
private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var txtsearch: UITextField!
    
    @IBAction func btnSearch(_ sender: Any) {
      
        deleteAdress(parametre: txtsearch.text!)
         self.tableview.reloadData()
        
      //  refreshControl.endRefreshing()
        self.tableview.addSubview(self.refreshControl)
       
       //  AddressRequest(parametre: txtsearch.text!)
    }
   
    var searchmodelList = [SearchModel]()
    var geometryLocList = [Location]()
 
   
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print("deneme \(photosList.height)")
        tableview.tableFooterView=UIView();
        
        txtsearch.delegate=self
        
         tableview.dataSource = self
        tableview.delegate = self
        
        
        
        
        // Do any additional setup after loading the view.
        /*  let sehir:String = "İstanbul"
        Alamofire.request("https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(sehir)&key=AIzaSyBCmiAi-SgtYNvYzuwwCNjR2rFDtdoOKlo").validate().responseJSON { response in
            switch response.result {
                
            case .success:
                print("Validation Successful)")

                if let json = response.data {
                    do{
                        let data = try JSON(data: json)
                        print("sonuc \(data)")
                      //  let str = data["headers"]["Host"]
                        //print("DATA PARSED: \(str)")
                    }
                    catch{
                    print("JSON Error")
                    }

                }
            case .failure(let error):
                print("errrr \(error)")
            }
        }*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //liste sayısı kdar cell
        return searchmodelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell:HomaPageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomaPageTableViewCell
        
         
        cell.icon.Load(url: searchmodelList[indexPath.row].icon)
        cell.lblname.text=searchmodelList[indexPath.row].name
        cell.lbladress.text = searchmodelList[indexPath.row].formatted_address
      //  print("labelname\(searchmodelList[indexPath.row].name)")
       //  print("labeladres\(lbladres.text)")
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapsStoryboard") as! GoogleMapsViewController
        
        vc.maps_searchmodel_name = String(searchmodelList[indexPath.row].name)
        vc.latitude = geometryLocList[indexPath.row].lat
        vc.longitude = geometryLocList[indexPath.row].lng
        vc.address = searchmodelList[indexPath.row].formatted_address
        vc.image_icon = searchmodelList[indexPath.row].icon
        vc.modalPresentationStyle = .fullScreen
                   self.present(vc,animated: true,completion: nil)
        print("tıklandı \(searchmodelList[indexPath.row].name)")
    }

    
    
    func deleteAdress(parametre:String){
       
        
        
     

        let url = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(parametre)&key=AIzaSyBCmiAi-SgtYNvYzuwwCNjR2rFDtdoOKlo")!
          
        var request = URLRequest(url: url)
        
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
      

           Alamofire.request(request).responseJSON {
               (response) in
               
               switch response.result{
                   
               case .success(let value):
                   let json=JSON(value)
                  
                  
                   
                   for i in 0..<json["results"].count{
                    let searchmodel = SearchModel()
                    let geometry_Loc_model = Location()
               
                    
                    searchmodel.name=json["results"][i]["name"].stringValue
                    searchmodel.formatted_address=json["results"][i]["formatted_address"].stringValue
                    searchmodel.icon=json["results"][i]["icon"].stringValue
                    geometry_Loc_model.lat=json["results"][i]["geometry"]["location"]["lat"].stringValue
                    geometry_Loc_model.lng=json["results"][i]["geometry"]["location"]["lng"].stringValue
                   
                     self.searchmodelList.append(searchmodel)
                    self.geometryLocList.append(geometry_Loc_model)
                    
                    print("lat degeri \(self.geometryLocList[i].lat)")
                    
                   
                   }
             

                   self.tableview.reloadData()
                   
                   
       print("json dan dönen deger \(json)")



                 
                   
                   
               case .failure(let error):
                   print("hatalı")
               }

               
           }

       
    }
    
    
}


//url den gelen resim mi alma
extension UIImageView {



    func Load(url:String) {

        let newUrl = URL(string: url)

        DispatchQueue.global().async { [weak self] in

            if let data = try? Data(contentsOf: newUrl!) {

                if let image = UIImage(data: data) {

                    DispatchQueue.main.async {

                        self?.image = image

                    }

                }

            }

        }

    }
}
