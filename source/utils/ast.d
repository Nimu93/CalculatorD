module ast;

import std.stdio;

class Ast(T)
{
    public T value;
    public Ast left;
    public Ast right;
    this(T value, Ast left, Ast right)
    {
        this.value = value;
        this.left = left;
        this.right = right;
    }
    this(T value)
    {
        this.value = value;
    }

    void print(int depth)
    {
        for (int i = 0; i < depth; i++)
        {
            write("  ");
        }
        writeln(value);
        if (left !is null)
        {
            left.print(depth + 1);
        }
        if (right !is null)
        {
            right.print(depth + 1);
        }
    }
}