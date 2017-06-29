package externs;

import cpp.UInt8;
import cpp.Pointer;

@:include("./../lib/ThreadPool.h")
@:sourceFile("./../lib/ThreadPool.cpp")
@:native("ThreadPool")
extern class ThreadPool
{
   @:native("new ThreadPool")
   public static function create(threads:Int):Pointer<ThreadPool>;

//   public function enqueue<T>(task:T):Dynamic;
    
   @:native("~ThreadPool")
   public function deleteMe():Void;
}



// By extending RGB we keep the same API as far as haxe is concerned, but store the data (not pointer)
//  The native Reference class knows how to take the reference to the structure
@:native("cpp.Reference<ThreadPool>")
extern class ThreadPoolRef extends ThreadPool
{
}



// By extending RGBRef, we can keep the same api, 
//  rather than a pointer
@:native("cpp.Struct<ThreadPool>")
extern class ThreadPoolStruct extends ThreadPoolRef
{
}



