package semmispeak.generators;

class MarkovChainGenerator implements Generator {
	public var keySize = 2;
	public var outputSize = 15;

	var input: Array<String> = [];
	var corpus: Map<String, Array<String>> = [];
	var corpusPrefixes: Array<String> = [];

	public function new() {}

	public function train(input: Array<String>) {
		this.input = input;

		for (i in 0...input.length-keySize) {
			final prefix = input.slice(i,  i + keySize).join(" ");
			var suffix = if (i + keySize < input.length) input[i + keySize] else "";
			var suffixes = corpus[prefix] != null ? corpus[prefix] : {
				corpus.set(prefix, []);
				corpus[prefix];
			}
			suffixes.push(suffix);
		}

		for (prefix in corpus.keys()) {
			corpusPrefixes.push(prefix);
		}
	}

	public function generate(): String {
		var output: Array<String> = [];
		var prefix = corpusPrefixes[Std.random(corpusPrefixes.length)];
		output = output.concat(prefix.split(" "));

		for (i in 1...input.length) {
			final nextSuffix = corpus[prefix] != null ? corpus[prefix][Std.random(corpus[prefix].length)] : "";
			output.push(nextSuffix);

			if (output.length >= outputSize) break;
			prefix = output.slice(i, i + keySize + 1).join(" ");
		}

		return output.join(" ");
	}
}
