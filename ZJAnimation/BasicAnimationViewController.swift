//
//  BasicAnimationViewController.swift
//  ZJAnimation
//
//  Created by 张剑 on 16/2/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initScaleLayer()
        self.initGroupLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initScaleLayer(){
        //演员
        let  scaleLayer = CALayer();
        scaleLayer.backgroundColor = UIColor.grayColor().CGColor;
        scaleLayer.frame = CGRectMake(60, 100, 50, 50);
        scaleLayer.cornerRadius = 25;
        self.view.layer.addSublayer(scaleLayer);
        
        //设定剧本
        let scaleAnimation = CABasicAnimation(keyPath: "transform.rotation.x");
        scaleAnimation.fromValue = NSNumber(float: 0)
        scaleAnimation.toValue = NSNumber(float: 6.0 * Float(M_1_PI))
        scaleAnimation.autoreverses = true;
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.repeatCount = MAXFLOAT;
        scaleAnimation.duration = 2;
        
        //开演
        scaleLayer.addAnimation(scaleAnimation, forKey: "scaleAnimation")
    }
    
    
    func initGroupLayer()
    {
        //演员初始化
        let groupLayer = CALayer();
        groupLayer.frame = CGRectMake(60, 200, 50, 50);
        groupLayer.cornerRadius = 20;
        groupLayer.backgroundColor = UIColor.purpleColor().CGColor;
        self.view.layer.addSublayer(groupLayer)
        
        //设定剧本
        //缩放
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale");
        scaleAnimation.fromValue = NSNumber(float:1.0);
        scaleAnimation.toValue = NSNumber(float:1.5);
        scaleAnimation.autoreverses = true;
        scaleAnimation.repeatCount = MAXFLOAT;
        scaleAnimation.duration = 2;
        
        //移动
        let moveAnimation = CABasicAnimation(keyPath: "position");
        moveAnimation.fromValue = NSValue(CGPoint: groupLayer.position);
        moveAnimation.toValue = NSValue(CGPoint: CGPointMake(320 - 80,groupLayer.position.y));
        moveAnimation.autoreverses = true;
        moveAnimation.repeatCount = MAXFLOAT;
        moveAnimation.duration = 2;
        
        //旋转
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z");
        rotateAnimation.fromValue = NSNumber(float: 0)
        rotateAnimation.toValue = NSNumber(float: 6.0 * Float(M_1_PI))
        rotateAnimation.autoreverses = true;
        rotateAnimation.repeatCount = MAXFLOAT;
        rotateAnimation.duration = 2;
        
        let groupAnnimation = CAAnimationGroup();
        groupAnnimation.duration = 2;
        groupAnnimation.autoreverses = true;
        groupAnnimation.animations = [moveAnimation, scaleAnimation, rotateAnimation];
        groupAnnimation.repeatCount = MAXFLOAT;
        
        //开演
        groupLayer.addAnimation(groupAnnimation, forKey: "groupAnnimation");
    }

}
