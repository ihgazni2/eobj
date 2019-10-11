

from eobj.eobj import jobj2orb
from eobj.eobj import wfstree,sdfstree,edfstree,wfs_brackets,sdfs_brackets,edfs_brackets


#先写说明

# dot-chain-view  
# big-json-like-struct


import esprima
jobj = esprima.parse("function tst() {a = b}").toDict()

{
    type: "Program",
    sourceType: "script",
    body: [
        {
            type: "FunctionDeclaration",
            expression: False,
            isAsync: False,
            id: {
                type: "Identifier",
                name: "tst"
            },
            params: [],
            body: {
                type: "BlockStatement",
                body: [
                    {
                        type: "ExpressionStatement",
                        expression: {
                            type: "AssignmentExpression",
                            operator: "=",
                            left: {
                                type: "Identifier",
                                name: "a"
                            },
                            right: {
                                type: "Identifier",
                                name: "b"
                            }
                        }
                    }
                ]
            },
            generator: False
        }
    ]
}




o = jobj2orb(jobj)


        >>> o.
        o.            o.body        o.sourceType  o.type
        
        >>> o.body.
        o.body.     o.body.l0_
        
        
        >>> o.body.l0_.
        o.body.l0_.            o.body.l0_.body        o.body.l0_.generator   o.body.l0_.params
        o.body.l0_.async       o.body.l0_.expression  o.body.l0_.id          o.body.l0_.type
        
        >>> o.body.l0_.body.
        o.body.l0_.body.      o.body.l0_.body.body  o.body.l0_.body.type
        
        >>> o.body.l0_.body.type
        'BlockStatement'
        >>>

        from xdict.jprint import pobj
        >>> pobj(o.body.l0_.body.body.l0_.expression)
        
        >>> o.body.l0_.body.body.l0_.expression
        {'type': 'AssignmentExpression', 'operator': '=', 'left': {'type': 'Identifier', 'name': 'a'}, 'right': {'type': 'Identifier', 'name': 'b'}}
        >>>
        
        
        {
         'type': 'AssignmentExpression',
         'operator': '=',
         'left':
                 {
                  'type': 'Identifier',
                  'name': 'a'
                 },
         'right':
                  {
                   'type': 'Identifier',
                   'name': 'b'
                  }
        }
        >>>



# wfstree(o,start_depth,end_depth)
wfstree(o)
wfstree(o,2,4)

        >>> wfstree(o)
        
        type
        sourceType
        body
        body.l0_
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id
        body.l0_.params
        body.l0_.body
        body.l0_.generator
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.body.type
        body.l0_.body.body
        body.l0_.body.body.l0_
        body.l0_.body.body.l0_.type
        body.l0_.body.body.l0_.expression
        body.l0_.body.body.l0_.expression.type
        body.l0_.body.body.l0_.expression.operator
        body.l0_.body.body.l0_.expression.left
        body.l0_.body.body.l0_.expression.right
        body.l0_.body.body.l0_.expression.left.type
        body.l0_.body.body.l0_.expression.left.name
        body.l0_.body.body.l0_.expression.right.type
        body.l0_.body.body.l0_.expression.right.name
        >>> wfstree(o,2,4)
        body.l0_
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id
        body.l0_.params
        body.l0_.body
        body.l0_.generator
        >>>



#sdfstree(o,start_depth,end_depth)
sdfstree(o)
sdfstree(o,3,5)

        >>> sdfstree(o)
        
        type
        sourceType
        body
        body.l0_
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.params
        body.l0_.body
        body.l0_.body.type
        body.l0_.body.body
        body.l0_.body.body.l0_
        body.l0_.body.body.l0_.type
        body.l0_.body.body.l0_.expression
        body.l0_.body.body.l0_.expression.type
        body.l0_.body.body.l0_.expression.operator
        body.l0_.body.body.l0_.expression.left
        body.l0_.body.body.l0_.expression.left.type
        body.l0_.body.body.l0_.expression.left.name
        body.l0_.body.body.l0_.expression.right
        body.l0_.body.body.l0_.expression.right.type
        body.l0_.body.body.l0_.expression.right.name
        body.l0_.generator
        >>> sdfstree(o,3,5)
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.params
        body.l0_.body
        body.l0_.body.type
        body.l0_.body.body
        body.l0_.generator
        >>>




edfstree(o,start_depth,end_depth)
edfstree(o)
edfstree(o,3,5)

        >>> edfstree(o)
        type
        sourceType
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.id
        body.l0_.params
        body.l0_.body.type
        body.l0_.body.body.l0_.type
        body.l0_.body.body.l0_.expression.type
        body.l0_.body.body.l0_.expression.operator
        body.l0_.body.body.l0_.expression.left.type
        body.l0_.body.body.l0_.expression.left.name
        body.l0_.body.body.l0_.expression.left
        body.l0_.body.body.l0_.expression.right.type
        body.l0_.body.body.l0_.expression.right.name
        body.l0_.body.body.l0_.expression.right
        body.l0_.body.body.l0_.expression
        body.l0_.body.body.l0_
        body.l0_.body.body
        body.l0_.body
        body.l0_.generator
        body.l0_
        body
        
        >>> edfstree(o,3,5)
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.id
        body.l0_.params
        body.l0_.body.type
        body.l0_.body.body
        body.l0_.body
        body.l0_.generator
        >>>



wfs_brackets(o,start_depth,end_depth)
wfs_brackets(o)
wfs_brackets(o,2,4)


        >>> wfs_brackets(o)
        
        ['type']
        ['sourceType']
        ['body']
        ['body'][0]
        ['body'][0]['type']
        ['body'][0]['expression']
        ['body'][0]['async']
        ['body'][0]['id']
        ['body'][0]['params']
        ['body'][0]['body']
        ['body'][0]['generator']
        ['body'][0]['id']['type']
        ['body'][0]['id']['name']
        ['body'][0]['body']['type']
        ['body'][0]['body']['body']
        ['body'][0]['body']['body'][0]
        ['body'][0]['body']['body'][0]['type']
        ['body'][0]['body']['body'][0]['expression']
        ['body'][0]['body']['body'][0]['expression']['type']
        ['body'][0]['body']['body'][0]['expression']['operator']
        ['body'][0]['body']['body'][0]['expression']['left']
        ['body'][0]['body']['body'][0]['expression']['right']
        ['body'][0]['body']['body'][0]['expression']['left']['type']
        ['body'][0]['body']['body'][0]['expression']['left']['name']
        ['body'][0]['body']['body'][0]['expression']['right']['type']
        ['body'][0]['body']['body'][0]['expression']['right']['name']
        >>> wfs_brackets(o,2,4)
        ['body'][0]
        ['body'][0]['type']
        ['body'][0]['expression']
        ['body'][0]['async']
        ['body'][0]['id']
        ['body'][0]['params']
        ['body'][0]['body']
        ['body'][0]['generator']
        >>>




sdfs_brackets(o,start_depth,end_depth)
sdfs_brackets(o)
sdfs_brackets(o,3,5)

        >>> sdfs_brackets(o)
        
        ['type']
        ['sourceType']
        ['body']
        ['body'][0]
        ['body'][0]['type']
        ['body'][0]['expression']
        ['body'][0]['async']
        ['body'][0]['id']
        ['body'][0]['id']['type']
        ['body'][0]['id']['name']
        ['body'][0]['params']
        ['body'][0]['body']
        ['body'][0]['body']['type']
        ['body'][0]['body']['body']
        ['body'][0]['body']['body'][0]
        ['body'][0]['body']['body'][0]['type']
        ['body'][0]['body']['body'][0]['expression']
        ['body'][0]['body']['body'][0]['expression']['type']
        ['body'][0]['body']['body'][0]['expression']['operator']
        ['body'][0]['body']['body'][0]['expression']['left']
        ['body'][0]['body']['body'][0]['expression']['left']['type']
        ['body'][0]['body']['body'][0]['expression']['left']['name']
        ['body'][0]['body']['body'][0]['expression']['right']
        ['body'][0]['body']['body'][0]['expression']['right']['type']
        ['body'][0]['body']['body'][0]['expression']['right']['name']
        ['body'][0]['generator']
        >>> sdfs_brackets(o,3,5)
        ['body'][0]['type']
        ['body'][0]['expression']
        ['body'][0]['async']
        ['body'][0]['id']
        ['body'][0]['id']['type']
        ['body'][0]['id']['name']
        ['body'][0]['params']
        ['body'][0]['body']
        ['body'][0]['body']['type']
        ['body'][0]['body']['body']
        ['body'][0]['generator']
        >>>


edfs_brackets(o,start_depth,end_depth)
edfs_brackets(o)
edfs_brackets(o,3,5)

        >>> edfs_brackets(o)
        type
        sourceType
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.id
        body.l0_.params
        body.l0_.body.type
        body.l0_.body.body.l0_.type
        body.l0_.body.body.l0_.expression.type
        body.l0_.body.body.l0_.expression.operator
        body.l0_.body.body.l0_.expression.left.type
        body.l0_.body.body.l0_.expression.left.name
        body.l0_.body.body.l0_.expression.left
        body.l0_.body.body.l0_.expression.right.type
        body.l0_.body.body.l0_.expression.right.name
        body.l0_.body.body.l0_.expression.right
        body.l0_.body.body.l0_.expression
        body.l0_.body.body.l0_
        body.l0_.body.body
        body.l0_.body
        body.l0_.generator
        body.l0_
        body
        
        >>> edfs_brackets(o,3,5)
        body.l0_.type
        body.l0_.expression
        body.l0_.async
        body.l0_.id.type
        body.l0_.id.name
        body.l0_.id
        body.l0_.params
        body.l0_.body.type
        body.l0_.body.body
        body.l0_.body
        body.l0_.generator
        >>>



####
import ast
import astunparse

t = ast.parse("[1,2,3]")


