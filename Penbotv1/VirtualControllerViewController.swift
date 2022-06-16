//
//  VirtualControllerViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 3/6/22.
//

import UIKit
import GameController

class VirtualControllerViewController: UIViewController {
    
    
    @IBOutlet weak var codeTestLabel: UILabel!
    @IBAction func fowardButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is moving forward..."
    }
    @IBAction func reverseButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is moving backward..."
    }
    @IBAction func leftButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is moving left..."
    }
    @IBAction func rightButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is moving right..."
    }
    @IBAction func triangleButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is drawing a triangle..."
    }
    @IBAction func circleButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is drawing a circle..."
    }
    @IBAction func squareButton(_ sender: Any) {
        codeTestLabel.text = "Penbot is drawing a square..."
    }
    
    
    
    //Code below was used from a Stack Overthrow solution from user Ahmed El-Bermawy
    private var _virtualController: Any?
    @available(iOS 15.0, *)
    public var virtualController: GCVirtualController? {
      get { return self._virtualController as? GCVirtualController }
      set { self._virtualController = newValue }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //own code block
        //currentCommandTextField.text = description
        
        let virtualController = GCVirtualController.Configuration()
        
        virtualController.elements = [GCInputLeftThumbstick,
                                         GCInputButtonA,
                                         GCInputButtonB,
                                         GCInputButtonX,
                                         GCInputButtonY]
        
        
        // Do any additional setup after loading the view.
    }

    
    func setUpGameController(){
        NotificationCenter.default.addObserver(
                    self, selector: #selector(self.handleControllerDidConnect),
                    name: NSNotification.Name.GCControllerDidBecomeCurrent, object: nil)

                NotificationCenter.default.addObserver(
                self, selector: #selector(self.handleControllerDidDisconnect),
                name: NSNotification.Name.GCControllerDidStopBeingCurrent, object: nil)

                if #available(iOS 15.0, *)
                {
                    let virtualConfiguration = GCVirtualController.Configuration()
                    virtualConfiguration.elements = [GCInputLeftThumbstick]
                    virtualController = GCVirtualController(configuration: virtualConfiguration)
                
                    // Connect to the virtual controller if no physical controllers are available.
                    if GCController.controllers().isEmpty {
                        virtualController?.connect()
                    }
                }
            
            guard let controller = GCController.controllers().first else {
                return
            }
            registerGameController(controller)
    }
    
    @objc func handleControllerDidConnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else
        {
            return
        }
        unregisterGameController()
        
        if #available(iOS 15.0, *)
        {
            if gameController != virtualController?.controller
            {
                virtualController?.disconnect()
            }
        }
        registerGameController(gameController)
    }

    @objc func handleControllerDidDisconnect(_ notification: Notification) {
        unregisterGameController()
        
        if #available(iOS 15.0, *) {
            if GCController.controllers().isEmpty
            {
                virtualController?.connect()
            }
        }
    }

    func registerGameController(_ gameController: GCController) {

        //var buttonA: GCControllerButtonInput?
        //var buttonB: GCControllerButtonInput?
        
        if let gamepad = gameController.extendedGamepad
        {
            //buttonA = gamepad.buttonA
            //buttonB = gamepad.buttonB
        }
        
        //buttonA?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            // Put here the codes to run when button A clicked, own code
            //print("Go Forward")
        //}

        //buttonB?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            // Put here the codes to run when button B clicked, own code
            //print("Button B Pressed")
        //}
        
    }

    func unregisterGameController()
    {
        
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
