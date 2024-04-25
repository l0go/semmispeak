package semmispeak;

interface Generator {
	public function train(input: Array<String>): Void;
	public function generate(): String;
}
