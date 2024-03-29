module tests;
import lexer;
import std.stdio;

unittest
{
    writeln("------------------Lex:1 + 1------------------");
    Token[] tokens = lex("1 + 1");
    Token[] excepted = [
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.PLUS, "+"),
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.EOF, "")
    ];
    assert(tokens == excepted, "1 + 1");
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Lex:1 + 1 * 2------------------");
    Token[] tokens = lex("1 + 1 * 2");
    Token[] excepted = [
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.PLUS, "+"),
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.MUL, "*"),
        Token(TYPE.INTEGER, "2"),
        Token(TYPE.EOF, "")
    ];
    assert(tokens == excepted, "1 + 1 * 2");
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Lex:1 + 1 * 2 - 3------------------");
    Token[] tokens = lex("1 + 1 * 2 - 3");
    Token[] excepted = [
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.PLUS, "+"),
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.MUL, "*"),
        Token(TYPE.INTEGER, "2"),
        Token(TYPE.MINUS, "-"),
        Token(TYPE.INTEGER, "3"),
        Token(TYPE.EOF, "")
    ];
    assert(tokens == excepted, "1 + 1 * 2 - 3");
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Lex:44------------------");
    Token[] tokens = lex("44");
    Token[] excepted = [
        Token(TYPE.INTEGER, "44"),
        Token(TYPE.EOF, "")
    ];
    assert(tokens == excepted, "44");
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Lex:44 + 1------------------");
    Token[] tokens = lex("44 + 1");
    Token[] excepted = [
        Token(TYPE.INTEGER, "44"),
        Token(TYPE.PLUS, "+"),
        Token(TYPE.INTEGER, "1"),
        Token(TYPE.EOF, "")
    ];
    assert(tokens == excepted, "44 + 1");
    writeln("Test passed !");
}

unittest
{
    writeln("------------------Lex:44 * 142 / 7555 (( )) ) + 7557------------------");
    Token[] tokens = lex("44 * 142 / 7555 (( )) ) + 7557");
    Token[] excepted = [
        Token(TYPE.INTEGER, "44"),
        Token(TYPE.MUL, "*"),
        Token(TYPE.INTEGER, "142"),
        Token(TYPE.DIV, "/"),
        Token(TYPE.INTEGER, "7555"),
        Token(TYPE.LPAREN, "("),
        Token(TYPE.LPAREN, "("),
        Token(TYPE.RPAREN, ")"),
        Token(TYPE.RPAREN, ")"),
        Token(TYPE.RPAREN, ")"),
        Token(TYPE.PLUS, "+"),
        Token(TYPE.INTEGER, "7557"),
        Token(TYPE.EOF, "")
    ];
    assert(tokens == excepted, "44 * 142 / 7555 (( )) ) + 7557");
    writeln("Test passed !");
}