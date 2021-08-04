//
//  StatsViewController.swift
//  QuickMaths
//
//  Created by User on 6/30/21.
//the array size isn't done

import UIKit
import Charts
import AVKit
class StatsViewController: UIViewController {
    var numbers : [Double] = []
    var player = AVAudioPlayer()
    @IBOutlet weak var chtChart: LineChartView!
    
    override func viewDidAppear(_ animated: Bool) {
        playsound(name: "energy")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        numbers = ScoreManager.scoreManager.fetchScore()
        var str = ""
        for number in numbers {
            str = str + " " + String(number)
        }
        //self.labl.text = str
        //print (score)
        //print(ScoreManager.scoreManager.score)
        //numbers = ScoreManager.scoreManager.score
        updateGraph()

        // Do any additional setup after loading the view.
    }
    
//    func resetBtnTpd(){
//        ScoreManager.scoreManager.reset()
//    }
    func didRecieveMemoryWarning() {
        didReceiveMemoryWarning()

    }
    
        

//    @IBAction func btbutton(_ sender: Any) {
//        let input = Double(txtTextBox.text!)
//        numbers.append(input!)
//        updateGraph()
//    }
    func playsound (name: String){
        let path = Bundle.main.path(forResource: name, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            player.play()
        }catch{}
    }
    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        print(numbers)
        //here is the for loop
        for i in 0..<numbers.count {

            let value = ChartDataEntry(x: Double(i + 1), y: Double(numbers[i])) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Score") //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue
        line1.entriesForXValue(1)
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        

        chtChart.data = data //finally - it adds the chart data to the chart and causes an update
        chtChart.chartDescription?.text = "Statistics" // Here we set the description for the graph
    }
}
