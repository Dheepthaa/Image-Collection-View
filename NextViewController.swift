//
//  NextViewController.swift
//  CollectionView
//
//  Created by Dheepthaa Anand on 07/12/17.
//  Copyright © 2017 Dheepthaa Anand. All rights reserved.
//

import UIKit

class NextViewController: UIViewController,sendPic {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var w: NSLayoutConstraint!
    @IBOutlet weak var h: NSLayoutConstraint!
    @IBOutlet weak var pic: UIImageView!
    func setPic(value: UIImage)
    {
        var width: CGFloat
        width = view.bounds.width
        let height = (value.size.height*width)/value.size.width
        print(height)
        print(width)
        self.h.constant = height
        self.w.constant = width
        pic.image = value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
