//
//  ViewController.swift
//  SpringAnimationHW
//
//  Created by Mary Jane on 21.09.2021.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var viewAnimated: SpringView!
    @IBOutlet var parametrAnimationLabel: UILabel!
    @IBOutlet var runAnimationButton: UIButton!
    
    private let animations = Spring.AnimationPreset.allCases
    private let animationCurves = Spring.AnimationCurve.allCases
    
    private var currentAnimation = AnimationSpring()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNextAnimation()
        updateViewLabels()
    }

    @IBAction func runAnimationButtonPressed() {
        runAnimation()
        updateViewLabels()
        getNextAnimation()
        updateTextButton()
     }
    
    private func runAnimation() {
         viewAnimated.animation = currentAnimation.animation
        viewAnimated.curve = currentAnimation.curve
        viewAnimated.force = CGFloat(currentAnimation.force)
        viewAnimated.duration = CGFloat(currentAnimation.duration)
        viewAnimated.delay = CGFloat(currentAnimation.delay)
        viewAnimated.animate()
   }

    private func getNextAnimation() {
        currentAnimation.animation = animations.randomElement()?.rawValue  ?? ""
        currentAnimation.curve = animationCurves.randomElement()?.rawValue ?? ""
        currentAnimation.force = Double.random(in: 0.1...2.0)
        currentAnimation.duration = Double.random(in: 0.5...2.0)
        currentAnimation.delay = Double.random(in: 0.1...0.3)
    }
    
    private func updateViewLabels() {
        parametrAnimationLabel.text = """
            preset: \(currentAnimation.animation)
            curve: \(currentAnimation.curve)
            force: \(string(from: currentAnimation.force))
            duration: \(string(from: currentAnimation.duration))
            delay: \(string(from: currentAnimation.delay))
        """
    }
    
    private func updateTextButton() {
        runAnimationButton.setTitle("Run \(currentAnimation.animation)", for: .normal)
    }

    private func string(from double: Double) -> String {
        String(format: "%.2f", double)
    }
}

