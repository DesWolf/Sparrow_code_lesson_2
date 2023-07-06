//
//  LessonButton.swift
//  SecondLesson
//
//  Created by Максим Окунеев on 05.07.2023.
//

import UIKit

class LessonButton: UIButton {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.tintColor = .white
        self.semanticContentAttribute = .forceRightToLeft

        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10
        
        
        var configuration = Configuration.filled()
        configuration.image = UIImage(systemName: "play.circle")
        configuration.titlePadding = 10
        configuration.imagePadding = 10
    
        configuration.baseBackgroundColor = .blue
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 17, bottom: 10, trailing: 17)
        
        self.configuration = configuration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Private methods
    
    private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [
                .allowUserInteraction
            ],
            animations: {
                self.transform = isHighlighted ? .init(scaleX: 0.96, y: 0.96) : .identity
        },
            completion: completion)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false)
    }
}
