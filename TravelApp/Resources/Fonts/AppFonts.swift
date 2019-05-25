//
//  AppFonts.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

struct AppFonts {
    static let TITLE_FONT = UIFont(name: "LuckiestGuy-Regular", size: Device.IS_IPHONE ? 90 : 180)
    static let SUBTITLE_FONT = UIFont(name: "Oswald-Medium", size: Device.IS_IPHONE ? 40 : 80)
    static let BTN_FONT = UIFont(name: "SeymourOne", size: Device.IS_IPHONE ? 26 : 52)
    static let NAV_BAR_FONT = UIFont(name: "Georgia-Bold", size: Device.IS_IPHONE ? 24 : 40)
    static let LIST_CELL_FONT = UIFont(name: "Boogaloo-Regular", size: 26)
    static let LIST_CELL_FONT2 = UIFont(name: "LibreBaskerville-Bold", size: 12)
    static let LIST_CELL_DISTANCE_FONT = UIFont.boldSystemFont(ofSize: Device.IS_IPHONE ? 13 : 26)
    static let CHAT_FONT = UIFont.systemFont(ofSize: 16)
}
