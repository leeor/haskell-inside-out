import FakeIt3
import Prelude ()

echoName :: Action ()
echoName = promptString "What's your name?" `andThen` print

echoAge :: Action ()
echoAge = promptInt "What's your age?" `andThen` printInt

printInt :: Int -> Action ()
printInt i = print (showInt i)

andThen :: Action a -> (a -> Action b) -> Action b
andThen getVal useVal io1 =
  let (io2, val) = getVal io1
  in useVal val io2

inner :: Action ()
inner = doBoth echoName echoAge

doBoth :: Action a -> Action b -> Action b
doBoth action1 action2 io1 =
  let (io2, _a) = action1 io1
      (io3, b) = action2 io2
  in (io3, b)

main = run inner
