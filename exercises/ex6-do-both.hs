import FakeIt4
import Prelude ()

inner :: Action ()
inner = doBoth echoName echoAge

doBoth :: Action () -> Action () -> Action ()
doBoth action1 action2 io1 =
  let (io2, _) = action1 io1
  in action2 io2

main = run inner
