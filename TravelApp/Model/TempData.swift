//
//  TempData.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-21.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import Foundation


class TempData {
    
    class func getPosts() -> [Post]{
        
        print("getPosts")
        
        return [
            Post(title: "Poland", date: "2019.06.23-2019.06.17", imageName: "profile0", numberOfCandidates: 0),
            Post(title: "Panama", date: "Now!", imageName: "profile1", numberOfCandidates: 3),
            Post(title: "Mallorca", date: "2019.06.22-2019.06.29", imageName: "profile2", numberOfCandidates: 5),
            Post(title: "Malta", date: "Now!", imageName: "profile3", numberOfCandidates: 1),
            Post(title: "Thailand", date: "2020.01.05-2020.01.26", imageName: "profile4", numberOfCandidates: 4),
            Post(title: "Tenerife", date: "2019.10.05-2019.10.19", imageName: "profile5", numberOfCandidates: 8),
            Post(title: "Canary Islands", date: "2019.08.01-2019.08.15", imageName: "profile6", numberOfCandidates: 0),
            Post(title: "Svalbard", date: "2019.06.25-2019.06.17", imageName: "profile7", numberOfCandidates: 4),
            Post(title: "Mexico", date: "2019.07.23-2019.07.17", imageName: "profile8", numberOfCandidates: 0),
            Post(title: "Madagascar", date: "2019.09.23-2019.09.17", imageName: "profile9", numberOfCandidates: 2),
            Post(title: "Brazil", date: "2019.08.23-2019.08.1", imageName: "profile10", numberOfCandidates: 1)
        ]
    }
    
    class func getVouchers() -> [VoucherTemp]{
        
        print("getVouchers")
        
        return [
            VoucherTemp(title: "Booking 10$", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Flixbus 20PLN", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
            VoucherTemp(title: "Voucher1", info: "Use it 5 times", date: Int64(Date().timeIntervalSince1970)),
        ]
    }
}
