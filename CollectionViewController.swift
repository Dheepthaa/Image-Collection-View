//
//  MovieCollectionVi/Users/dheepthaa/Developer/CollectionView/CollectionView/NextViewController.swiftewController.swift
//  CollectionView
//
//  Created by Dheepthaa Anand on 27/11/17.
//  Copyright © 2017 Dheepthaa Anand. All rights reserved.
//

import UIKit
protocol sendPic
{
    func setPic(value: UIImage)
}
class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var img = [UIImage]()
    var name = [String]()
    var delegate: sendPic?
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        img = [#imageLiteral(resourceName: "movie1"),#imageLiteral(resourceName: "eiffel"),#imageLiteral(resourceName: "movie3"),#imageLiteral(resourceName: "mount"),#imageLiteral(resourceName: "movie16"),#imageLiteral(resourceName: "winter"),#imageLiteral(resourceName: "movie4"),#imageLiteral(resourceName: "movie5"),#imageLiteral(resourceName: "movie6"),#imageLiteral(resourceName: "dolphin"),#imageLiteral(resourceName: "movie7"),#imageLiteral(resourceName: "movie10"),#imageLiteral(resourceName: "movie8"),#imageLiteral(resourceName: "movie2"),#imageLiteral(resourceName: "movie9"),#imageLiteral(resourceName: "movie15"),#imageLiteral(resourceName: "lily"),#imageLiteral(resourceName: "movie17"),#imageLiteral(resourceName: "movie13"),#imageLiteral(resourceName: "flower"),#imageLiteral(resourceName: "movie12"),#imageLiteral(resourceName: "pic")]
         name =  ["Finding Nemo","Eiffel","Tangled","Mountains","Farm","Winter","Justice League","The Hobbit","Titanic","Dolphin","Inception","Small","Harry Potter","Frozen","City","View","Lily","Sofa","Moon","Flower","Happy","Panaroma"]
        if UserDefaults.standard.string(forKey: "sort") == " Increasing order of size "
        {
            let combined = zip(img, name).sorted(by: {
                let width1 = $0.0.size.width
                let width2 = $1.0.size.width
                let height1 = $0.0.size.height
                let height2 = $1.0.size.height 
                return width1*height1 < width2*height2
            })
            
            img = combined.map {$0.0}
            name = combined.map {$0.1}
            
        }
        
        if UserDefaults.standard.string(forKey: "sort") == " Decreasing order of size "
        {
            let combined = zip(img, name).sorted(by: {$0.0.size.height*$0.0.size.width > $1.0.size.height*$1.0.size.width})
            img = combined.map {$0.0}
            name = combined.map {$0.1}
        }
       
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegate = self //set ViewController as delegate for CustomLayout
        }
        
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.img.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.image.image = img[indexPath.row]
        cell.label.text = name[indexPath.row]
        cell.label.numberOfLines = 1
        cell.label.minimumScaleFactor = 0.5
        cell.label.adjustsFontSizeToFitWidth = true
        let borderColor = UIColor.black.cgColor
        let borderWidth = 1
        cell.layer.borderColor = borderColor
        cell.layer.borderWidth = CGFloat(borderWidth)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let resultViewController = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        self.delegate = resultViewController
        delegate?.setPic(value: img[indexPath.row])
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
}

extension CollectionViewController: CustomLayoutDelegate
{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return min(((img[indexPath.item].size.height)+70),500)
    }
    
    func collectionView(_ collectionView: UICollectionView, widthForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        if ((img[indexPath.item].size.height)+70) > 500
        {
            return (((img[indexPath.item].size.width)*500)/((img[indexPath.item].size.height)+70))
        }
        return ((img[indexPath.item].size.width))
    }
    
    
}

