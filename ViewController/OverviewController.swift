//
//  OverviewController.swift
//  ViewController
//
//  Created by Yesi on 16/8/8.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import Cocoa

class OverviewController: NSViewController {

    @IBOutlet weak var decriptionLabel: NSTextField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var titleLabel: NSTextField!
    
    @IBOutlet weak var productImageView: NSImageView!
    
    let numgerFormatter = NSNumberFormatter()
    var selectedProduct:Product?{
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        numgerFormatter.numberStyle = .CurrencyStyle
    }
    override func viewWillAppear() {
        updateUI()
    }
    private func updateUI(){
        if viewLoaded {
            if let product = selectedProduct{
                productImageView.image = product.image
                titleLabel.stringValue =
                    product.title
                priceLabel.stringValue = numgerFormatter.stringFromNumber(product.price)!
                decriptionLabel.stringValue = product.descriptionText
            }
        }
    }
    
}
