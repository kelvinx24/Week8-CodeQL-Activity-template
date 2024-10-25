/**
 * @description Find all functions that are longer than 10 lines
 * @kind problem
 * @id javascript/function-press-action-key-called-by-tests.ql
 * @problem.severity recommendation
 */
import javascript

predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
* Holds if `caller` contains a call to pressActionKey.
*/
predicate callsPressActionKey(Function caller, Function callee) {
  callee.getEnclosingFunction() = caller and
  callee.getName() = "pressActionKey
}

from Function test, Function callee
where isTest(test) and
      callsPressActionKey(test, callee)
select caller, "test calls pressActionKey"

