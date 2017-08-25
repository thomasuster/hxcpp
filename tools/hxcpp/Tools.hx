import haxe.CallStack;
class Tools {
  private static var onExit:Array<Int->Void> = [];

  public static function addOnExitHook(fn:Int->Void) {
    onExit.push(fn);
  }

  public static function exit(exitCode:Int) {
     if(exit != 0) {
        Sys.println("GOT HERE");
        Sys.println(CallStack.toString(CallStack.callStack()));   
     }
    for (hook in onExit) {
      hook(exitCode);
    }
    Sys.exit(exitCode);
  }
}
