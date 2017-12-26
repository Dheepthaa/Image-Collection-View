//
//  ViewController.swift
//  CollectionView
//
//  Created by Dheepthaa Anand on 26/12/17.
//  Copyright © 2017 Dheepthaa Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sortby: UILabel!
    @IBOutlet weak var minrow: UIButton!
    @IBOutlet weak var dec: UIButton!
    @IBOutlet weak var inc: UIButton!
    @IBOutlet weak var order: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        #imageLiteral(resourceName: "bg").draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        sortby.layer.borderColor = UIColor.white.cgColor
        sortby.layer.borderWidth = 5.0
        minrow.layer.cornerRadius = minrow.frame.height/2
        minrow.clipsToBounds = true
        minrow.layer.borderColor = UIColor.white.cgColor
        minrow.layer.borderWidth = 2.0
        dec.layer.cornerRadius = dec.frame.height/2
        dec.clipsToBounds = true
        dec.layer.borderColor = UIColor.white.cgColor
        dec.layer.borderWidth = 2.0
        inc.layer.cornerRadius = inc.frame.height/2
        inc.clipsToBounds = true
        inc.layer.borderColor = UIColor.white.cgColor
        inc.layer.borderWidth = 2.0
        order.layer.cornerRadius = order.frame.height/2
        order.clipsToBounds = true
        order.layer.borderColor = UIColor.white.cgColor
        order.layer.borderWidth = 2.0
    }
   
    @IBAction func push(_ sender: UIButton) {
        UserDefaults.standard.set(sender.currentTitle, forKey: "sort")
        let resultViewController = storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
