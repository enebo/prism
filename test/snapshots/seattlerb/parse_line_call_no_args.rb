ProgramNode(0...23)(
  ScopeNode(0...0)([]),
  StatementsNode(0...23)(
    [CallNode(0...23)(
       nil,
       nil,
       IDENTIFIER(0...1)("f"),
       nil,
       nil,
       nil,
       BlockNode(2...23)(
         ScopeNode(2...4)([IDENTIFIER(6...7)("x"), IDENTIFIER(9...10)("y")]),
         BlockParametersNode(6...10)(
           ParametersNode(6...10)(
             [RequiredParameterNode(6...7)(), RequiredParameterNode(9...10)()],
             [],
             [],
             nil,
             [],
             nil,
             nil
           ),
           []
         ),
         StatementsNode(14...19)(
           [CallNode(14...19)(
              LocalVariableReadNode(14...15)(0),
              nil,
              PLUS(16...17)("+"),
              nil,
              ArgumentsNode(18...19)([LocalVariableReadNode(18...19)(0)]),
              nil,
              nil,
              "+"
            )]
         ),
         (2...4),
         (20...23)
       ),
       "f"
     )]
  )
)
