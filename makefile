compiler=g++
flags=-std=c++20

test_file=./src/test_lib.cpp

includes=-I./src

includes_lib_windows=-I./src/windows -I./src
includes_lib_linux=-I./src/linux -I./src

lib_path=-L./built_lib
lib=-ltheo_os_library

lib_cpp_file_windows=./src/windows/theo_os_library.cpp
lib_cpp_file_linux=./src/linux/theo_os_library.cpp

output_foldet=./built
output_foldet_lib=./built_lib



windows:
	${compiler} ${flags} -c ${lib_cpp_file_windows} ${includes_lib_windows} ${lib_path}  
	ar rvs ${output_foldet_lib}/libtheo_os_library.a theo_os_library.o
	rm theo_os_library.o
	${compiler} ${flags} ${test_file} ${lib_path} ${lib}  -o ${output_foldet}/test.exe
linux:
	${compiler} ${flags} -c ${lib_cpp_file_linux} ${includes_lib_linux} ${lib_path}  
	ar rvs ${output_foldet_lib}/libtheo_os_library.a theo_os_library.o
	rm theo_os_library.o
	${compiler} ${flags} ${test_file} ${lib_path} ${lib}  -o ${output_foldet}/test
