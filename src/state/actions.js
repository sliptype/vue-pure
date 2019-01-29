import { mapObjectValues } from '../utils/utils.js'
import Reducers from '../state/Reducers.purs'

export default mapObjectValues(Reducers, (_, key) => key);
