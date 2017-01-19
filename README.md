# DKDetailsParallax [![Build Status](https://travis-ci.com/Darkkrye/DKDetailsParallax.svg?token=p53aoPs64tosEd87hUrw&branch=master)](https://travis-ci.com/Darkkrye/DKDetailsParallax)

## Installation
DKDetailsParallax is a framework available in Cocoapods.

To install add this line to your Podfile :

```ruby
pod 'DKDetailsParallax'
```

## Content
By default, the framework contains a ViewController to inherit. This ViewController contains all the basic code to have a Parallax header and a UITableView.

The framework also contains few cells that you can use for the UITableView. Some other will be added step by step. You can also check for how cells are created to create your own ones.


## Cell list
Cells are grouped by theme :
- Rounded Theme :
  - RoundedDetailsProfileCell,
  - RoundedDetailsRectangleProfileCell,
  - RoundedButtonCell;
- Flat Light Theme :
  - FlatLightSimpleDescriptionCell,
  - FlatLightSimpleLabelCell,
  - FlatLightSwitchCell;
- Flat Dark Theme :
  - FlatDarkSimpleDescriptionCell,
  - FlatDarkSimpleLabelCell,
  - FlatDarkSwitchCell;


## Usage
For the first step, you have to create a new `UIViewController`, import `DKDetailsParallax` and make it inherit from `DKDetailsParallaxViewController`. Then override default methods by adding your own code and your variables. Don't forget the last two lines inside the viewDidLoad method.

```swift
import DKDetailsParallax

class MyViewController: DKDetailsParallaxViewController {

    var myObject: MyObject
    var primaryColor: UIColor
    var secondaryColor: UIColor

    override func viewDidLoad() {
        super.viewDidLoad()

        // Your code to retrieve or make something with you data.
        // ...
        myObject.retrieveInformation()
        // ...

        // Don't forget to set headerImage and call setupController function at the end of the viewDidLoad. If you are making web calls then add these two lines in the main Thread
        self.headerImage = myObject.imageBanner
        self.setupController()
    }
}
```

Next step is to create a new extension to override `UITableView` methods. Inside it you can use the cells as you want it.

```swift
extension MyViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var roundedDetailsProfile: RoundedDetailsRectangleProfile! = tableView.dequeueReusableCell(withIdentifier: "RoundedDetailsRectangleProfile") as? RoundedDetailsRectangleProfile

            if roundedDetailsProfile == nil {
                roundedDetailsProfile = RoundedDetailsRectangleProfile.detailsProfile(withPrimaryColor: self.primaryColor, andSecondaryColor: nil)
            }

            roundedDetailsProfile.rectangleImageView.image = myObject.image
            roundedDetailsProfile.titleLabel.text = "\(myObject.title) - \(myObject.information)"
            roundedDetailsProfile.subtitleLabel.text = "\(myObject.anotherInformation)"

            roundedDetailsProfile.delegate = self

            return roundedDetailsProfile

        case 1:
            var roundedDetailsProfile: RoundedDetailsProfile! = tableView.dequeueReusableCell(withIdentifier: "RoundedDetailsProfile") as? RoundedDetailsProfile

            if roundedDetailsProfile == nil {
                roundedDetailsProfile = RoundedDetailsProfile.detailsProfile(withPrimaryColor: self.primaryColor, andSecondaryColor: nil)
            }

            roundedDetailsProfile.squareImageView.image = myObject.image
            roundedDetailsProfile.titleLabel.text = "\(myObject.title) - \(myObject.information)"
            roundedDetailsProfile.subtitleLabel.text = "\(myObject.anotherInformation)"

            roundedDetailsProfile.delegate = self

            return roundedDetailsProfile

        case 2:
            var flatSimpleCell: FlatLightSimpleLabelCell! = tableView.dequeueReusableCell(withIdentifier: "FlatLightSimpleLabelCell") as? FlatLightSimpleLabelCell

            if flatSimpleCell == nil {
                flatSimpleCell = FlatLightSimpleLabelCell.simpleCell(withPrimaryColor: self.primaryColor, andSecondaryColor: nil)
            }

            flatSimpleCell.contentLabel.text = "DARK SIDE"

            return flatSimpleCell

        case 3:
            var flatDescCell: FlatLightSimpleDescriptionCell! = tableView.dequeueReusableCell(withIdentifier: "FlatLightSimpleDescriptionCell") as? FlatLightSimpleDescriptionCell

            if flatDescCell == nil {
                flatDescCell = FlatLightSimpleDescriptionCell.simpleDescriptionCell(withPrimaryColor: nil, andSecondaryColor: nil)
            }

            flatDescCell.setTitleText(text: "full name")
            flatDescCell.contentLabel.text = "Anakin Skywalker"

            return flatDescCell

        case 4:
            var switchCell: FlatLightSwitchCell! = tableView.dequeueReusableCell(withIdentifier: "FlatLightSwitchCell") as? FlatLightSwitchCell

            if switchCell == nil {
                switchCell = FlatLightSwitchCell.switchCell(withPrimaryColor: nil, andSecondaryColor: nil)
            }

            switchCell.setTitleText(text: "Sexe")
            switchCell.switchView.leftText = "Male"
            switchCell.switchView.rightText = "Female"
            switchCell.switchView.rightSelected = false

            switchCell.delegate = self

            return switchCell

        case 5:
            var flatSimpleCell: FlatDarkSimpleLabelCell! = tableView.dequeueReusableCell(withIdentifier: "FlatDarkSimpleLabelCell") as? FlatDarkSimpleLabelCell

            if flatSimpleCell == nil {
                flatSimpleCell = FlatDarkSimpleLabelCell.simpleCell(withPrimaryColor: self.primaryColor, andSecondaryColor: nil)
            }

            flatSimpleCell.contentLabel.text = "DARK SIDE"

            return flatSimpleCell

        case 6:
            var flatDescCell: FlatDarkSimpleDescriptionCell! = tableView.dequeueReusableCell(withIdentifier: "FlatDarkSimpleDescriptionCell") as? FlatDarkSimpleDescriptionCell

            if flatDescCell == nil {
                flatDescCell = FlatDarkSimpleDescriptionCell.simpleDescriptionCell(withPrimaryColor: nil, andSecondaryColor: nil)
            }

            flatDescCell.setTitleText(text: "full name")
            flatDescCell.contentLabel.text = "Anakin Skywalker"

            return flatDescCell

        case 7:
            var switchCell: FlatDarkSwitchCell! = tableView.dequeueReusableCell(withIdentifier: "FlatDarkSwitchCell") as? FlatDarkSwitchCell

            if switchCell == nil {
                switchCell = FlatDarkSwitchCell.switchCell(withPrimaryColor: nil, andSecondaryColor: nil)
            }

            switchCell.setTitleText(text: "Gender")
            switchCell.switchView.leftText = "Male"
            switchCell.switchView.rightText = "Female"
            switchCell.switchView.rightSelected = false

            switchCell.delegate = self

            return switchCell

        case 8:
            var buttonCell: RoundedButtonCell! = tableView.dequeueReusableCell(withIdentifier: "RoundedButtonCell") as? RoundedButtonCell

            if buttonCell == nil {
                buttonCell = RoundedButtonCell.buttonCell(withPrimaryColor: self.primaryColor, andSecondaryColor: nil)
            }

            buttonCell.button.setTitle("\(myObject.actionName)", for: .normal)

            buttonCell.delegate = self

            return buttonCell

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return RoundedDetailsRectangleProfile.defaultHeight

        case 1:
            return RoundedDetailsProfile.defaultHeight

        case 2:
            return FlatLightSimpleLabelCell.defaultHeight

        case 3:
            return FlatLightSimpleDescriptionCell.defaultHeight

        case 4:
            return FlatLightSwitchCell.defaultHeight

        case 5:
            return FlatDarkSimpleLabelCell.defaultHeight

        case 6:
            return FlatDarkSimpleDescriptionCell.defaultHeight

        case 7:
            return FlatDarkSwitchCell.defaultHeight

        case 8:
            return RoundedButtonCell.defaultHeight

        default:
            return 44
        }
    }
}
```

And the last step, is to create a new extension to conforms to the cells delegate. Because you will not use every cells, all of the callback functions are optional

```swift
extension MyViewController: DKDetailsParallaxCellDelegate {
  // MARK: - Rounded Theme
  // MARK: RoundedDetailsProfileCell
  func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forCircleButton: UIButton) {
    // Add Your Code
  }
  func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forOutlinedButton: UIButton) {
    // Add Your Code
  }
  func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forPlainButton: UIButton) {
    // Add Your Code
  }

  // MARK: RoundedDetailsRectangleProfileCell
  func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forCircleButton: UIButton) {
    // Add Your Code
  }
  func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forOutlinedButton: UIButton) {
    // Add Your Code
  }
  func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forPlainButton: UIButton) {
    // Add Your Code
  }

  // MARK: RoundedButtonCell
  func roundedButtonCellCallback(cell: RoundedButtonCell, forButton: UIButton) {
    // Add Your Code
  }

  /* ------------------------------------------------------------------------------------------------------------------------------------------ */

  // MARK: - Flat Light Theme
  // FlatLightSwitchCell
  func flatLightSwitchCellCallback(cell: FlatLightSwitchCell, onSwitchUpdate: Switch, toTheValue: String) {
    // Add Your Code
  }

  /* ------------------------------------------------------------------------------------------------------------------------------------------ */

  // MARK: - Flat Light Theme
  // FlatDarkSwitchCell
  func flatDarkSwitchCellCallback(cell: FlatDarkSwitchCell, onSwitchUpdate: Switch, toTheValue: String) {
    // Add Your Code
  }
}
```

Final Step: ENJOY !


## Version
Current stable version `1.0.3`

## Continuous Integration
### Master [![Build Status](https://travis-ci.com/Darkkrye/DKDetailsParallax.svg?token=p53aoPs64tosEd87hUrw&branch=master)](https://travis-ci.com/Darkkrye/DKDetailsParallax)
### Develop [![Build Status](https://travis-ci.com/Darkkrye/DKDetailsParallax.svg?token=p53aoPs64tosEd87hUrw&branch=develop)](https://travis-ci.com/Darkkrye/DKDetailsParallax)

## Thanks to
I use T-Pham/Switch library for the Switch in the cell, so thanks to him.
