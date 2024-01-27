module parser.parser;

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
        if (tokens[i].type == TYPE.LPAREN)
        {
            stack.push(new Ast!Token(tokens[i]));
        }
        else if (tokens[i].type == TYPE.RPAREN)
        {
            while (stack.peek().value.type != TYPE.LPAREN)
            {
                queue.enqueue(stack.pop());
            }
            stack.pop();
        }
        i++;
    }
    while (!stack.isEmpty())
    {
        queue.enqueue(stack.pop());
    }
    return queue;
}
/*
auto build_test(Queue!(Ast!Token) queue)
{
    while (!queue.empty())
    {
        Ast!Token tok = queue.dequeue();
        switch (tok.value.type)
        {
            case TYPE.INTEGER:

        }
    }
}
*/