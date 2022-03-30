//
//  ViewController.swift
//  Penbotv1
//
//  Created by Chris Le on 2/7/22.
//


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
