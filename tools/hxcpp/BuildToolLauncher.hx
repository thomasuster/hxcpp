import sys.FileSystem;

class BuildToolLauncher 
{
    public static function main():Void {
      Log.info("STARTED");
        var bin:String = './bin/tools/${calcBinName()}';
        if(FileSystem.exists(bin) && !isBuildingSelf()) {
        Log.info("CPP");
        var code = Sys.command('./bin/tools/${calcBinName()}', Sys.args());
        Log.info("FINISHED CPP RUN");
            Sys.exit(code);
            Log.info("FINISHED CPP EXIT");
        }
        else {
        Log.info("NEKO");
            Sys.exit(Sys.command('neko', ['hxcpp-fallback.n'].concat(Sys.args())));
        }
    }
    
    static function isBuildingSelf():Bool {
        var args:Array<String> = Sys.args();
        var last:String = args[args.length-1]; 
        if(sys.FileSystem.exists('${last}../../haxelib.json')) {
            
            if(sys.io.File.getContent('${last}../../haxelib.json') == haxe.Resource.getString("Signature")) {
                return true;
            }
        }
        return false;
    }

    static function calcBinName():String {
        var binName:String = 'BuildTool';
        #if debug
        binName+='-debug';
        #end
        if(Sys.systemName() == 'Windows')
            binName+='.exe';
        return binName;
    }
}