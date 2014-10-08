//
//  ViewController.swift
//  MySwiftWeather
//
//  Created by 胡晓桥 on 14-10-8.
//  Copyright (c) 2014年 huxiaoqiao. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //位置管理器
    let locationManager:CLLocationManager = CLLocationManager()
    
    //IBOutlet
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var loading: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.loadingIndicator.startAnimating()
        
        let background = UIImage(named: "backgroud.png")
        self.view.backgroundColor = UIColor(patternImage: background)
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
        self.view.addGestureRecognizer(singleFingerTap)
        
        if(ios8()){
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()
    }

//private methods
    
    func handleSingleTap(recognizer:UITapGestureRecognizer)
    {
        locationManager.startUpdatingLocation()
    }
    //判断版本是否为ios 8
    func ios8() -> Bool {
        if(NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) {
            return false
        }else{
            return true
        }
    }
    //更新天气信息
    func updateWeatherInfo(latitude:CLLocationDegrees, longitude:CLLocationDegrees){
        //调用AFNetWorking库
        
    }
    
//CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        //取得位置信息
        var location:CLLocation = locations[locations.count - 1] as CLLocation
        
        if (location.horizontalAccuracy > 0)
        {
            self.locationManager.stopUpdatingLocation()
            println(location.coordinate)
            //更新天气信息
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

