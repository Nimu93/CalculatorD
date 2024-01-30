import std.stdio;
import lexer;
import ast;
import parser.parser;
import execute;

void main(string[] args)
{
	if (args.length == 1)
	{
		writeln("Usage: ./main <filename>");
		return;
	}
	for (int i = 1; i < args.length; i++)
	{
		auto lex = lex(args[i]);
		auto queue = parse(lex);
		if (queue is null)
		{
			writeln("Error: Failed to parse this expression ", args[i]);
		}
		auto ast = build_ast(queue);
		if (ast is null)
		{
			writeln("Error: Failed to build ast for this expression ", args[i]);
		}
		writeln(execute_ast(ast));
	}
}
