
import UIKit

class EventsViewController: UITableViewController {
    
    let eventsNames = [
        "Master Class Java", "Typescript and not need Javascript?", "Javascript Vue.js", "Master Class Java",
        "Javascript and Web Development", "Talking about Php"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = eventsNames[indexPath.row]
        cell.imageView?.image = UIImage(named: eventsNames[indexPath.row])
        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    
    @IBAction func addEventsButton(_ sender: Any) {
        _ = EventsAddViewController()
        let eventsVCStoryBoard = storyboard!.instantiateViewController(withIdentifier: "EventsAddViewController") as! EventsAddViewController
        navigationController?.pushViewController(eventsVCStoryBoard, animated: true)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        _ = ViewController()
        let eventsVC = storyboard!.instantiateViewController(withIdentifier: "ViewController")
        eventsVC.modalPresentationStyle = .fullScreen
        present(eventsVC, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    @IBAction func plusButton(_ sender: Any) {
    //        let eventsVC = EventsAddViewController()
    //        let eventsVCStoryBoard = storyboard!.instantiateViewController(withIdentifier: "EventsAddViewController") as! EventsAddViewController
    //        navigationController?.pushViewController(eventsVCStoryBoard, animated: true)
    //    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
