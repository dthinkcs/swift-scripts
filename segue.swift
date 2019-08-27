//
//  ViewController.swift
//  Segues
//
//  Created by ios on 27/08/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        // the name of the segue has an identifier
        performSegue(withIdentifier: "goToSecondScreen", sender: self) // sender: Any? will give an error
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // you made a typo here
        if segue.identifier == "goToSecondScreen" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.textPassedOver = textField.text! // forced unwrap
        }
    }
    
}

//
//  SecondViewController.swift
//  Segues
//
//  Created by ios on 27/08/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textPassedOver: String?
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = textPassedOver

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
