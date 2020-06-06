//
//  SearchModel.swift
//  Marti_Proje
//
//  Created by Yasemin salan on 3.06.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import Foundation

class SearchModel{
    
    var results:String = ""
    var bussiness_status:String = ""
    var formatted_address:String = ""
    var geometry = [Location]()
    var viewport = [Location]()
    var icon:String = ""
    var id:String = ""
    var name:String = ""
    var photos = [photoss]()
    var place_id :String = ""
    var rating : String = ""
    var reference : String = ""
    var types :String = ""
    var user_ratings_total:String = ""
}
class Location{
    var lat:String = ""
    var lng:String = ""
}
class viewport {
    
    var northeast:[Location] = []
    var southwest:[Location] = []
}

class photoss{
    var height:String = ""
    var html_attributions:String = ""
    var photo_reference:String = ""
    var width:String = ""
}
