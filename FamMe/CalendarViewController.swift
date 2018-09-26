//
//  CalendarViewController.swift
//  FamMe
//
//  Created by C4Q on 9/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

 
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var Calendar: UICollectionView!
    
    let date = Date()
    
    let Months = ["January", "February","March","April","May","June","July","August","September","October","November","December"]
    let DaysOfMonth = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    var DaysInMonths = [31,28,31,30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var currentMonth = String()
    
    //The number of "empty cells" at the start of the current month
    var numberOfEmptyBox = Int()
    
    var nextNumberOfEmptyBox = Int()
    var previousNumberOfEmptyBox = Int()
    var direction = 0 // =0 if we are at the current month, =1 if we are in a future month, =-1 if we are in a past month
    var positionIndex = 0 // here we will store the above vars of the empty boxes
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMonth = Months[monthIndex] // month = 8
        getStartDateDayPosition()
        Calendar.reloadData()
        MonthLabel.text = "\(currentMonth) \(year)"
   
        print("month" , monthIndex)
        print(weekdays)
        print("today is " , date)
        print("weekday" , weekdayIndex)
        print("day", dayIndex)
        
    }
    
    
    
    @IBAction func Next(_ sender: UIButton) {
        direction = 1
        switch currentMonth {
        case "December":
            year += 1
            getStartDateDayPosition()
            
            monthIndex = 0
            currentMonth = Months[monthIndex]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        default:
            getStartDateDayPosition()
            
            monthIndex += 1
            currentMonth = Months[monthIndex]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
        
    }
    
    @IBAction func Back(_ sender: UIButton) {
        direction = -1
        switch currentMonth {
        case "January":
            year -= 1
            getStartDateDayPosition()
            
            monthIndex = 11
            currentMonth = Months[monthIndex]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        default:
            getStartDateDayPosition()
            
            monthIndex -= 1
            currentMonth = Months[monthIndex]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }

    func getStartDateDayPosition() { //this function gives us the number of empty cells
        switch direction {
        case 0:         // if at current month
            switch dayIndex {
            case 0...6:
                numberOfEmptyBox = weekdayIndex - dayIndex   // if < 0, then numberOfEmptyBox = dayIndex -                 // weekdayIndex
            case 7...13:
                numberOfEmptyBox = weekdayIndex - (dayIndex - 7)
            case 14...20:
                numberOfEmptyBox = weekdayIndex - (dayIndex - 14)
            case 21...27:
                numberOfEmptyBox = weekdayIndex - (dayIndex - 21)
            case 28...30:
                numberOfEmptyBox = weekdayIndex - (dayIndex - 28)
            default:
                break
            }
            if numberOfEmptyBox < 0 {
                numberOfEmptyBox = numberOfEmptyBox + 7
            }
            print("numberOfEmptyBox", numberOfEmptyBox)
            positionIndex = numberOfEmptyBox // reset postionIndex to next showing month's numberOfEmpty
            
        case 1:                     // if at a future month
            nextNumberOfEmptyBox = (positionIndex + DaysInMonths[monthIndex]) % 7
            positionIndex = nextNumberOfEmptyBox // positionIndex always remain as the numberIndex user is
                                                 // seeing on the screen
         
        case -1:                    // if at a past month
            
            if monthIndex == 0 { // current month is "January" then reset month = 12
                monthIndex = 12
            }
            previousNumberOfEmptyBox = 7 - (DaysInMonths[monthIndex - 1] - positionIndex ) % 7
                                         // *** notice here using previous DayInMonths to find out the previous number of empty box.***
            if previousNumberOfEmptyBox == 7 {
                previousNumberOfEmptyBox = 0
            }
            positionIndex = previousNumberOfEmptyBox
          
        default:
            fatalError()
        }
    }


}
extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return DaysInMonths[monthIndex] + positionIndex // it returns the number of days in the month + the number of "empty boxes" based on the direction we are going
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! DateCollectionViewCell
        cell.isHidden = false
        cell.backgroundColor = .clear
        cell.DateLabel.text = "\(indexPath.row + 1 - positionIndex)"

        if Int(cell.DateLabel.text!)! < 1 {  //hides every cell that is smaller than 1
            cell.isHidden = true
        }
        
        return cell
        
        
        
    }
    
}
