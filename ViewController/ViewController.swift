//
//  ViewController.swift
//  ViewController
//
//  Created by Yesi on 16/8/8.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    // Properties
    @IBOutlet weak var productsButton: NSPopUpButton!
    // Array
    private var products = [Product]()
    var selectedProduct: Product!
    private var overviewViewController: OverviewController!
    private var detailViewController: DetailViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = NSBundle.mainBundle().pathForResource("Products", ofType: "plist") {
            products = Product.productsList(filePath)
        }
        productsButton.removeAllItems()
        for product in products {
            productsButton.addItemWithTitle(product.title)
        }
        
        selectedProduct = products[0]
        productsButton.selectItemAtIndex(0)
    
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        let tabViewController = segue.destinationController
        for controller in tabViewController.childViewControllers{
            if controller is OverviewController {
                overviewViewController = controller as! OverviewController
                overviewViewController.selectedProduct = selectedProduct
            }else{
                // More
                detailViewController = controller as! DetailViewController
                detailViewController.selectedProduct = selectedProduct
            }
        }
    }

    @IBAction func valueChanged(sender: NSPopUpButton) {
        
        if let bookTitle = sender.selectedItem?.title,
            let index = products.indexOf({$0.title == bookTitle})
        {
            selectedProduct = products[index]
            overviewViewController.selectedProduct = selectedProduct
            detailViewController.selectedProduct = selectedProduct

        }
    }
}

