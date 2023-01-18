#include <iostream>
using namespace std;
#include "theo_os_library.h"

int main() {
    print_test();
    cout << get_memory_used_mb() << endl;
    return 0;
}