import Mini.Proof

/-! # A consumer of the doubling API -/
namespace Mini.Example

example : Mini.double 0 = 0 := by simp

example (a b c : Nat) : (Mini.double a + b) + c = Mini.double a + (b + c) :=
  Mini.main a b c

end Mini.Example
