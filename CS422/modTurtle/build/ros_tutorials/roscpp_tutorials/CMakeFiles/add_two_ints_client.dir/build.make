# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build

# Include any dependencies generated for this target.
include ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/depend.make

# Include the progress variables for this target.
include ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/progress.make

# Include the compile flags for this target's objects.
include ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/flags.make

ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.o: ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/flags.make
ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.o: /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src/ros_tutorials/roscpp_tutorials/add_two_ints_client/add_two_ints_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.o"
	cd /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.o -c /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src/ros_tutorials/roscpp_tutorials/add_two_ints_client/add_two_ints_client.cpp

ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.i"
	cd /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src/ros_tutorials/roscpp_tutorials/add_two_ints_client/add_two_ints_client.cpp > CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.i

ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.s"
	cd /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src/ros_tutorials/roscpp_tutorials/add_two_ints_client/add_two_ints_client.cpp -o CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.s

# Object files for target add_two_ints_client
add_two_ints_client_OBJECTS = \
"CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.o"

# External object files for target add_two_ints_client
add_two_ints_client_EXTERNAL_OBJECTS =

/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/add_two_ints_client/add_two_ints_client.cpp.o
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/build.make
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/libroscpp.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libpthread.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/libxmlrpcpp.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/librosconsole.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/libroscpp_serialization.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/librostime.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /opt/ros/noetic/lib/libcpp_common.so
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: /usr/lib/x86_64-linux-gnu/libboost_atomic.so.1.71.0
/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client: ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client"
	cd /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/add_two_ints_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/build: /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/devel/lib/roscpp_tutorials/add_two_ints_client

.PHONY : ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/build

ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/clean:
	cd /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials && $(CMAKE_COMMAND) -P CMakeFiles/add_two_ints_client.dir/cmake_clean.cmake
.PHONY : ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/clean

ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/depend:
	cd /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/src/ros_tutorials/roscpp_tutorials /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials /media/alex/AlexPortableSSD/School/4th-year/CS422/modTurtle/build/ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ros_tutorials/roscpp_tutorials/CMakeFiles/add_two_ints_client.dir/depend

