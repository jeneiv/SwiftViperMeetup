//
//  ItemListView.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation
import UIKit

class ItemListViewController : UITableViewController {
    private let CellIdentifier = "ItemCellIDentifier"
    weak var itemListPresenter : protocol <ItemListEventHandler, ItemListDataProvider>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Items"
    }
}

extension ItemListViewController : UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListPresenter!.numberOfItems()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        self.setUpCell(cell, index: indexPath.row)
        
        return cell
    }
    
    func setUpCell(cell : UITableViewCell, index : Int) {
        cell.textLabel!.text = itemListPresenter!.titleForItem(index)
    }
}

extension ItemListViewController : UITableViewDelegate {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        itemListPresenter!.handleSelection(indexPath.row)
    }
}

extension ItemListViewController {
    static func itemListView() -> ItemListViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("ItemListView") as! ItemListViewController
        return viewController
    }
}
