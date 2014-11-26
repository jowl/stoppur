#include "c_clock.h"

#ifdef __MACH__
#include <mach/clock.h>
#include <mach/mach.h>
#else
#include <time.h>
#endif

VALUE Stoppur = Qnil;
VALUE Time = Qnil;
VALUE CClock = Qnil;

void Init_c_clock() {
  Stoppur = rb_define_module("Stoppur");
  Time = rb_define_module_under(Stoppur, "Time");
  CClock = rb_define_class_under(Time, "CClock", rb_cObject);
  rb_define_method(CClock, "time", method_time, 0);
}

VALUE method_time(VALUE self) {
#ifdef __MACH__
  mach_timespec_t ts;
  clock_serv_t cclock;
  host_get_clock_service(mach_host_self(), CALENDAR_CLOCK, &cclock);
  clock_get_time(cclock, &ts);
  mach_port_deallocate(mach_task_self(), cclock);
#else
  struct timespec ts;
  clock_gettime(CLOCK_REALTIME, &ts);
#endif
  return DBL2NUM(ts.tv_sec + ts.tv_nsec / 1e9);
}
