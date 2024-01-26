module queue;

import std.container :SList;

class Queue(T) {
    private SList!T list;

    this() {
        list = SList!T();
    }

    void enqueue(T value) {
        list.insertAfter(list[], value);
    }

    auto dequeue() {
        if (list.empty) {
            return null;
        }
        T value = list.front;
        list.removeFront();
        return value;
    }

    T peek() {
        return list.front;
    }

    bool empty() {
        return list.empty;
    }
}