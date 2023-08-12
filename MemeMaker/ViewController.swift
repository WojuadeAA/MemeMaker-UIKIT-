//
//  ViewController.swift
//  MemeMaker
//
//  Created by Wojuade Abdul Afeez on 11/08/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    let topChoices : [CaptionOptions] = [
    CaptionOptions(emoji: "😎", caption: "You know what is cool?"),
    CaptionOptions(emoji: "😡", caption: "You know what makes me so mad?"),
    CaptionOptions(emoji: "❤️", caption: "You know what i love?"),
    ]
    let bottomChoice : [CaptionOptions] = [
        CaptionOptions(emoji: "🐱", caption: "cats learning how to code"),
        CaptionOptions(emoji: "🐕", caption: "dogs carrying logs"),
        CaptionOptions(emoji: "🐒", caption: "Monkey being funky"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       loadSegmentedControl(with: topChoices, segmentedControl: topSegmentedControl)
        loadSegmentedControl(with: bottomChoice, segmentedControl: bottomSegmentedControl)
        updateCaption()
       
    }


    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        updateCaption()
    }
    
    func loadSegmentedControl(with captionChoices : [CaptionOptions], segmentedControl : UISegmentedControl){
        segmentedControl.removeAllSegments()
        for choice in captionChoices {
            segmentedControl.insertSegment(withTitle:choice.emoji, at: choice.caption.count, animated: true)
        }
        segmentedControl.selectedSegmentIndex = 0
    }
    func updateCaption(){
        topCaptionLabel.text = topChoices[topSegmentedControl.selectedSegmentIndex].caption
        bottomCaptionLabel.text = bottomChoice[bottomSegmentedControl.selectedSegmentIndex].caption
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
           
        }
    }
}

