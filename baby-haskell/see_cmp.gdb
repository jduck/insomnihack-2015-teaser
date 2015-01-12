rwatch *0x490BA8
commands
  ena 2
  cont
end

break *0x469a18
commands
  p/c *(char *)($rbp+8)
  p/c *(char *)($rbx+7)
  dis 2
end

break *0x469615
commands
  set $poo=$r12-0x18
  eval "rwatch *0x%llx", $poo
  dis 3
end

break main
commands
  dis 2
  dis 3
  cont
end

run
cont
quit

