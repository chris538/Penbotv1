//
//  BasicButtonViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 3/30/22.
//

import UIKit

class BasicButtonViewController: UIViewController {

    @IBOutlet weak var codeTestLabel: UILabel!
    @IBAction func squareCommandButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is drawing a square..."
        print("Test square in console")
    }
    @IBAction func triangleCommandButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is drawing a triangle..."
        print("Test triangle in console")
    }
    @IBAction func circleCommandButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is drawing a circle..."
        print("Test circle in console")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
