//
//  PlantViewController.swift
//  Happy Ivy
//
//  Created by Keke Wu on 2/9/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData
import Charts

class PlantViewController: UIViewController {
    
    @IBOutlet weak var plantName: UITextField!
    
    
    // User Managed Object
    var plants: [Plant_entity] = []
    var currentPlant: Plant_entity?
    // Bar Chart
    var barChart = BarChartView()
    
    override func viewDidLoad() {
        
        // Get User Data store in user
        let managedContext = PersistenceService.context
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Plant_entity")
        do { plants = try managedContext.fetch(fetchRequest) as! [Plant_entity] }
        catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        currentPlant = plants.last!
        //currentPlant?.increaseAir()
        
        plantName.text = currentPlant!.name // add user's name
        
        super.viewDidLoad()
        // set Bounds for chart
        let viewBounds = self.view.bounds
        let splitRects = viewBounds.divided(atDistance: viewBounds.height / 3, from: CGRectEdge.minYEdge)
        let chartBounds = splitRects.remainder
        barChart = BarChartView(frame: chartBounds)
        barChartUpdate()
        self.view.addSubview(barChart)
        

        // Do any additional setup after loading the view.
    }
    
    func barChartUpdate() {
        let entry1 = BarChartDataEntry(x: 1.0, y: Double((currentPlant?.air)!))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double((currentPlant?.water)!))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double((currentPlant?.sun)!))
        let entry4 = BarChartDataEntry(x: 4.0, y: Double((currentPlant?.love)!))
        let dataSet = BarChartDataSet(values: [entry1, entry2, entry3, entry4], label: "Stuff")
        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
        barChart.chartDescription?.text = "Number of Widgets by Type"
        
        // colors
        dataSet.setColors([NSUIColor.blue, NSUIColor.purple, NSUIColor.orange, NSUIColor.red],
                          alpha: CGFloat(0.35))
        dataSet.valueFont = NSUIFont(name: "Futura", size: 20)!
        
        // styling
        barChart.highlightPerTapEnabled = false
        barChart.highlightPerDragEnabled = false
        
        barChart.drawGridBackgroundEnabled = false
        barChart.drawBordersEnabled = false
        
        barChart.drawValueAboveBarEnabled = true
        
        barChart.leftAxis.enabled = false
        barChart.rightAxis.enabled = false
        
        barChart.xAxis.enabled = false
        
        barChart.legend.enabled = false
        
        barChart.leftAxis.axisMinimum = 0
        barChart.leftAxis.axisMaximum = 100
        
        //All other additions to this function will go here
        
        //This must stay at end of function
        barChart.notifyDataSetChanged()
    }

}
