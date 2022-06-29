//
//  ViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 2/7/22.
//

import CoreBluetooth
import UIKit

class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate
{
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("View loaded")
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    //Start scanning if the iphone bluetooth is on
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        print("What is the central state status")
        if central.state != .poweredOn
        {
            print("Central is not on")
        }
        
        //Connect to the Bluetooth module
        else
        {
            print("Central scanning for", BluetoothModule.BTModuleUUID);
            centralManager.scanForPeripherals(withServices: [BluetoothModule.BTModuleUUID],
                                              options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
        }
    }
    
    //Function that handles the result of the bluetooth scan
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
        //Stop scanning when the device is found
        self.centralManager.stopScan()
        
        //Copy the peripheral instance
        self.peripheral = peripheral
        self.peripheral.delegate = self
        
        //Connect to device
        self.centralManager.connect(self.peripheral, options: nil)
    }
    
    //Function that ensures the connection is successful
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral)
    {
        if peripheral == self.peripheral
        {
            print("Connected to the AT-09 Bluetooth module")
            peripheral.discoverServices([BluetoothModule.BTModuleUUID])
        }
    }
    
    //Handles discovery event
}










//Commented out entire block to test the rest of the code for printing to terminal
/*import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate{

    //https://www.freecodecamp.org/news/ultimate-how-to-bluetooth-swift-with-hardware-in-20-minutes/
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    override func viewDidLoad() {
        
        //centralManager = CBCentralManager(delegate: self, queue: nil)
        super.viewDidLoad()
        
        //start scanning if powered on
        /*func centralManagerDidUpdateState(_ central: CBCentralManager){
            print("Update central state")
        }
            
            switch central.state{
                //case .poweredOn:
                    //print("Powered on")
                    //startScanning()
                case .poweredOff:
                    print("Powered off")
                case .unknown:
                    print("Unknown")
                case .resetting:
                    print("Resetting")
                case .unsupported:
                    print("Unsupported")
                case .unauthorized:
                    print("Unauthorized")
                @unknown default:
                    print("Unknown")
            }
        }*/
        
        
        //Stackoverflow
        //https://stackoverflow.com/questions/46064712/scan-any-bluetooth-devices-on-ios
        func centralManager(_central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber){
            print("Discovered \(peripheral.name ?? "")")
        }
        
        //Code from Adafruit
        //Starts scanning for devices
        //func startScanning() -> Void{
        //    centralManager?.scanForPeripherals(withServices: nil, options: options)
        //}
        
        
        
        
        //Start manager
        //class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate{
        //    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //        <#code#>
        //    }
            
            
        }
        
        //startButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.alignCenters
        //startButton.titleLabel!.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    
    
    
}

/*class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate{

    var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize central manager
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        //Discover peripherals only once
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: NSNumber(value: false)]
        
        //Discover BT peripherals
        centralManager.scanForPeripherals(withServices: nil, options: options)
        
        
        //Start manager
        //class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate{
        //    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //        <#code#>
        //    }
            
            
        }
        
        //startButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.alignCenters
        //startButton.titleLabel!.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        <#code#>
    }
    
    
    
}*/

*/
