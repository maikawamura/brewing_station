#ifndef UTIL_NATIVE_DEFINES_H
#define UTIL_NATIVE_DEFINES_H

#ifndef INLINE
  #ifdef _WINDOWS
    #define INLINE __forceinline
  #elif _ANDROID
    #define INLINE inline
  #endif
#endif

#ifndef EXPORT
  #ifdef _WINDOWS
    #define EXPORT extern "C" __declspec(dllexport)
  #elif _ANDROID
    #define EXPORT 
  #endif
#endif

#endif // !UTIL_NATIVE_DEFINES_H
