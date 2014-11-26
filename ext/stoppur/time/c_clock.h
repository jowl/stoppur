#include <ruby.h>

VALUE Stoppur;
VALUE Time;
VALUE CClock;

void Init_stoppur();
VALUE method_time(VALUE self);
