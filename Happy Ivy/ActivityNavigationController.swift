//
//  ActivityNavigationController.swift
//  Happy Ivy
//
//  Created by Volta on 2/11/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

class ActivityNavigationController: UINavigationController {
    
    var NewSelectedActivity : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change navigation bar font
        //UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "AveriaSansLibre-Regular", size: 14.0)!], for: .normal)
        //self.navigationBar.backItem?.set
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
