module parser_tests;
import lexer;
import parser;
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