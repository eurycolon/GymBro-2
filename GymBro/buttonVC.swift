//
//  buttonVC.swift
//  GymBro
//
//  Created by Eury Colon on 4/6/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
import Charts
import RealmSwift




class ButtonVC: UIViewController, ChartViewDelegate, AddWeight,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var weightLossChart: LineChartView!
    
    @IBOutlet weak var caloriesChart: PieChartView!
   
    var tableDate: [String] = ["Test"]
    
    @IBOutlet weak var savedCals: UILabel!
    

    @IBOutlet weak var noCoachellaForMe: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        weightLossChart.delegate = self
        weightLossChart.chartDescription?.text = "Weight shown on a day-by-day basis"
        weightLossChart.noDataText = "Please input your weight above"
        weightLossChart.drawGridBackgroundEnabled = true
        weightLossChart.gridBackgroundColor = UIColor.darkGray
      
        
        //noCoachellaForMe.text = foodDiary.inputCals.text!
  
     
        
        
        
        
    }
    

   
    
    func didAddWeight(weight: String, days: [String]) {
        
        tableDate.append(weight)
        tableView.reloadData()
     
        
        let days = days
        let newWeight = Double(weight)
      
        
        var yVals1: [ChartDataEntry] = []
        for i in 0..<days.count {
            yVals1.append(ChartDataEntry(x: Double(i), y: newWeight!))
           
        }
        
        
        let set1 = LineChartDataSet(values: yVals1, label: "Weight Loss")
        set1.axisDependency = .left
        set1.setColor(UIColor.red.withAlphaComponent(0.5))
        set1.setCircleColor(UIColor.red)
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.red
        set1.highlightColor = UIColor.white
        set1.drawCircleHoleEnabled = true
        
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        let data: LineChartData = LineChartData(dataSets: dataSets)
        weightLossChart.data = data
        
}
    
    func getVisitorCountsFromDatabase() -> Results<ChartData> {
        do {
            let realm = try Realm()
            return realm.objects(ChartData.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateChartWithData() {
        var dataEntries: [ChartDataEntry] = []
        let weightLossCounts = getVisitorCountsFromDatabase()
        for i in 0..<weightLossCounts.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(weightLossCounts.count))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Weight Loss")
        let chartData = LineChartData(dataSet: chartDataSet)
        weightLossChart.data = chartData
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDate.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weightCell", for: indexPath)
        cell.textLabel?.text = "Current Weight:" + " " + tableDate[indexPath.row]
        return cell
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inputWeight" {
            let destination = segue.destination as! WeightLossPopUp
            destination.delegate = self
            
        }
    }

    
    
    
    
    
}
