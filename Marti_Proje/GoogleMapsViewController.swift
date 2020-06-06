//
//  GoogleMapsViewController.swift
//  Marti_Proje
//
//  Created by Yasemin salan on 4.06.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

import GoogleMaps

class GoogleMapsViewController: UIViewController{
var maps_searchmodel_name = ""
var address = ""
var latitude = ""
var longitude = ""
    var image_icon = ""
    
  
    @IBOutlet weak var google_maps: GMSMapView!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("gönderilen değer \(maps_searchmodel_name)")
        print("lat degeri \(latitude)")
        print("lng degeri \(longitude)")
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(latitude)!,longitude: Double(longitude)!, zoom: 6.0)
        google_maps.camera = camera
        self.show_marker(position: google_maps.camera.target)
      //  self.google_maps.delegate = self
        // Do any additional setup after loading the view.
    }
    func show_marker(position : CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.title = maps_searchmodel_name
        marker.snippet = address
        marker.map = google_maps
     
        
        
    }
 
   
   

}


/*extension GoogleMapsViewController : GMSMapViewDelegate {
  
 
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("marker a tıklandı")
    }
    
    func mapView(_ mapView:GMSMapView, markerInfoWindow marker:GMSMarker) -> UIView? {
        
        let view = UIView(frame: CGRect.init(x:0,y:0,width: 200,height: 100))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let title = UILabel(frame: CGRect.init(x:8, y:8, width: view.frame.width-16,height: 15))
        title.text = address
        view.addSubview(title)
        return view
        
    }
    
}

*/
