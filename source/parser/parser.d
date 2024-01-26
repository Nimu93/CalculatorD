module parser;

import stack;
import lexer;
import ast;
import queue;
import std.stdio;

auto parse(Token[] tokens)
{
    TYPE[] OPERATORS = [TYPE.PLUS, TYPE.MINUS, TYPE.MUL, TYPE.DIV];
    Stack!(Ast!Token) stack = new Stack!(Ast!Token)();
    auto queue = new Queue!(Ast!Token)();
    int i = 0;
    while (tokens[i].type != TYPE.EOF)
    {
        if (tokens[i].type == TYPE.INTEGER)
        {
           queue.enqueue(new Ast!Token(tokens[i]));
        }
        foreach (op; OPERATORS)
        {
            if (tokens[i].type == op)
            {
                stack.push(new Ast!Token(tokens[i]));
            }
        }
        i++;
    }
    while (!stack.isEmpty())
    {
        queue.enqueue(stack.pop());
    }
    return queue;
}