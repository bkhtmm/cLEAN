/-!
# Doubling and a sample argument

`double` doubles a natural number. The public simplification lemma lets clients
simplify at zero. `main` is the sample result of this project.
-/
namespace Mini

/-- Double a natural number. -/
def double (n : Nat) : Nat := n + n

@[simp] theorem double_zero : double 0 = 0 := rfl

theorem local_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) :=
  Nat.add_assoc a b c

/-- Adding two successive offsets to a doubled number associates. -/
theorem main (a b c : Nat) : (double a + b) + c = double a + (b + c) :=
  local_add_assoc (double a) b c

end Mini
