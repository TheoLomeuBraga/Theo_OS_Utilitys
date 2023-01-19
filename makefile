compiler_windows=g++
compiler_linux=g++

flags=-std=c++17

test_file=./src/test_lib.cpp

includes=-I./src -I./include

lib_path_windows=-I./src/windows -I./src -I./include
lib_path_linux=-I./src/linux -I./src -I./include

lib_path=-L./built_lib
libs_windows=-ltheo_os_library -lkernel32 -lpsapi
libs_linux=-ltheo_os_library


lib_cpp_file_windows=./src/windows/theo_os_library.cpp
lib_cpp_file_linux=./src/linux/theo_os_library.cpp

output_foldet=./built
output_foldet_lib=./built_lib



windows:
	${compiler_windows} ${flags} -c ${lib_cpp_file_windows} ${lib_path_windows} ${lib_path}  
	ar rvs ${output_foldet_lib}/libtheo_os_library.a theo_os_library.o
	rm theo_os_library.o
	${compiler_windows} ${flags} ${test_file} ${includes} ${lib_path} ${libs_windows}  -o ${output_foldet}/test.exe
linux:
	${compiler_linux} ${flags} -c ${lib_cpp_file_linux} ${lib_path_linux} ${lib_path}  
	ar rvs ${output_foldet_lib}/libtheo_os_library.a theo_os_library.o
	rm theo_os_library.o
	${compiler_linux} ${flags} ${test_file} ${includes} ${lib_path} ${libs_linux}  -o ${output_foldet}/test
