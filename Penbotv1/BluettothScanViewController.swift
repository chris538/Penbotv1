//
//  BluettothScanViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 3/17/22.
//

import UIKit
import CoreBluetooth

class BluettothScanViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("idk")
        return
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

    @IBAction func BTScanButton(_ sender: Any) {
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
    }
}
