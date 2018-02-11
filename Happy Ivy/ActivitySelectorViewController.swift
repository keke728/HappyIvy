//
//  ActivitySelectorViewController.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

class ActivitySelectorViewController: UIViewController, UICollectionViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Actions
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource  = self

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
        
        /// Only one section
        return 3;
    }
    
    /**
     Asks your data source object for the number of items in the specified section.
     
     - Returns: The number of items in `section`.
     - Parameters:
     - collectionView: The collection view requesting this information.
     - section:        An index number identifying a section in `collectionView`. This index value is 0-based.
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        /// Get the number of simulations
        //let simCount = fetcher.count
        
        /// If there are simulations return the correct amount
        //if ( simCount > 0 ) {
        //    collectionView.backgroundView = nil
        return 3
        //}
        /*
        if ( fetcher.favoriteFilter ) {
            setBackgroundText("Your favorite simulations will appear here!")
        }
        else if ( fetcher.isFiltering ) {
            setBackgroundText("No results")
        }*/
        
        //return 0
    }
    
    /**
     Asks your data source object for the cell that corresponds to the specified item in the collection view.
     - Returns: A configured cell object. You must not return `nil` from this method.
     - Parameters:
     - collectionView: The collection view requesting this information.
     - indexPath:      The index path that specifies the location of the item.
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityCell", for: indexPath) as! ActivityCollectionViewCell
        
        let image: UIImage = UIImage(named: "tv")!
        
        cell.activityButton.imageView?.image = image
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*
        if segue.identifier == "setActivitySegue" {
            
            guard let webViewController = segue.destination as? WebViewController else {
                
                fatalError("Unexpected destination: \(segue.destination)")
                
            }
            
            guard let selectedSimulationCell = sender as? SimulationTableViewCell else {
                
                fatalError("Unexpected sender: \(String(describing: sender))")
                
            }
            
            guard let indexPath = tableView.indexPath(for: selectedSimulationCell) else{
                
                fatalError("The selected cell is not being displayed correctly by the table")
            }
            
            let selectedSimulation = simulations[indexPath.row]
            
            webViewController.simulation = selectedSimulation
            
        }
        */
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ActivitySelectorViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = CGFloat(1 * (3 + 1))
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 4
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

