//
//  ItemListWireFrame.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation
import UIKit

protocol ItemListRouter : class {
    
}

class ItemListWireFrame : ItemListRouter {
    private (set) var itemListView : ItemListViewController
    private var itemListPresenter : ItemListPresenter
    
    init() {
        itemListView = ItemListViewController.itemListView()
        itemListPresenter = ItemListPresenter(view: itemListView)
        itemListPresenter.itemListWireFrame = self
        itemListView.itemListPresenter = itemListPresenter
    }
}