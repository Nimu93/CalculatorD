module ast;

class Ast(T)
{
    public T value;
    public Ast left;
    public Ast right;
    this(T value)
    {
        this.value = value;
    }
}