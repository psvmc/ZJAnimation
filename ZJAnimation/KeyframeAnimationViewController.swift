//
//  KeyframeAnimationViewController.swift
//  ZJAnimation
//
//  Created by 张剑 on 16/2/15.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit

class KeyframeAnimationViewController: UIViewController {
    let duration = 1.2;
    override func viewDidLoad() {
        super.viewDidLoad()
        initKeyframeAnimation();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initKeyframeAnimation(){
        // 大小变化
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [1, 0.4, 1]
        scaleAnimation.duration = duration
        
        // 透明度变化
        let opacityAnimaton = CAKeyframeAnimation(keyPath: "opacity")
        //该属性是一个数组，用以指定每个子路径的时间。
        opacityAnimaton.keyTimes = [0, 0.5, 1]
        //values属性指明整个动画过程中的关键帧点，需要注意的是，起点必须作为values的第一个值。
        opacityAnimaton.values = [1, 0.3, 1]
        opacityAnimaton.duration = duration
        
        // 组动画
        let animation = CAAnimationGroup()
        //将大小变化和透明度变化的动画加入到组动画
        animation.animations = [scaleAnimation, opacityAnimaton]
        //动画的过渡效果
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        //动画的持续时间
        animation.duration = duration
        //设置重复次数,HUGE可看做无穷大，起到循环动画的效果
        animation.repeatCount = HUGE
        //运行一次是否移除动画
        animation.removedOnCompletion = false
        
        // 画圆并添加动画
        for var i = 0; i < 8; i++ {
            let circle = creatCircle(
                angle: CGFloat(M_PI_4 * Double(i)),//角度度数
                size: 12,//点的大小
                origin: CGPoint(x: 10, y: 74),//左上角的位置
                containerSize: CGSize(width: 100, height: 100),//大小
                color: UIColor.redColor()//点的颜色
            );
            animation.beginTime = duration / 8.0 * Double(i);
            circle.addAnimation(animation, forKey: "animation")
            view.layer.addSublayer(circle)
        }
    }
    
    func creatCircle(angle angle: CGFloat, size: CGFloat, origin: CGPoint, containerSize: CGSize, color: UIColor) -> CALayer {
        let radius = containerSize.width/2
        let circle = createLayerWith(CGSize(width: size, height: size), color: color)
        let frame = CGRect(
            x: origin.x + radius * (cos(angle) + 1) - size / 2,
            y: origin.y + radius * (sin(angle) + 1) - size / 2,
            width: size,
            height: size)
        circle.frame = frame
        return circle
    }
    
    func createLayerWith(size: CGSize, color: UIColor) -> CALayer {
        //创建CAShapeLayer，如果对CAShapeLayer比较陌生，简单介绍下CAShapeLayer
        let layer: CAShapeLayer = CAShapeLayer()
        //创建贝塞尔曲线路径（CAShapeLayer就依靠这个路径渲染）
        let path: UIBezierPath = UIBezierPath()
        //addArcWithCenter,顾名思义就是根据中心点画圆(OC语法的命名优越感又体现出来了0.0),这几个参数
        /**
        center: CGPoint 中心点
        radius: CGFloat 半径
        startAngle: CGFloat 起始的弧度
        endAngle: CGFloat 结束的弧度
        clockwise: Bool 绘画方向 true：顺时针 false：逆时针
        */
        path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
            radius: size.width / 2,
            startAngle: 0,
            endAngle: CGFloat(2 * M_PI),
            clockwise: false);
        //线宽，如果画圆填充的话也可以不设置
        layer.lineWidth = 2
        //填充颜色，这里也就是圆的颜色
        layer.fillColor = color.CGColor
        //图层背景色
        layer.backgroundColor = nil
        //把贝塞尔曲线路径设为layer的渲染路径
        layer.path = path.CGPath
        
        return layer;
    }
}
