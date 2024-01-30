module parser.parser;

import stack;
import lexer;
import ast;
import queue;
import std.stdio;

int is_in_op(TYPE type)
{
    TYPE[] OPERATORS = [TYPE.PLUS, TYPE.MINUS, TYPE.MUL, TYPE.DIV];
    foreach (op; OPERATORS)
    {
        if (type == op)
        {
            return 1;
        }
    }
    return 0;
}

auto parse(Token[] tokens)
{
    Stack!(Ast!Token) stack = new Stack!(Ast!Token)();
    auto queue = new Queue!(Ast!Token)();
    int i = 0;
    while (tokens[i].type != TYPE.EOF)
    {
        if (tokens[i].type == TYPE.INTEGER)
        {
           queue.enqueue(new Ast!Token(tokens[i]));
        }
        else if (is_in_op(tokens[i].type))
        {
            while (!stack.isEmpty() && stack.peek().value.type != TYPE.LPAREN && stack.peek().value.type >= tokens[i].type)
            {
                queue.enqueue(stack.pop());
            }
            stack.push(new Ast!Token(tokens[i]));
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

auto build_ast(Queue!(Ast!Token) queue)
{
    auto stack = new Stack!(Ast!Token)();
    while (!queue.empty())
    {
        auto node = queue.dequeue();
        if (node.value.type == TYPE.INTEGER)
        {
            stack.push(node);
        }
        else
        {
            auto right = stack.pop();
            auto left = stack.pop();
            stack.push(new Ast!Token(node.value, left, right));
        }
    }
    if (stack.size() != 1)
    {
        writeln("Error: queue size is not 1");
        return null;
    }
    return stack.pop();
}