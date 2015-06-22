//
//  ItemService.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

class ItemService {
    private var items = [Item]()
    
    init() {
        items.append(Item(title : "cucc", description : Optional.None))
        items.append(Item(title : "ize", description : Optional.None))
        items.append(Item(title : "bize", description : Optional.None))
    }
    
    func gardrobe() -> [Item] {
        return items
    }
}