module queue;

import std.stdio: writef;
import std.container :SList;
import std.algorithm.searching: count;

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
    int size() {
        int c = cast(int) count(list[]);
        return c;
    }

    void print() {
        foreach (v; list[]) {
            writef("%s ", v.value);
        }
        writef("\n");
    }
}