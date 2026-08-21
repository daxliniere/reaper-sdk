#include "../reaper_plugin.h"
#define REAPERAPI_IMPLEMENT
#include "dax_api.h"

int DaxLoadAPI(void *(*getFunc)(const char *))
{
  return REAPERAPI_LoadAPI(getFunc);
}

