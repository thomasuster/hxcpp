package;

import haxe.Unserializer;
import haxe.Serializer;

class SomeClass {
    public function new() {}
    public function execute():Void {}
}

class ClassReferenceObject {
    public var reference:Class<Dynamic>;
    public function new() {}
}

class TestSerializer extends haxe.unit.TestCase {

    public function testClassReferencesDoNotExplode():Void {
        var obj:ClassReferenceObject = new ClassReferenceObject();
        obj.reference = SomeClass;
        Unserializer.run(Serializer.run(obj));
        assertTrue(true);
    }

}
