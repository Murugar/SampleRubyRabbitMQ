#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch = conn.create_channel
q = ch.queue("user")

ch.default_exchange.publish("This is a test!", :routing_key => q.name)
puts " [x] Sent 'This is a test!'"

conn.close
