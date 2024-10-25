/**
 * @description Find all functions that are longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10.ql
 * @problem.severity recommendation
 */
import javascript

predicate isLongerThan10Lines(Function f) {
    f.getNumLines() > 10
}

from Function f
where isLongerThan10Lines(f)
select f, "Function is longer than 10 lines."