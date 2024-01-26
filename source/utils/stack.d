module stack;

import std.container: Array;

class Stack(T)
{
    private Array!T _array;

    this()
    {
        _array = Array!T();
    }

    void push(T value)
    {
        _array.insertBack(value);
    }

    auto pop()
    {
        if (_array.empty)
            return null;
        T value = _array[$ - 1];
        _array.removeBack();
        return value;
    }

    T peek()
    {
        return _array.back;
    }

    bool isEmpty()
    {
        return _array.empty;
    }

    size_t size()
    {
        return _array.length;
    }
}