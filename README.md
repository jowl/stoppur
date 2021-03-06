# Stoppur

[![Build Status](https://travis-ci.org/jowl/stoppur.svg?branch=master)](https://travis-ci.org/jowl/stoppur)

Stoppur means stopwatch in Swedish, and is an attempt of avoiding
using `Time` when measuring time in Ruby. The main problem with
measuring time using Ruby's `Time` is that it is based on the system
clock and thus isn't monotonic, which means that time can travel back
and forth if the system's user decides to change the time, when
toggling DST, or when adjusting for clock drift, etc.

Instead of `Time`, Stoppur uses one of the following mechanisms,
depending on your system:

- Ruby's `Process.clock_gettime`, if it is defined (Ruby 2.1+)
- Java's `System.nanoTime()`, if using JRuby
- `clock_get_time()` through a C extension, if available (OS X)
- `clock_gettime()` through a C extension, if available (Linux)

## Installation

```
$ gem install stoppur
```

## Usage

```ruby
require 'stoppur'

# measure simple block
elapsed = Stoppur.measure do
  # perform work here
end

# when you need more control
stopwatch = Stoppur.start
begin
  # might raise error
rescue => e
  puts 'raised error after %.4f s' % stopwatch.elapsed
end

# or when you want to measure more than one thing using the same stopwatch
stopwatch = Stoppur.start
# do some work
puts 'did some work in %.4f s' % stopwatch.elapsed
# do the rest of the work
puts 'did all of the work in %.4f s' % stopwatch.elapsed
```

## Supported platforms

This should work for everyone using Ruby 2.1+ or JRuby, or for
those running on *nix (including OS X).
