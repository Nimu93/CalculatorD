module execute;

import ast;
import std.conv;
import lexer;

int execute_ast(Ast!Token ast) {
    if (ast.value.type == TYPE.INTEGER)
    {
        return parse!int(ast.value.value);
    }
    else if (ast.value.type == TYPE.MUL)
    {
        return execute_ast(ast.left) * execute_ast(ast.right);
    }
    else if (ast.value.type == TYPE.PLUS)
    {
        return execute_ast(ast.left) + execute_ast(ast.right);
    }
    else if (ast.value.type == TYPE.MINUS)
    {
        return execute_ast(ast.left) - execute_ast(ast.right);
    }
    else if (ast.value.type == TYPE.DIV)
    {
        auto right = execute_ast(ast.right);
        if (right == 0)
        {
            throw new Exception("Division by zero");
        }
        return execute_ast(ast.left) / right;
    }
    return -1;
}