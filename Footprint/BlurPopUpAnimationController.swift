//
//  BlurPopUpAnimationController.swift
//  Interview
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//


/*
 To create custom transitions you have to follow three steps:
 1: Create a class that implements the UIViewControllerAnimatedTransitioning protocol. Here you will write code that performs the animation. This class is referred to as the animation controller.
    a: UIViewControllerAnimatedTransitioning protocol has two required methods (transitionDuration and animateTransition)
 
 2: Before presenting a view controller, set a class as its transitioning delegate. The delegate will get a callback for the animation controller to be used when presenting the view controller. 
 
 3: Implement the callback method to return an instance of the animation controller from the first step.
 
 */

import UIKit

class BlurPopUpAnimationController:NSObject
{
    
}

//MARK:- Extension
extension BlurPopUpAnimationController{
    struct Animation {
        static let Duration = 0.33
    }
}

extension BlurPopUpAnimationController:UIViewControllerAnimatedTransitioning
{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Animation.Duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        guard let fromViewController = transitionContext.viewController(forKey: .from), let toViewController = transitionContext.viewController(forKey: .to) else{
            return
        }

        let bounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        //This view acts as a superview for the views which involves in Transition
        let containerView = transitionContext.containerView
        
        
        let startingRect = CGRect(x: 0, y: bounds.size.height, width: finalFrame.size.height, height: finalFrame.size.width)
        toViewController.view.frame = startingRect
        containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { 
            fromViewController.view.alpha = 0.50
            toViewController.view.frame = finalFrame
            }) { bool in
                //
                transitionContext.completeTransition(true)
                let view = fromViewController.view
                UIApplication.shared.keyWindow?.addSubview(view!)
                UIApplication.shared.keyWindow?.sendSubview(toBack: view!)
        }
        
    }
}
