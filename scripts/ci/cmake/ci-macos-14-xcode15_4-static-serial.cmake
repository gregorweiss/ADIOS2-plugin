# Client maintainer: vicente.bolea@kitware.com
set(ENV{CC}  clang)
set(ENV{CXX} clang++)
set(ENV{FC}  gfortran-11)

set(dashboard_cache "
BUILD_SHARED_LIBS=OFF
CMAKE_BUILD_TYPE:STRING=Release
BUILD_TESTING:BOOL=ON
ADIOS2_BUILD_EXAMPLES:BOOL=OFF

ADIOS2_USE_AWSSDK:STRING=OFF
ADIOS2_USE_Blosc2:STRING=OFF
ADIOS2_USE_Blosc2:BOOL=OFF
ADIOS2_USE_BZip2:BOOL=OFF
ADIOS2_USE_Catalyst:STRING=OFF
ADIOS2_USE_CUDA:STRING=OFF
ADIOS2_USE_DAOS:STRING=OFF
ADIOS2_USE_DataMan:BOOL=OFF
ADIOS2_USE_DataSpaces:STRING=OFF
ADIOS2_USE_Fortran:BOOL=OFF
ADIOS2_USE_HDF5:BOOL=OFF
ADIOS2_USE_HDF5_VOL:STRING=OFF
ADIOS2_USE_IME:STRING=OFF
ADIOS2_USE_Kokkos:STRING=OFF
ADIOS2_USE_LIBPRESSIO:STRING=OFF
ADIOS2_USE_MGARD:STRING=OFF
ADIOS2_USE_MHS:STRING=OFF
ADIOS2_USE_MPI:BOOL=OFF
ADIOS2_USE_PNG:BOOL=OFF
ADIOS2_USE_Python:BOOL=OFF
ADIOS2_USE_SSC:BOOL=OFF
ADIOS2_USE_SST:BOOL=OFF
ADIOS2_USE_SZ:BOOL=OFF
ADIOS2_USE_ZeroMQ:STRING=OFF
ADIOS2_USE_ZFP:BOOL=OFF

CMAKE_C_COMPILER_LAUNCHER=ccache
CMAKE_CXX_COMPILER_LAUNCHER=ccache
CMAKE_C_FLAGS:STRING=-Wall
CMAKE_CXX_FLAGS:STRING=-Wall
CMAKE_Fortran_FLAGS:STRING=-Wall
")

set(ENV{MACOSX_DEPLOYMENT_TARGET} "14.5")
set(CTEST_CMAKE_GENERATOR "Ninja")
list(APPEND CTEST_UPDATE_NOTES_FILES "${CMAKE_CURRENT_LIST_FILE}")
set(CTEST_TEST_ARGS
  # Unclear why these tests currently die.  Disabling until it can be addressed.
  EXCLUDE "Install.Make.*"
)
include(${CMAKE_CURRENT_LIST_DIR}/ci-common.cmake)
