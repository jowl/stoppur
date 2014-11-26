# Stoppur

Stoppur means stopwatch in Swedish, and is an attempt of avoiding
using `Time` when measuring time in Ruby. The main problem with
measuring time using Ruby's `Time` is that it isn't monotonic, which
means that time can travel back and forth if the device's user decides
to change time, when toggling DST, or when adjusting for clock drift,
etc.

## Installation

There will be a gem soon, but until then you'll have to clone this
repo. Sorry about that.

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

```

## Supported platforms

This should work for everyone using Ruby >= 2.1.0 or JRuby, or for
those running on *nix (including OS X).
