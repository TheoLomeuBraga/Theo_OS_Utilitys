compiler_windows=x86_64-w64-mingw32-g++
compiler_linux=g++

flags=-std=c++20

test_file=./src/test_lib.cpp

includes=-I./src -I./include

lib_path_windows=-I./src/windows -I./src -I./include
lib_path_linux=-I./src/linux -I./src -I./include

lib_path=-L./built_lib
lib=-ltheo_os_library

lib_cpp_file_windows=./src/windows/theo_os_library.cpp
lib_cpp_file_linux=./src/linux/theo_os_library.cpp

output_foldet=./built
output_foldet_lib=./built_lib



windows:
	${compiler_windows} ${flags} -c ${lib_cpp_file_windows} ${lib_path_windows} ${lib_path}  
	ar rvs ${output_foldet_lib}/libtheo_os_library.a theo_os_library.o
	rm theo_os_library.o
	${compiler_windows} ${flags} ${test_file} ${includes} ${lib_path} ${lib}  -o ${output_foldet}/test.exe
linux:
	${compiler_linux} ${flags} -c ${lib_cpp_file_linux} ${lib_path_linux} ${lib_path}  
	ar rvs ${output_foldet_lib}/libtheo_os_library.a theo_os_library.o
	rm theo_os_library.o
	${compiler_linux} ${flags} ${test_file} ${includes} ${lib_path} ${lib}  -o ${output_foldet}/test
