//
// Created by Shaban Kamel on 13/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit

protocol CanvasViewDelegate: class {
    func canvasViewDidStartDrawing(_ view: CanvasView, at point: CGPoint)
    func canvasViewDidAddLine(_ view: CanvasView, to point: CGPoint)
    func canvasViewDidEndDrawing(_ view: CanvasView)
}

class CanvasView: UIView {

    // MARK: Properties

    weak var delegate: CanvasViewDelegate?

    @IBInspectable var lineWidth: CGFloat = 30
    @IBInspectable var strokeColor = UIColor.black

    fileprivate var paths: [CGMutablePath] = []
    fileprivate var currentPath: CGMutablePath?
    private var isCompleted = false

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(strokeColor.cgColor)
        context?.setLineWidth(lineWidth)
        for path in paths + [currentPath].compactMap({$0}) {
            context?.addPath(path)
            context?.strokePath()
        }
    }

    // MARK: Actions

    @objc func panGestureRecognized(_ recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: self)

        switch recognizer.state {
        case .began:
            beginPath(at: location)
            delegate?.canvasViewDidStartDrawing(self, at: location)
        case .changed:
            addLine(to: location)
            delegate?.canvasViewDidAddLine(self, to: location)
        default:
            closePath()
            delegate?.canvasViewDidEndDrawing(self)
        }
    }

    func beginPath(at point: CGPoint) {
        currentPath = CGMutablePath()
        currentPath?.move(to: point)
    }

    func addLine(to point: CGPoint) {
        currentPath?.addLine(to: point)
        setNeedsDisplay()
    }

    func closePath() {
        if isCompleted {
            paths = []
            setNeedsDisplay()
            return
        }
        if let currentPath = currentPath {
            paths.append(currentPath)
        }
        currentPath = nil
        setNeedsDisplay()
    }

    func clear() {
        paths = []
        setNeedsDisplay()
    }

    // MARK: Private Methods

    fileprivate func configureView() {
        addGestureRecognizers()
    }

    fileprivate func addGestureRecognizers() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized))
        addGestureRecognizer(panRecognizer)
    }

    var scratchPercent: Double {
        1.0 - getTransparentPixelsPercent()
    }
}