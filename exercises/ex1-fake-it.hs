import FakeIt1
import Prelude ()

main = run inner

inner :: IOState -> IOState
inner io1 =
  let io2 = print "What's your name?" io1
      -- the getString function returns a tuple (x, y)
      -- this is pattern matching to extract the two values in the tuple
      tup = getString io2
      -- (IOState, String)
      (io3, name) = tup
      io4 = print name io3
  in io4
