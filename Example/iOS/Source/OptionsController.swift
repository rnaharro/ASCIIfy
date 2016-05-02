//
//  Copyright for portions of ASCIIfy are held by Barış Koç, 2014 as part of
//  project BKAsciiImage and Amy Dyer, 2012 as part of project Ascii. All other copyright
//  for ASCIIfy are held by Nick Walker, 2016.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import UIKit
import ASCIIfy


class OptionsController: UITableViewController {

    @IBOutlet var modeControl: UISegmentedControl!

    var mode: ASCIIConverter.ColorMode = .Color

    var modeChangeHandler: ((ASCIIConverter.ColorMode) -> Void)?

    override func viewWillAppear(animated: Bool) {
        setSelectedMode(mode)
    }

    private func setSelectedMode(mode: ASCIIConverter.ColorMode) {
        modeControl.selectedSegmentIndex = {
            switch mode {
            case .Color:
                return 0
            case .GrayScale:
                return 1
            case .BlackAndWhite:
                return 2
            }
            }()
    }

    @IBAction func didChangeModeSelection(sender: UISegmentedControl) {
        let mode: ASCIIConverter.ColorMode = {
            switch sender.selectedSegmentIndex {
            case 0:
                return .Color
            case 1:
                return .GrayScale
            case 2:
                return .BlackAndWhite
            default:
                return .Color
            }
        }()
        modeChangeHandler?(mode)
    }

    @IBAction func didChangeBackgroundColor(sender: UIControl) {

    }

    @IBAction func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}