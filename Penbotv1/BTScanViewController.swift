//
//  BTScanViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 3/16/22.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var centralManager: CBCentralManager!
    var myPeripheral: CBPeripheral!
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            print("BLE powered on")
            // Turned on
            central.scanForPeripherals(withServices: nil, options: nil)
        }
        else {
            print("Something wrong with BLE")
            // Not on, but can have different issues
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let pname = peripheral.name {
            if pname == "BT05" {
                print("connected")
                self.centralManager.stopScan()
                self.myPeripheral = peripheral
                self.myPeripheral.delegate = self
                self.centralManager.connect(peripheral, options: nil)
                print("connected")
            }
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        self.myPeripheral.discoverServices(nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}
