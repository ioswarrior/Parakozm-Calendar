import UIKit
import Firebase

class LoginController: UIViewController  {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = emailTextField.text
            else { return  }
        guard let password = passwordTextField.text
            else { return  }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if authResult?.user != nil {
                let eventsVC = self?.storyboard!.instantiateViewController(withIdentifier: "ViewController")
                eventsVC?.modalPresentationStyle = .fullScreen
                self?.present(eventsVC!, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Warning", message: "You email or password are incorrect", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self?.present(alert, animated: true, completion: nil)
                print("Error Auth: \(error?.localizedDescription)")
            }
        }
    }
}
