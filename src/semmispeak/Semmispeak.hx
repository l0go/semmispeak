package semmispeak;

typedef TextGenerationParams = {
	?input: String,
	splitter: Splitter,
	generator: Generator
};

class Semmispeak {
	var params: TextGenerationParams;

	public function new(params: TextGenerationParams) {
		this.params = params;
	}

	public function train(): Semmispeak {
		params.splitter.input(params.input);
		params.generator.train(params.splitter.split());
		return this;
	}

	public function text(): String {
		return params.generator.generate();
	}
}
