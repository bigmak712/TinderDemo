//
//  ViewController.swift
//  TinderDemo
//
//  Created by Timothy Mak on 4/24/17.
//  Copyright © 2017 Timothy Mak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    var newlyCreatedCard: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didDragCard(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let x = translation.x
        
        if sender.state == .began {
            print("began")
            newlyCreatedCard = sender.view as! UIImageView
            cardInitialCenter = newlyCreatedCard.center

        }
        else if sender.state == .changed {
            print("changed")
            
            if(x > 0) {
                 newlyCreatedCard.transform = newlyCreatedCard.transform.rotated(by: CGFloat(2 * Double.pi / 180))
            }
            else {
                newlyCreatedCard.transform = newlyCreatedCard.transform.rotated(by: CGFloat(-2 * Double.pi / 180))
            }

        }
        else if sender.state == .ended {
            if x > 50 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.newlyCreatedCard.alpha = 0
                })
            }
            else if x < -50 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.newlyCreatedCard.alpha = 0
                })
            }
            else {
                newlyCreatedCard.transform = .identity
            }
        }
    }
}

