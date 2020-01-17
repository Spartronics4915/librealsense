include(ExternalProject)

# Ugly nasty very bad hack below
# libusb stubbornly choses to not cross compile, so I had to resort to cloning libusb separately and running the appropriate autotools and make commands
# It's even worse because we're running make at "configure" time, but this is the most seamless way to make the entire thing work

find_package(Git QUIET)

if (GIT_FOUND AND DEFINED BinaryPrefix AND DEFINED ToolchainName)
	execute_process(COMMAND ${GIT_EXECUTABLE} clone https://github.com/libusb/libusb.git --single-branch librealsense_libusb
			WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
			RESULT_VARIABLE res)
	execute_process(COMMAND ${GIT_EXECUTABLE} checkout 2a7372db54094a406a755f0b8548b614ba8c78ec
			WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/librealsense_libusb") # Checks out commit for v1.0.22 + Mac get_device_list hang fix
	execute_process(COMMAND "${CMAKE_SOURCE_DIR}/libusb_cross.sh" ${BinaryPrefix} ${ToolchainName} ${CMAKE_SYSROOT}
			WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/librealsense_libusb")

	message(MESSAGE "A bruh moment: ${ToolchainName}")

else()
	message(FATAL_ERROR "Git and a valid roboRIO toolchain file is required to build external libusb for librealsense on the roboRIO")
endif()
