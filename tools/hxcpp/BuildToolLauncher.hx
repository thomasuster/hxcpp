import sys.FileSystem;

class BuildToolLauncher 
{
    public static function main():Void {
        var bin:String = './bin/tools/${calcBinName()}';
        if(FileSystem.exists(bin) && !isBuildingSelf()) {
            Sys.exit(Sys.command('./bin/tools/${calcBinName()}', Sys.args()));
        }
        else {
            Sys.exit(Sys.command('neko', ['hxcpp-fallback.n'].concat(Sys.args())));
        }
    }
    
    static function isBuildingSelf():Bool {
        if(sys.FileSystem.exists('BuildToolLauncher.hx')) {
            if(sys.io.File.getContent('BuildToolLauncher.hx') == haxe.Resource.getString("BuildToolLauncherSignature")) {
                return true;
            }
        }
        return false;
    }

    static function calcBinName():String {
        #if windows
        return 'BuildTool-debug.exe';
        #else
        return 'BuildTool-debug';
        #end
    }
}