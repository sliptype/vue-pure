/**
 * Applies a function to all values in an object
 * @param { Object } obj The source object
 * @param { Function } f The transformation function
 */
export const mapObjectValues = (obj, f) =>
  Object
  .keys(obj)
  .reduce((result, current) => ({
    ...result,
    [current]: f(obj[current], current)
  }), {})

