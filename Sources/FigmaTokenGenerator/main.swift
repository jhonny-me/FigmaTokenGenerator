import ArgumentParser
import Foundation

struct FigmaTokenGenerator: ParsableCommand {
    @Argument(help: "input json file path")
    var inputPath: String

    @Argument(help: "output swift file path")
    var outputPath: String

    func run() {
        do {
            let jsonString = try String.init(contentsOfFile: inputPath)
            try jsonString.write(toFile: outputPath, atomically: true, encoding: .utf8)
            print(jsonString)
        } catch {
            print(error)
        }
        print(inputPath, outputPath)
    }
}

FigmaTokenGenerator.main()
