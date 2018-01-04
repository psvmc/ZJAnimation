//
//  SysAnimationViewController.swift
//  ZJAnimation
//
//  Created by 张剑 on 16/2/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit

class SysAnimationViewController: UIViewController {

    @IBOutlet weak var anImageView: UIImageView!
    
    var animationType:String = "oglFlip";
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func initTransition(){
        //演员初始化
        let transitionLayer = anImageView.layer;
        
        //设定剧本
        let transition = CATransition();
        transition.type = animationType
        transition.duration = 1.2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear);
        transition.fillMode = kCAFillModeBackwards;
        transition.subtype = kCATransitionFromRight;
        transition.autoreverses = false;
        transition.repeatCount = 1;
        
        //开演
        transitionLayer.addAnimation(transition, forKey: "transition");
    }

    @IBAction func animation01Click(sender: AnyObject) {
        animationType = kCATransitionMoveIn;//新视图移到旧视图上面
        initTransition();
    }

    @IBAction func animation02Click(sender: AnyObject) {
        animationType = kCATransitionPush;//新视图把旧视图推出去
        initTransition();
    }
    
    @IBAction func animation03Click(sender: AnyObject) {
        animationType = kCATransitionFade;//交叉淡化过渡
        initTransition();
    }
    
    @IBAction func animation04Click(sender: AnyObject) {
        animationType = kCATransitionReveal;//将旧视图移开,显示下面的新视图
        initTransition();
    }
    
    @IBAction func animation05Click(sender: AnyObject) {
        animationType = "pageCurl";//向上翻一页
        initTransition();
    }
    
    @IBAction func animation06Click(sender: AnyObject) {
        animationType = "pageUnCurl";//向下翻一页
        initTransition();
    }
    
    @IBAction func animation07Click(sender: AnyObject) {
        animationType = "rippleEffect";//滴水效果
        initTransition();
    }
    
    @IBAction func animation08Click(sender: AnyObject) {
        animationType = "suckEffect";//收缩效果，如一块布被抽走
        initTransition();
    }
    
    @IBAction func animation09Click(sender: AnyObject) {
        animationType = "cube";//立方体效果
        initTransition();
    }
    
    @IBAction func animation10Click(sender: AnyObject) {
        animationType = "oglFlip";//上下翻转效果
        initTransition();
    }
}
