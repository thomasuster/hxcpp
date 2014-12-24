package;
import gc.TestGC;

class TestMain {

	static function main(){
		var r = new haxe.unit.TestRunner();
		r.add(new TestGC());
		r.add(new TestIntHash());
		r.add(new TestStringHash());
		r.add(new TestObjectHash());
		r.add(new TestWeakHash());
        r.add(new TestSerializer());
		var success = r.run();
        #if travis
		Sys.exit(success ? 0 : 1);
		#end
	}
}
