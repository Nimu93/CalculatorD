module lexer;

import std.string;
import std.ascii;

enum TYPE {
    INTEGER,
    PLUS,
    MINUS,
    MUL,
    DIV,
    LPAREN,
    RPAREN,
    EOF
}

struct Token {
    TYPE type;
    string value;
}
Token[] lex(string input)
{
    Token[] Tokens;
    for(int i = 0; i < input.length; i++)
    {
        char c = input[i];
        switch(c){
            case '+':
                Tokens ~= Token(TYPE.PLUS, "" ~ c);
                break;
            case ' ':
                break;
            case '*':
                Tokens ~= Token(TYPE.MUL, "" ~ c);
                break;
            case '-' :
                Tokens ~= Token(TYPE.MINUS, "" ~ c);
                break;
            default:
                string num = "";
                while (isDigit(c))
                {
                    num ~= c;
                    i++;
                    if (i >= input.length)
                        break;
                    c = input[i];

                }
                if (num != "")
                {
                    Tokens ~= Token(TYPE.INTEGER, num);
                    break;
                }
        }
    }
    Tokens ~= Token(TYPE.EOF, "");
    return Tokens;  
}