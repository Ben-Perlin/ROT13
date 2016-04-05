import std.ascii;
import std.range;
import std.stdio;

int main(string[] args) {
    File input;

    if (args.length == 1) {
        input = stdin;
    } else if (args.length == 2) {
        input = File(args[1], "r");
    } else {
        stderr.writeln("USAGE: rot13 [filename]");
        return 1;
    }

    dchar[] yvar;
    foreach (line; input.byLine(KeepTerminator.yes)) {
        foreach (c; line.stride(1)) {
            switch(c) {
            case 'A': .. case 'Z':
                yvar ~= ((c - 'A') + 13) % 26 + 'A';
                break;

            case 'a': .. case 'z':
                yvar ~= ((c - 'a') + 13) % 26 + 'a';
                break;

            default:
                yvar ~= c;
            }
        }
        write(yvar);
        yvar = [];
    }

    input.close();
    return 0;
}
