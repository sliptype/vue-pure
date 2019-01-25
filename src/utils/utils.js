export const mapObjectValues = (obj, f) =>
  Object
  .keys(obj)
  .reduce((result, current) => ({
    ...result,
    [current]: f(obj[current])
  }), {})

export const uncurry = f => (a, b) => f(a)(b)
