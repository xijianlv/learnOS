# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/xijianlv/clion-2021.2.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/xijianlv/clion-2021.2.4/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xijianlv/CLionProjects/os/learnOS

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/learnOS.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/learnOS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/learnOS.dir/flags.make

CMakeFiles/learnOS.dir/main.c.o: CMakeFiles/learnOS.dir/flags.make
CMakeFiles/learnOS.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/learnOS.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/learnOS.dir/main.c.o -c /home/xijianlv/CLionProjects/os/learnOS/main.c

CMakeFiles/learnOS.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/learnOS.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/xijianlv/CLionProjects/os/learnOS/main.c > CMakeFiles/learnOS.dir/main.c.i

CMakeFiles/learnOS.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/learnOS.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/xijianlv/CLionProjects/os/learnOS/main.c -o CMakeFiles/learnOS.dir/main.c.s

# Object files for target learnOS
learnOS_OBJECTS = \
"CMakeFiles/learnOS.dir/main.c.o"

# External object files for target learnOS
learnOS_EXTERNAL_OBJECTS =

learnOS: CMakeFiles/learnOS.dir/main.c.o
learnOS: CMakeFiles/learnOS.dir/build.make
learnOS: CMakeFiles/learnOS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable learnOS"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/learnOS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/learnOS.dir/build: learnOS
.PHONY : CMakeFiles/learnOS.dir/build

CMakeFiles/learnOS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/learnOS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/learnOS.dir/clean

CMakeFiles/learnOS.dir/depend:
	cd /home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xijianlv/CLionProjects/os/learnOS /home/xijianlv/CLionProjects/os/learnOS /home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug /home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug /home/xijianlv/CLionProjects/os/learnOS/cmake-build-debug/CMakeFiles/learnOS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/learnOS.dir/depend
