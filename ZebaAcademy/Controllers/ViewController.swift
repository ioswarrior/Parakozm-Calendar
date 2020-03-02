import UIKit
import Firebase

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet weak var buttonPlusHide: UIButton!
    
    let months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    let daysOfMonth = ["Monday","Thuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var daysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var direction = 0
    
    var leapYearCounter = 2
    
    var dayCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMonth = months[month]
        monthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
    }
    
    @IBAction func back(_ sender: Any) {
        switch currentMonth {
        case "January":
            direction = -1
            
            month = 11
            year -= 1
            
            if leapYearCounter > 0{
                leapYearCounter -= 1
            }
            if leapYearCounter == 0{
                daysInMonths[1] = 29
                leapYearCounter = 4
            } else {
                daysInMonths[1] = 28
            }
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendar.reloadData()
            
        default:
            direction = -1
            
            month -= 1
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendar.reloadData()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        switch currentMonth {
        case "December":
            direction = 1
            
            month = 0
            year += 1
            
            if leapYearCounter < 5 {
                leapYearCounter += 1
            }
            
            if leapYearCounter == 4 {
                daysInMonths[1] = 29
            }
            
            if leapYearCounter == 5 {
                leapYearCounter = 1
                daysInMonths[1] = 28
            }
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            
            calendar.reloadData()
        default:
            direction = 1
            
            month += 1
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            
            calendar.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInMonths[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.dateLabel.text = "\(indexPath.row + 1)"
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonPlusHide.isHidden = true;
         if  Auth.auth().currentUser != nil {
             buttonPlusHide.isHidden = false;
         } else {
             buttonPlusHide.isHidden = true;
         }
    }

    // Shake
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let customViewController = storyboard!.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        
        if motion == .motionShake {
            customViewController.modalPresentationStyle = .fullScreen
            present(customViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func mainButtonToTableView(_ sender: Any) {
        let eventsVC = storyboard!.instantiateViewController(withIdentifier: "NavigationEvents") as! UINavigationController
        eventsVC.modalPresentationStyle = .fullScreen
        present(eventsVC, animated: true, completion: nil)
    }
}

