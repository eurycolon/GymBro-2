//  AnimationTabBarController.swift
//
// Copyright (c) 11/10/14 Ramotion Inc. (http://ramotion.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit


// MARK: Custom Badge

extension RAMAnimatedTabBarItem {
  
  /// The current badge value
  override open var badgeValue: String? {
    get {
      return badge?.text
    }
    set(newValue) {
      
      if newValue == nil {
        badge?.removeFromSuperview()
        badge = nil;
        return
      }
      
      if let iconView = iconView, let contanerView = iconView.icon.superview , badge == nil {
        badge = RAMBadge.badge()
        badge!.addBadgeOnView(contanerView)
      }
      
      badge?.text = newValue
    }
  }
}

/// UITabBarItem with animation
open class RAMAnimatedTabBarItem: UITabBarItem {
  
  @IBInspectable open var yOffSet: CGFloat = 0
  
  open override var isEnabled: Bool {
    didSet {
      iconView?.icon.alpha = isEnabled == true ? 1 : 0.5
      iconView?.textLabel.alpha = isEnabled == true ? 1 : 0.5
    }
  }
  
  /// animation for UITabBarItem. use RAMFumeAnimation, RAMBounceAnimation, RAMRotationAnimation, RAMFrameItemAnimation, RAMTransitionAnimation
  /// or create custom anmation inherit RAMItemAnimation
  @IBOutlet open var animation: RAMItemAnimation!
  
  /// The font used to render the UITabBarItem text.
  open var textFont: UIFont = UIFont.systemFont(ofSize: 10)
  
  /// The color of the UITabBarItem text.
  @IBInspectable open var textColor: UIColor = UIColor.black
  
  /// The tint color of the UITabBarItem icon.
  @IBInspectable open var iconColor: UIColor = UIColor.clear // if alpha color is 0 color ignoring
  
  var bgDefaultColor: UIColor = UIColor.clear // background color
  var bgSelectedColor: UIColor = UIColor.clear
  
  //  The current badge value
  open var badge: RAMBadge? // use badgeValue to show badge
  
  // Container for icon and text in UITableItem. 
  open var iconView: (icon: UIImageView, textLabel: UILabel)?
  
  /**
   Start selected animation
   */
  open func playAnimation() {
    
    assert(animation != nil, "add animation in UITabBarItem")
    guard animation != nil && iconView != nil else  {
      return
    }
    animation.playAnimation(iconView!.icon, textLabel: iconView!.textLabel)
  }
  
  /**
   Start unselected animation
   */
  open func deselectAnimation() {
    
    guard animation != nil && iconView != nil else  {
      return
    }
    
    animation.deselectAnimation(
      iconView!.icon,
      textLabel: iconView!.textLabel,
      defaultTextColor: textColor,
      defaultIconColor: iconColor)
  }
  
  /**
   Set selected state without animation
   */
  open func selectedState() {
    guard animation != nil && iconView != nil else  {
      return
    }
    
    animation.selectedState(iconView!.icon, textLabel: iconView!.textLabel)
  }
}

extension  RAMAnimatedTabBarController {
  
  /**
   Change selected color for each UITabBarItem
   
   - parameter textSelectedColor: set new color for text
   - parameter iconSelectedColor: set new color for icon
   */
  open func changeSelectedColor(_ textSelectedColor:UIColor, iconSelectedColor:UIColor) {
    
    let items = tabBar.items as! [RAMAnimatedTabBarItem]
    for index in 0..<items.count {
      let item = items[index]
      
      item.animation.textSelectedColor = textSelectedColor
      item.animation.iconSelectedColor = iconSelectedColor
      
      if item == self.tabBar.selectedItem {
        item.selectedState()
      }
    }
  }
  
  /**
   Hide UITabBarController
   
    - parameter isHidden: A Boolean indicating whether the UITabBarController is displayed
   */
  open func animationTabBarHidden(_ isHidden:Bool) {
    guard let items = tabBar.items as? [RAMAnimatedTabBarItem] else {
      fatalError("items must inherit RAMAnimatedTabBarItem")
    }
    for item in items {
      if let iconView = item.iconView {
        iconView.icon.superview?.isHidden = isHidden
      }
    }
    self.tabBar.isHidden = isHidden;
  }
  
  /**
   Selected UITabBarItem with animaton
   
   - parameter from: Index for unselected animation
   - parameter to:   Index for selected animation
   */
  open func setSelectIndex(from: Int, to: Int) {
    selectedIndex = to
    guard let items = tabBar.items as? [RAMAnimatedTabBarItem] else {
      fatalError("items must inherit RAMAnimatedTabBarItem")
    }
    
    let containerFrom = items[from].iconView?.icon.superview
    containerFrom?.backgroundColor = items[from].bgDefaultColor
    items[from].deselectAnimation()
    
    let containerTo = items[to].iconView?.icon.superview
    containerTo?.backgroundColor = items[to].bgSelectedColor
    items[to].playAnimation()
  }
}

/// UITabBarController with item animations
open class RAMAnimatedTabBarController: UITabBarController {
  
    let button: UIButton = UIButton(type: .custom)
    let button2: UIButton = UIButton(type: .custom)
    let button3: UIButton = UIButton(type: .custom)
    let button4: UIButton = UIButton(type: .custom)
    let button5: UIButton = UIButton(type: .custom)
    var allButtons = [UIButton]()
    let buttonimage: UIImage = #imageLiteral(resourceName: "exercisebutton")
    var view3: UIView = UIView()
    
    
    
  
    
  
    
    open override func viewWillAppear(_ animated: Bool) {
        
       allButtons = [button,button2,button3, button4,button5]
        
        button.tag = 0
        button2.tag = 1
        button3.tag = 2
        button4.tag = 3
        button5.tag = 4
        
        self.tabBarController?.selectedIndex = 0
        
        let tabBarControllerItems = self.tabBar.items
        
        if let arrayOfTabBarItems = tabBarControllerItems as? AnyObject as? NSArray{
            
            var tabBarItemThree: UITabBarItem = UITabBarItem()
            
            
            tabBarItemThree = arrayOfTabBarItems[2] as! UITabBarItem
            tabBarItemThree.isEnabled = false
           
            
          
            
        }
        self.setSelectIndex(from: 2, to: 3)
    
        
    
     
        view3.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view3.backgroundColor = UIColor.black
        view3.alpha = 0
        self.view.addSubview(view3)
        self.view.bringSubview(toFront: view3)
        
        
        button.frame = CGRect(x: 0, y: 0,  width: buttonimage.size.width, height: buttonimage.size.height)
        button.setBackgroundImage(UIImage(named: "play") , for: .normal)
        button.setBackgroundImage(UIImage(named: "play"), for: .highlighted)
        button.imageView?.contentMode = .scaleAspectFit
        
        centerButton()
        
        button2.frame = button.frame
        button3.frame = button.frame
        button4.frame = button.frame
        button5.frame = button.frame
      
        button2.setBackgroundImage(UIImage(named: "exercisebutton"), for: .normal)
        button2.setBackgroundImage(UIImage(named: "exercisebutton"), for: .highlighted)
        button3.setBackgroundImage(UIImage(named: "fooddiarybutton"), for: .normal)
        button3.setBackgroundImage(UIImage(named: "fooddiarybutton"), for: .highlighted)
        button4.setBackgroundImage(UIImage(named: "progressbutton"), for: .normal)
        button4.setBackgroundImage(UIImage(named: "progressbutton"), for: .highlighted)
        button5.setBackgroundImage(UIImage(named: "routinebutton"), for: .normal)
        button5.setBackgroundImage(UIImage(named: "routinebutton"), for: .highlighted)

        
        let frame = button2.frame
        button2.center = button.center
        button3.center = button.center
        button4.center = button.center
        button5.center = button.center
        
        
        
        
        self.view.addSubview(button)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(button4)
        self.view.addSubview(button5)
 
        self.view.bringSubview(toFront: button)
        button.addTarget(self, action: #selector(self.menuButtonAction(sender:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(self.buttonTwo(sender:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(self.buttonThree(sender:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(self.buttonFour(sender:)), for: .touchUpInside)
        button5.addTarget(self, action: #selector(self.buttonFive(sender:)), for: .touchUpInside)
        
    
    }
    
    func buttonTwo (sender: UIButton) {
        
   
            
        self.selectedIndex = 0
       doThisForAllButtons()
      print("Button two works!")
        
}
    func buttonThree (sender: UIButton) {
        
        
        
        self.selectedIndex = 1
        
        doThisForAllButtons()
        print("Button two works!")
        
    }
    
    func buttonFour (sender: UIButton) {
        
        
        
        self.selectedIndex = 3
        doThisForAllButtons()
        print("Button two works!")
        
    }
    
    func buttonFive (sender: UIButton) {
        
        
        
        self.selectedIndex = 4
        doThisForAllButtons()
        print("Button two works!")
        
    }
    
    
    
    func doThisForAllButtons () {
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        UIView.animate(withDuration: 0.3, animations: {
            
            self.button2.center = self.button.center
            self.button3.center = self.button.center
            self.button4.center = self.button.center
            self.button5.center = self.button.center
            self.view3.alpha = 0
            
        })
    }
    
    
    
    
    
    func menuButtonAction(sender: UIButton) {
        
        
        
        if sender.currentImage == #imageLiteral(resourceName: "play") {
      
            UIView.animate(withDuration: 0.3, animations: { 
                sender.setImage(#imageLiteral(resourceName: "playbutton2"), for: .normal)
                self.button2.frame = CGRect(x: self.tabBar.center.x - 70, y: self.tabBar.center.y - 80,  width: self.buttonimage.size.width, height: self.buttonimage.size.height)
                 self.button3.frame = CGRect(x: self.tabBar.center.x - 40, y: self.tabBar.center.y - 130,  width: self.buttonimage.size.width, height: self.buttonimage.size.height)
                 self.button4.frame = CGRect(x: self.tabBar.center.x + 10, y: self.tabBar.center.y - 130,  width: self.buttonimage.size.width, height: self.buttonimage.size.height)
                 self.button5.frame = CGRect(x: self.tabBar.center.x + 40, y: self.tabBar.center.y - 80,  width: self.buttonimage.size.width, height: self.buttonimage.size.height)
              
                self.view3.alpha = 0.6
            })
        } else {
            sender.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            UIView.animate(withDuration: 0.3, animations: { 
                
                self.button2.center = self.button.center
                self.button3.center = self.button.center
                self.button4.center = self.button.center
                self.button5.center = self.button.center
                self.view3.alpha = 0
                
            })
          
        }
        
        
        print("Middle Button was just pressed!")
    }

    
    func returnAnimation() {
    UIView.animate(withDuration: 0.3) { 
    
       self.view3.alpha = 0
        self.button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        self.button2.center = self.button.center
        self.button3.center = self.button.center
        self.button4.center = self.button.center
        self.button5.center = self.button.center
        
        }
        
        
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
       // if self.selectedIndex == 2 {
          //  self.selectedIndex = 3
            
        
        
        
        
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RAMAnimatedTabBarController.returnAnimation))
        self.view3.addGestureRecognizer(tap)
        
        
        
        
        
        self.didLoadView = true
        
        self.initializeContainers()
    }
    
    
    
  fileprivate var didInit: Bool = false
  fileprivate var didLoadView: Bool = false
  
  // MARK: life circle
  
  /**
   Returns a newly initialized view controller with the nib file in the specified bundle.
   
   - parameter nibNameOrNil:   The name of the nib file to associate with the view controller. The nib file name should 
   not contain any leading path information. If you specify nil, the nibName property is set to nil.
   
   - parameter nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the
   bundle's language-specific project directories first, followed by the Resources directory. If this parameter is nil,
   the method uses the heuristics described below to locate the nib file.
   
   - returns: A newly initialized RAMAnimatedTabBarController object.
   */
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    self.didInit = true
    self.initializeContainers()
  }
  
  /**
   Returns a newly initialized view controller with the nib file in the specified bundle.
   
   - parameter viewControllers: Sets the root view controllers of the tab bar controller.
   
   - returns: A newly initialized RAMAnimatedTabBarController object.
   */
  public init(viewControllers: [UIViewController]) {
    super.init(nibName: nil, bundle: nil)
    
    self.didInit = true
    
    // Set initial items
    self.setViewControllers(viewControllers, animated: false)
    
    self.initializeContainers()
  }
  
  /**
   Returns a newly initialized view controller with the nib file in the specified bundle.
   
   - parameter coder: An unarchiver object.
   
   - returns: A newly initialized RAMAnimatedTabBarController object.
   */
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.didInit = true
    self.initializeContainers()
  }
  

    
    

  
    func centerButton() {
        let heightDifference = buttonimage.size.height - self.tabBar.frame.size.height
        if (heightDifference < 0) {
            button.center = self.tabBar.center;
            
            
        } else {
            
            var center = self.tabBar.center
            center.y = center.y - heightDifference/2.0;
            button.center = center;
            
        }
        
    }
    
    
    
    
    
    
    
    
  fileprivate func initializeContainers() {
    if !self.didInit || !self.didLoadView {
      return
    }
    
    let containers = self.createViewContainers()
    
    self.createCustomIcons(containers)
  }
  
  // MARK: create methods
  
  fileprivate func createCustomIcons(_ containers : NSDictionary) {
    
    guard let items = tabBar.items as? [RAMAnimatedTabBarItem] else {
      fatalError("items must inherit RAMAnimatedTabBarItem")
    }
    
    var index = 0
    for item in items {
      
      guard let itemImage = item.image else {
        fatalError("add image icon in UITabBarItem")
      }
      
      guard let container = containers["container\(items.count - 1 - index)"] as? UIView else {
        fatalError()
      }
      container.tag = index
      
      
      let renderMode = item.iconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal :
        UIImageRenderingMode.alwaysTemplate
      
      let icon = UIImageView(image: item.image?.withRenderingMode(renderMode))
      icon.translatesAutoresizingMaskIntoConstraints = false
      icon.tintColor = item.iconColor
      
      // text
      let textLabel = UILabel()
      textLabel.text = item.title
      textLabel.backgroundColor = UIColor.clear
      textLabel.textColor = item.textColor
      textLabel.font = item.textFont
      textLabel.textAlignment = NSTextAlignment.center
      textLabel.translatesAutoresizingMaskIntoConstraints = false
      
      container.backgroundColor = (items as [RAMAnimatedTabBarItem])[index].bgDefaultColor
      
      container.addSubview(icon)
      createConstraints(icon, container: container, size: itemImage.size, yOffset: -5 - item.yOffSet)
      
      container.addSubview(textLabel)
      let textLabelWidth = tabBar.frame.size.width / CGFloat(items.count) - 5.0
      createConstraints(textLabel, container: container, size: CGSize(width: textLabelWidth , height: 10), yOffset: 16 - item.yOffSet)
      
      if item.isEnabled == false {
        icon.alpha      = 0.5
        textLabel.alpha = 0.5
      }
      item.iconView = (icon:icon, textLabel:textLabel)
      
      if 0 == index { // selected first elemet
        item.selectedState()
        container.backgroundColor = (items as [RAMAnimatedTabBarItem])[index].bgSelectedColor
      }
      
      item.image = nil
      item.title = ""
      index += 1
    }
  }
  
  fileprivate func createConstraints(_ view:UIView, container:UIView, size:CGSize, yOffset:CGFloat) {
    
    let constX = NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.centerX,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: container,
                                    attribute: NSLayoutAttribute.centerX,
                                    multiplier: 1,
                                    constant: 0)
    container.addConstraint(constX)
    
    let constY = NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.centerY,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: container,
                                    attribute: NSLayoutAttribute.centerY,
                                    multiplier: 1,
                                    constant: yOffset)
    container.addConstraint(constY)
    
    let constW = NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1,
                                    constant: size.width)
    view.addConstraint(constW)
    
    let constH = NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.height,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1,
                                    constant: size.height)
    view.addConstraint(constH)
  }
  
  fileprivate func createViewContainers() -> NSDictionary {
    
    guard let items = tabBar.items else {
      fatalError("add items in tabBar")
    }
    
    var containersDict = [String: AnyObject]()
    
    for index in 0..<items.count {
      let viewContainer = createViewContainer()
      containersDict["container\(index)"] = viewContainer
    }
    
    var formatString = "H:|-(0)-[container0]"
    for index in 1..<items.count {
      formatString += "-(0)-[container\(index)(==container0)]"
    }
    formatString += "-(0)-|"
    let  constranints = NSLayoutConstraint.constraints(withVisualFormat: formatString,
                                                                       options:NSLayoutFormatOptions.directionRightToLeft,
                                                                       metrics: nil,
                                                                       views: (containersDict as [String : AnyObject]))
    view.addConstraints(constranints)
    
    return containersDict as NSDictionary
  }
  
  fileprivate func createViewContainer() -> UIView {
    let viewContainer = UIView();
    viewContainer.backgroundColor = UIColor.clear // for test
    viewContainer.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(viewContainer)
    
    // add gesture
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAMAnimatedTabBarController.tapHandler(_:)))
    tapGesture.numberOfTouchesRequired = 1
    viewContainer.addGestureRecognizer(tapGesture)
    
    // add constrains
    let constY = NSLayoutConstraint(item: viewContainer,
                                    attribute: NSLayoutAttribute.bottom,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: view,
                                    attribute: NSLayoutAttribute.bottom,
                                    multiplier: 1,
                                    constant: 0)
    
    view.addConstraint(constY)
    
    let constH = NSLayoutConstraint(item: viewContainer,
                                    attribute: NSLayoutAttribute.height,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1,
                                    constant: tabBar.frame.size.height)
    viewContainer.addConstraint(constH)
    
    return viewContainer
  }
  
  // MARK: actions
  
  open func tapHandler(_ gesture:UIGestureRecognizer) {
    
    guard let items = tabBar.items as? [RAMAnimatedTabBarItem],
      let gestureView = gesture.view else {
        fatalError("items must inherit RAMAnimatedTabBarItem")
    }
    
    let currentIndex = gestureView.tag
    
    if items[currentIndex].isEnabled == false { return }
    
    let controller = self.childViewControllers[currentIndex]
    
    if let shouldSelect = delegate?.tabBarController?(self, shouldSelect: controller)
      , !shouldSelect {
      return
    }
    
    if selectedIndex != currentIndex {
      let animationItem : RAMAnimatedTabBarItem = items[currentIndex]
      animationItem.playAnimation()
      
      let deselectItem = items[selectedIndex]
      
      let containerPrevious : UIView = deselectItem.iconView!.icon.superview!
      containerPrevious.backgroundColor = items[currentIndex].bgDefaultColor
      
      deselectItem.deselectAnimation()
      
      let container : UIView = animationItem.iconView!.icon.superview!
      container.backgroundColor = items[currentIndex].bgSelectedColor
      
      selectedIndex = gestureView.tag
      delegate?.tabBarController?(self, didSelect: controller)
      
    } else if selectedIndex == currentIndex {
      
      if let navVC = self.viewControllers![selectedIndex] as? UINavigationController {
        navVC.popToRootViewController(animated: true)
      }
    }
  }
}
