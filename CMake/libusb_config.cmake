function(findusb errormsg)
	find_library(LIBUSB_LIB usb-1.0)
	find_path(LIBUSB_INC libusb.h HINTS PATH_SUFFIXES libusb-1.0)
	include(FindPackageHandleStandardArgs)
	find_package_handle_standard_args(usb "libusb not found; we will compile it using autotools" LIBUSB_LIB LIBUSB_INC)
    set(USB_FOUND ${USB_FOUND} PARENT_SCOPE)
endfunction()

if (NOT TARGET usb)
    findusb("libusb not found; we will try to compile an external version using autotools")
    if (NOT USB_FOUND)
        include(CMake/external_libusb.cmake)

	    findusb("libusb not found after building it from git... Something is wrong")
    endif()
    add_library(usb INTERFACE)
    target_include_directories(usb INTERFACE ${LIBUSB_INC})
    message(${LIBUSB_LIB})
    target_link_libraries(usb INTERFACE ${LIBUSB_LIB})
    install(TARGETS usb EXPORT realsense2Targets)
endif()
