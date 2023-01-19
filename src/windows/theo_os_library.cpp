
#include <iostream>
#include <theo_os_library.h>

#include <windows.h>
#include <psapi.h>


void print_test(){std::cout << "this is a test" << std::endl;}

float get_memory_used_mb(){
    PROCESS_MEMORY_COUNTERS_EX pmc;
    GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc, sizeof(pmc));
    return ((float)pmc.PrivateUsage);
}