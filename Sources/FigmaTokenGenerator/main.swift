import ArgumentParser
import Foundation

struct FigmaTokenGenerator: ParsableCommand {
    @Argument(help: "input json file path")
    var inputPath: String

    @Argument(help: "output swift file path")
    var outputPath: String

    func run() {
        print(inputPath)
    }
}

FigmaTokenGenerator.main()
