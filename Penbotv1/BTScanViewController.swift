//
//  BTScanViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 3/16/22.
//

import Foundation
import CoreBluetooth

import UIKit

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("idk")
        return
    }
    

    
    
    //var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var centralManager: CBCentralManager!
        //Initialize central manager
        centralManager = CBCentralManager(delegate: self, queue: .main)
        
        //Discover peripherals only once
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: NSNumber(value: false)]
        
        //Discover BT peripherals
        centralManager?.scanForPeripherals(withServices: nil, options: options)
        
        func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            print("Discovered \(peripheral.name ?? "")")
        }
        
        //Start manager
        //class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate{
        //    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //        <#code#>
        //    }
            
            
        }
        
        //startButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.alignCenters
        //startButton.titleLabel!.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    
    //func centralManagerDidUpdateState(_ central: CBCentralManager) {
    //    <#code#>
    //}
    
    
    
}
