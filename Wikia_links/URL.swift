//
//  URL.swift
//  Wikia_links
//
//  Created by Jille van der Weerd on 24/09/2017.
//  Copyright © 2017 De Programmeermeneer. All rights reserved.
//

import Foundation

struct wikiaUrl {
    var wikia : String
    var imageName : String
    
    init(wikia : String, imageName : String) {
        self.wikia = wikia
        self.imageName = imageName
    }
}
