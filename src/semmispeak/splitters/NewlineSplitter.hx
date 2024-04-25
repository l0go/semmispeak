package semmispeak.splitters;

class NewlineSplitter implements Splitter {
	var content: String;

	public function new() {}

	public function input(val: String) {
		this.content = val;
	}

	public function split(): Array<String> {
		return content?.split("\n") ?? [];
	}
}
