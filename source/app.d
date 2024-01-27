import std.stdio;
import lexer;
import ast;
import parser.parser;

void print_ast(Ast!Token ast)
{
	writeln(ast);
	if (ast.left)
	{
		print_ast(ast.left);
	}
	if (ast.right)
	{
		print_ast(ast.right);
	}
}

void main()
{
	Token[] lex = lex("(1 + 1) * 2");
	foreach (Token t; lex)
	{
		writeln(t);
	}
	auto queue = parse(lex);
    while (!queue.empty())
    {
        writeln(queue.dequeue().value.type);   
    }
	//print_ast(parse(lex));
}
