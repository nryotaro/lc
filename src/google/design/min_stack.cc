#include <bits/stdc++.h>
using namespace std;

class MinStack {
  public:
    stack<pair<int, int>> stk;
    /** initialize your data structure here. */
    MinStack() {}

    void push(int val) {
        if(stk.size() == 0) {
            stk.push({val, val});
			return;
		}
		
		stk.push({val, min(val, getMin())});
    }

    void pop() {
		stk.pop();
	}

    int top() {
		return stk.top().first;
	}

    int getMin() {
		return stk.top().second;
	}
};

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack* obj = new MinStack();
 * obj->push(val);
 * obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->getMin();
 */