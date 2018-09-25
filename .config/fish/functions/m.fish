function m -d "Maven quickener"
  for a in (string split '' $argv[1])
    switch $a
      case c
        set margs $margs clean
      case i
        set margs $margs install
      case s
        set margs $margs "-Psystem"
      case u
        set margs $margs "-U"
      case t
        set skiptests "-DskipTests"
      case d
        set margs $margs dependency:tree "-Dverbose"
    end
  end
  set margs $margs $skiptests

  switch (count $argv)
    case 0
      mvn
    case 1
      mvn -T 1C $margs
    case '*'
      mvn -T 1C $margs $argv[2..-1]
  end
end
