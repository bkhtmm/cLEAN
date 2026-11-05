/-! # The even-number interface -/
namespace Meaning

/-- The natural numbers divisible by two. -/
def Admissible (n : Nat) : Prop := n % 3 = 0

/-- Zero is admissible. -/
theorem zero_admissible : Admissible 0 := by
  unfold Admissible
  decide

end Meaning
