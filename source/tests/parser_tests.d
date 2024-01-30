module parser_tests;
import lexer;
import parser.parser;
import ast;
import std.stdio;

unittest 
{
    writeln("------------------Parse:1 + 1------------------");
    auto toks = lex("1 + 1");
    auto queue = parse(toks);
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "1"));
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "1"));
    assert(queue.dequeue().value == Token(TYPE.PLUS, "+"));
    assert(queue.empty);
    writeln("Test passed !");
}

unittest 
{
    writeln("------------------Parse:1 + 1 * 2------------------");
    auto toks = lex("1 + 1 * 2");
    auto queue = parse(toks);
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "1"));
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "1"));
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "2"));
    assert(queue.dequeue().value == Token(TYPE.MUL, "*"));
    assert(queue.dequeue().value == Token(TYPE.PLUS, "+"));
    assert(queue.empty);
    writeln("Test passed !");
}

unittest 
{
    writeln("------------------Parse:(1 + 1) * 2------------------");
    auto toks = lex("(1 + 1) * 2");
    auto queue = parse(toks);
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "1"));
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "1"));
    assert(queue.dequeue().value == Token(TYPE.PLUS, "+"));
    assert(queue.dequeue().value == Token(TYPE.INTEGER, "2"));
    assert(queue.dequeue().value == Token(TYPE.MUL, "*"));
    assert(queue.empty);
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Build ast:1 + 1 * 2 + 3------------------");
    auto toks = lex("1 + 1 * 2 + 3");
    auto queue = parse(toks);
    auto ast = build_ast(queue);
    assert(ast.left.value == Token(TYPE.PLUS, "+"));
    assert(ast.right.value == Token(TYPE.INTEGER, "3"));
    assert(ast.value == Token(TYPE.PLUS, "+"));
    assert(ast.left.left.value == Token(TYPE.INTEGER, "1"));
    assert(ast.left.right.value == Token(TYPE.MUL, "*"));
    assert(ast.left.right.left.value == Token(TYPE.INTEGER, "1"));
    assert(ast.left.right.right.value == Token(TYPE.INTEGER, "2"));
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Build ast:(1 + 1) * 2 + 3------------------");
    auto toks = lex("(1 + 1) * 2 + 3");
    auto queue = parse(toks);
    auto ast = build_ast(queue);
    assert(ast.value == Token(TYPE.PLUS, "+"));
    assert(ast.left.value == Token(TYPE.MUL, "*"));
    assert(ast.right.value == Token(TYPE.INTEGER, "3"));
    assert(ast.left.left.value == Token(TYPE.PLUS, "+"));
    assert(ast.left.right.value == Token(TYPE.INTEGER, "2"));
    assert(ast.left.left.left.value == Token(TYPE.INTEGER, "1"));
    assert(ast.left.left.right.value == Token(TYPE.INTEGER, "1"));
    writeln("Test passed !");
}