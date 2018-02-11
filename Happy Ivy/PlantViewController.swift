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
    var plantImageView: UIImageView!
    
    
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
        // status value testing
        for _ in 0..<15 {
            currentPlant?.increaseAir()
            currentPlant?.increaseSun()
            currentPlant?.increaseLove()
            currentPlant?.increaseWater()
        }
        
        plantName.text = currentPlant!.name // add user's name
        
        super.viewDidLoad()
        
        // set Bounds for chart
        let viewBounds = self.view.bounds.divided(atDistance: 48, from: CGRectEdge.maxYEdge).remainder
        let splitRects = viewBounds.divided(atDistance: viewBounds.height * 2 / 3, from: CGRectEdge.minYEdge)
        let chartBounds = splitRects.remainder
        barChart = BarChartView(frame: chartBounds)
        barChartUpdate()
        self.view.addSubview(barChart)
        
        // plant image setup
        let center = CGPoint(x: viewBounds.width / 2 - 50, y: viewBounds.height / 2 - 60)
        let size = CGSize(width: 100, height: 120)
        plantImageView = UIImageView(frame: CGRect(origin: center, size: size))
        setPlantImage()
        self.view.addSubview(plantImageView)
        

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
        barChart.chartDescription?.text = ""
        
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
    
    func setPlantImage() {
        let avg = ( (currentPlant?.air)! + (currentPlant?.water)! +
            (currentPlant?.sun)! + (currentPlant?.love)! ) / 4
        if avg < 33 {
            plantImageView.image = UIImage(named: "Plant1")
        }
        else if avg < 66 {
            plantImageView.image = UIImage(named: "Plant2")
            
        } else {
            plantImageView.image = UIImage(named: "Plant3")
        }
    }

}
