//
//  Post.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-19.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import Foundation

struct Post: Codable {
    
    var title: String?
    var date: String?
    var imageName: String?
    var numberOfCandidates: Int?
//    var imageUrlString: String?
//    var rating: Double?
//    var date: String?
//    var isFavorite: Bool?
//    var mealDescription: String?
//    var placeLatitude: Double?
//    var placeLongitude: Double?
//    var price: String?
    
    init(title: String, date: String, imageName: String, numberOfCandidates: Int){
//         imageUrlString: String,
//         rating: Double,
//         date: String,
//         isFavorite: Bool,
//         mealDescription: String,
//         placeLatitude: Double,
//         placeLongitude: Double,
//         price: String) {
        
        self.title = title
        self.date = date
        self.imageName = imageName
        self.numberOfCandidates = numberOfCandidates
//        self.imageUrlString = imageUrlString
//        self.rating = rating
//        self.date = date
//        self.isFavorite = isFavorite
//        self.mealDescription = mealDescription
//        self.placeLatitude = placeLatitude
//        self.placeLongitude = placeLongitude
//        self.price = price
    }
}
