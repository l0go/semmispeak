package semmispeak;

interface Splitter {
	public function input(val: String): Void;
	public function split(): Array<String>;
}
