ProgramNode(0...14)(
  ScopeNode(0...0)([]),
  StatementsNode(0...14)(
    [CallNode(0...14)(
       nil,
       nil,
       IDENTIFIER(0...1)("f"),
       nil,
       nil,
       nil,
       BlockNode(2...14)(
         ScopeNode(2...3)([IDENTIFIER(5...6)("a")]),
         BlockParametersNode(5...11)(
           ParametersNode(5...11)(
             [RequiredParameterNode(5...6)(),
              RequiredDestructuredParameterNode(8...11)(
                [SplatNode(9...10)(USTAR(9...10)("*"), nil)],
                PARENTHESIS_LEFT(8...9)("("),
                PARENTHESIS_RIGHT(10...11)(")")
              )],
             [],
             [],
             nil,
             [],
             nil,
             nil
           ),
           []
         ),
         nil,
         (2...3),
         (13...14)
       ),
       "f"
     )]
  )
)
