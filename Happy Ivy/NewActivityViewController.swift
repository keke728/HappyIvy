//
//  ActivitySelectorViewController.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    var selectedActivity : String!
    
    // MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource  = self
        
        // Hide tab bar
        //self.tabBarController?.tabBar.isHidden = true
        
        let cellWidth : CGFloat = collectionView.frame.size.width / 8.0
        //let cellheight : CGFloat = collectionView.frame.size.height - 2.0
        let cellSize = CGSize(width: cellWidth , height:cellWidth)
        
        // Get activities instance which contains images
        //let activities = Activities()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 3.0
        
        //collectionView.hitTest(self, with: UIEvent)
        
        /*
        for cell : NewActivityViewCell in collectionView.visibleCells {
            let image: UIImage = activities.PersonalCareAndHealthImages[indexPath.row]!
            cell.activityButton.setImage(image, for: UIControlStateNormal)
        }*/
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Derived from https://www.raywenderlich.com/136159/uicollectionview-tutorial-getting-started
    /**
     Asks your data source object for the number of sections in the collection view.
     
     - Returns: The number of sections in `collectionView`.
     - Parameters:
     - collectionView: The collection view requesting this information.
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2;
    }
    
    /**
     Asks your data source object for the number of items in the specified section.
     
     - Returns: The number of items in `section`.
     - Parameters:
     - collectionView: The collection view requesting this information.
     - section:        An index number identifying a section in `collectionView`. This index value is 0-based.
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    /**
     Asks your data source object for the cell that corresponds to the specified item in the collection view.
     - Returns: A configured cell object. You must not return `nil` from this method.
     - Parameters:
     - collectionView: The collection view requesting this information.
     - indexPath:      The index path that specifies the location of the item.
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityCell", for: indexPath) as! NewActivityViewCell
        
        // Get activities instance which contains images
        let activities = Activities()
        
        // Set image according to section
        // e.g PersonalCareAndHealthImages are in first section.  Lipstick is first element
        // so do set lipstick, use PersonalCareAndHealthImages on section 0 and pick row 0
        switch indexPath.section{
        case 0:
            let image: UIImage = activities.PersonalCareAndHealthImages[indexPath.row]!
            cell.selectedActivityName = activities.PersonalCareAndHealthNames[indexPath.row]
            //cell.selectedActivityType = "water"
            //selectedActivity = activities.LifeAndHabitsNames[indexPath.row]
            cell.activityButton.setImage(image, for: UIControlState.normal)
        case 1:
            let image: UIImage = activities.LifeAndHabitsImages[indexPath.row]!
            //cell.activityButton.imageView.image = image
            cell.selectedActivityName = activities.LifeAndHabitsNames[indexPath.row]
            //cell.selectedActivityType = "air"
            //selectedActivity = activities.LifeAndHabitsNames[indexPath.row]
            cell.activityButton.setImage(image, for: UIControlState.normal)
        case 2:
            let image: UIImage = activities.ExerciseAndEntertainmentImages[indexPath.row]!
            cell.selectedActivityName = activities.ExerciseAndEntertainmentNames[indexPath.row]
            //cell.selectedActivityType = "sun"
        case 3:
            let image: UIImage = activities.SocialAndCommunityImages[indexPath.row]!
            cell.selectedActivityName = activities.SocialAndCommunityNames[indexPath.row]
            //cell.selectedActivityType = "love"
        default:
            print("no section found")
        }
        
        return cell
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        switch indexPath.section{
        case 0:
            let SetActVC = storyboard?.instantiateViewController(withIdentifier: "SetActivity") as! SetActivityViewController
            SetActVC.activitySelected = [indexPath.section, indexPath.row]
            performSegue(withIdentifier: "setActivitySegue", sender: self)
        case 1:
            let SetActVC = storyboard?.instantiateViewController(withIdentifier: "SetActivity") as! SetActivityViewController
            SetActVC.activitySelected = [indexPath.section, indexPath.row]
            performSegue(withIdentifier: "setActivitySegue", sender: self)
        default:
            print("no section found")
        }
    }
    */
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

}

