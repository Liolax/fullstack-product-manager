// Simple validation test for HTML client
function validateProduct(name, price) {
  if (!name || isNaN(price)) return false;
  return true;
}

test('validateProduct returns false for missing name', () => {
  expect(validateProduct('', 10)).toBe(false);
});

test('validateProduct returns false for invalid price', () => {
  expect(validateProduct('Test', NaN)).toBe(false);
});

test('validateProduct returns true for valid input', () => {
  expect(validateProduct('Test', 10)).toBe(true);
});
