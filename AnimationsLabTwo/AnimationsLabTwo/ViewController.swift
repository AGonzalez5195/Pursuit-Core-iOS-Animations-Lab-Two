//
//  ViewController.swift
//  AnimationsLabTwo
//
//  Created by Anthony Gonzalez on 10/14/19.
//  Copyright © 2019 Antnee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -- Properties
    lazy var linearPoop: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var easeInPoop: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var easeOutPoop: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var easeInEaseOutPoop: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var linearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Linear", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tag = 0
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeInButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseIn", for: .normal)
        button.setTitleColor(.purple, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tag = 1
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseOut", for: .normal)
        button.setTitleColor(.purple, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tag = 2
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var easeInEaseOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseInOut", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tag = 3
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView(arrangedSubviews: [linearButton, easeInButton, easeOutButton, easeInEaseOutButton])
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        return buttonStack
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(resetButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(animateButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Poop Animation Speeds"
           label.textColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
           label.textAlignment = .center
           return label
       }()
    
    //MARK: -- objc/button functions
    
    @objc func hideButtonPressed(sender: UIButton){
        switch sender.tag {
        case 0:
            if linearPoop.isHidden == true {
                linearPoop.isHidden = false
            } else {
                linearPoop.isHidden = true
            }
        case 1:
            if easeInPoop.isHidden == true {
                easeInPoop.isHidden = false
            } else {
                easeInPoop.isHidden = true
            }
            
        case 2:
            if easeOutPoop.isHidden == true {
                easeOutPoop.isHidden = false
            } else {
                easeOutPoop.isHidden = true
            }
            
        case 3:
            if easeInEaseOutPoop.isHidden == true {
                easeInEaseOutPoop.isHidden = false
            } else {
                easeInEaseOutPoop.isHidden = true
            }
        default: ()
        }
    }
    
    @objc func animateButtonPressed(sender: UIButton) {
        animateLinearPoop()
        animateEaseInPoop()
        animateEaseOutPoop()
        animateEaseInEaseOutPoop()
    }
    
    @objc func resetButtonPressed(sender: UIButton) {
        linearPoop.transform = CGAffineTransform.identity
        easeInPoop.transform = CGAffineTransform.identity
        easeOutPoop.transform = CGAffineTransform.identity
        easeInEaseOutPoop.transform = CGAffineTransform.identity
    }
    
    //        easeInEaseOutBall.center = CGPoint(x: easeInEaseOutBall.center.x, y: easeInEaseOutBall.center.y - 600)
    //CGAffineTransform doesn't change the actual center? Somehow, when the ball moves, it prints out the same center as when it started. Yet, reverting the change made via subtraction seems to work.
    
    
    
    //MARK: -- Animation Functions
    private func animateLinearPoop(){
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveLinear, animations: {
            self.linearPoop.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: nil)}
    
    
    private func animateEaseInPoop(){
        print(easeInPoop.center)
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseIn, animations: {
            self.easeInPoop.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: {(action) in
                print(self.easeInPoop.center)
        })
        
    }
    
    private func animateEaseOutPoop(){
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseOut, animations: {
            self.easeOutPoop.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: nil)}
    
    private func animateEaseInEaseOutPoop(){
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseInOut, animations: {
            self.easeInEaseOutPoop.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: nil)}
    
    //MARK: -- Constraint Functions
    private func setConstraints(){
        setConstraintsForButtonStack()
        setConstraintsForLinearPoop()
        setConstraintsForEaseInPoop()
        setConstraintsForEaseOutPoop()
        setConstraintsForEaseInEaseOutPoop()
        setConstraintsForResetButton()
        setConstraintsForAnimateButton()
        setTitleLabelConstraints()
    }
    
    private func setTitleLabelConstraints(){
          NSLayoutConstraint.activate([
              titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
              titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
      }
      
    
    private func setConstraintsForLinearPoop(){
        NSLayoutConstraint.activate([
            linearPoop.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            linearPoop.centerXAnchor.constraint(equalTo: linearButton.centerXAnchor),
            linearPoop.widthAnchor.constraint(equalToConstant: 70),
            linearPoop.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func setConstraintsForEaseInPoop(){
        NSLayoutConstraint.activate([
            easeInPoop.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            easeInPoop.centerXAnchor.constraint(equalTo: easeInButton.centerXAnchor),
            easeInPoop.widthAnchor.constraint(equalToConstant: 70),
            easeInPoop.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func setConstraintsForEaseOutPoop(){
        NSLayoutConstraint.activate([
            easeOutPoop.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            easeOutPoop.centerXAnchor.constraint(equalTo: easeOutButton.centerXAnchor),
            easeOutPoop.widthAnchor.constraint(equalToConstant: 70),
            easeOutPoop.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setConstraintsForEaseInEaseOutPoop(){
        NSLayoutConstraint.activate([
            easeInEaseOutPoop.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            easeInEaseOutPoop.centerXAnchor.constraint(equalTo: easeInEaseOutButton.centerXAnchor),
            easeInEaseOutPoop.widthAnchor.constraint(equalToConstant: 70),
            easeInEaseOutPoop.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setConstraintsForButtonStack(){
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setConstraintsForResetButton(){
        NSLayoutConstraint.activate([
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func setConstraintsForAnimateButton(){
        NSLayoutConstraint.activate([
            animateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func addSubviews(){
        [linearPoop, easeInPoop, easeOutPoop, easeInEaseOutPoop, buttonStackView, resetButton, animateButton, titleLabel].forEach{$0.translatesAutoresizingMaskIntoConstraints = false }
        
        let UIElements = [linearPoop, easeInPoop, easeOutPoop, easeInEaseOutPoop,buttonStackView, resetButton, animateButton, titleLabel]
        for UIElement in UIElements {
            self.view.addSubview(UIElement)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        view.backgroundColor = #colorLiteral(red: 0.9778421521, green: 1, blue: 0.8806159496, alpha: 1)
    }
}

