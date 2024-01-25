import std.stdio;
import lexer;

void main()
{
	Token[] lex = lex("1 + 2 + 3");
	foreach (Token t; lex)
	{
		writeln(t);
	}	
}
