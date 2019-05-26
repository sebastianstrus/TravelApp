//
//  Voucher.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-26.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import Foundation

struct Voucher: Codable {
    
    var title: String?
    var subtitle: String?
    var date: String?
    var imageName: String?
    
    init(title: String, subtitle: String, date: String, imageName: String){
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.imageName = imageName
    }
}



struct VoucherTemp: Codable {
    
    var title: String?
    
    init(title: String){
        self.title = title

    }
}
