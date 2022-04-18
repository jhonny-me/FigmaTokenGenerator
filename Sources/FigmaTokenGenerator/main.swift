import ArgumentParser
import Foundation

struct FigmaTokenGenerator: ParsableCommand {
    @Argument(help: "input json file path")
    var inputPath: String

    @Argument(help: "output swift file path")
    var outputPath: String

    func run() {
        do {
            let jsonString = try String(contentsOfFile: inputPath)
            guard let data = jsonString.data(using: .utf8) else {
                fail("invalid input path")
                return
            }
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                fail("fail to read json")
                return
            }
            let keys = DesignTokenJsonParser().parseMap(json)
            print(keys)
        } catch {
            print(error)
        }
        print(inputPath, outputPath)
    }
}

FigmaTokenGenerator.main()
