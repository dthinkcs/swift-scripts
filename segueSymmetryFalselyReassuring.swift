// BUGGY CONCEPT COZ WE ARE CREATING MULTIPLE COPIES OF THE SAME VC forwards and backwards
//  FirstViewController.swift
//  seguePracticeAgain
//
//  Created by ios on 21/09/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    var textPassedOver: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = textPassedOver
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.textPassedOver = textField.text!// ERROR OF NIL
            // destinationVC.textPassedOver = label.t
            
        }
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

//
//  SecondViewController.swift
//  seguePracticeAgain
//
//  Created by ios on 21/09/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    var textPassedOver: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = textPassedOver
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFirstScreen" {
            let destinationVC = segue.destination as! FirstViewController
            destinationVC.textPassedOver = textField.text!// ERROR OF NIL
            // destinationVC.textPassedOver = label.t
            
        }
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
