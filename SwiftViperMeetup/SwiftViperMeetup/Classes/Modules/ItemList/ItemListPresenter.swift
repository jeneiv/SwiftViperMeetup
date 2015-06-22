//
//  ItemListPresenter.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

protocol ItemListEventHandler : class {
    func handleSelection(index : Int)
}

protocol ItemListDataProvider : class {
    func numberOfItems() -> Int
    func titleForItem(index: Int) -> String
}

class ItemListPresenter {
    weak var itemListWireFrame : ItemListRouter?
    weak var itemListView : ItemListViewController?
    
    private var itemService = ItemService()
    
    init(view : ItemListViewController) {
        itemListView = view
    }
}

extension ItemListPresenter : ItemListDataProvider {
    func numberOfItems() -> Int {
        return itemService.gardrobe().count
    }
    
    func titleForItem(index: Int) -> String {
        let item = itemService.gardrobe()[index]
        return item.title
    }
}

extension ItemListPresenter : ItemListEventHandler {
    func handleSelection(index : Int) {
        println("Item at #\(index) selected")
    }
}