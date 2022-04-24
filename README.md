# FigmaTokenGenerator
Swift Command line tool to generate static strings from a Figma Design Token Json file.

## Installation

[CocoaPods](http://cocoapods.org) is the recommended way of installation, as this avoids including any binary files into your project.

_Note on Carthage: FigmaTokenGenerator is a tool used in a build step, it is not a dynamic library. Therefore [it is not possible](https://github.com/mac-cain13/R.swift/issues/42) to install it with Carthage._

### CocoaPods (recommended)

1. Add `pod 'FigmaTokenGenerator'` to your [Podfile](http://cocoapods.org/#get_started) and run `pod install`
2. In Xcode: Click on your project in the file list, choose your target under `TARGETS`, click the `Build Phases` tab and add a `New Run Script Phase` by clicking the little plus icon in the top left
3. Drag the new `Run Script` phase **above** the `Compile Sources` phase and **below** `Check Pods Manifest.lock`, expand it and paste the following script:  
   ```bash
   "$PODS_ROOT/FigmaTokenGenerator/FigmaTokenGenerator" "$SRCROOT/{PATH TO YOUR JSON}/tokens.json" "$SRCROOT/{PATH TO OUTPUT}/DesignTokenIdentity.swift"
   ```
4. Add `$SRCROOT/{PATH TO OUTPUT}/DesignTokenIdentity.swift` to the "Output Files" of the Build Phase
5. Uncheck "Based on dependency analysis" so that FigmaTokenGenerator is run on each build
6. Build your project, in Finder you will now see a `DesignTokenIdentity.swift` in the `$SRCROOT`-folder, drag the `DesignTokenIdentity.swift` files into your project and **uncheck** `Copy items if needed`

## Usage


```bash
   "$PODS_ROOT/FigmaTokenGenerator/FigmaTokenGenerator" "$SRCROOT/{PATH TO YOUR JSON}/tokens.json" "$SRCROOT/{PATH TO OUTPUT}/DesignTokenIdentity.swift"
```
