#!/usr/bin/env ruby

def transform(ch)
  out = `gdb -q -x haskell.gdb -x see_cmp.gdb --args ./baby_haskell_f87b6ffca5f977d2ac493ecb12636cba '#{ch}' | grep '$1'`
  res = out.split('\'')[1]
  res
end

seq = []
seq += ('a'..'z').to_a
seq += ('A'..'Z').to_a
seq += ('['..'`').to_a
seq.delete '\\'
seq += ('{'..'~').to_a

# these have no transform...
#seq += ('0'..'9').to_a
#seq += (' '..'/').to_a
#seq.delete '\''
#seq += (':'..'@').to_a


tr_in = ''
tr_out = ''

seq.each { |ch|
  res = transform(ch)
  next if res == ch

  puts "noting transform #{ch} => #{res}"
  tr_in << ch
  tr_out << res
}

puts "tr '#{tr_in}' '#{tr_out}'"

