package;

class Main {
	static function main() {
		var speak = new semmispeak.Semmispeak({
			input: sys.io.File.getContent("test/semmitext.txt"),
			splitter: new semmispeak.splitters.PerWordSplitter(),
			generator: new semmispeak.generators.MarkovChainGenerator(),
		}).train();

		trace(speak.text());
	}
}
