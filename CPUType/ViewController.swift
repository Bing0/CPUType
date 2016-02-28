//
//  ViewController.swift
//  CPUType
//
//  Created by BinWu on 10/2/15.
//  Copyright © 2015 BinWu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var type: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cpuType = GetType()
        type.text = cpuType.getCPUType()
        
//        let gestalt = dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_GLOBAL | RTLD_LAZY);
//        
//        let MGCopyAnswer = UnsafePointer<CFStringRef ->CFPropertyListRef>(dlsym(gestalt, "MGCopyAnswer"))
//
//        let fp = MGCopyAnswer.memory
//        let choo: CFStringRef = "HardwarePlatform"
//        let res = fp(choo)
//        print(res)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

