ProgramNode(
  Scope([]),
  StatementsNode(
    [ModuleNode(
       Scope([IDENTIFIER("a")]),
       KEYWORD_MODULE("module"),
       ConstantReadNode(),
       StatementsNode(
         [LocalVariableWriteNode(IDENTIFIER("a"), EQUAL("="), IntegerNode())]
       ),
       KEYWORD_END("end")
     ),
     InterpolatedStringNode(
       STRING_BEGIN("%Q{"),
       [StringNode(nil, STRING_CONTENT("aaa "), nil, "aaa "),
        StringInterpolatedNode(
          EMBEXPR_BEGIN("\#{"),
          StatementsNode(
            [CallNode(nil, nil, IDENTIFIER("bbb"), nil, nil, nil, nil, "bbb")]
          ),
          EMBEXPR_END("}")
        ),
        StringNode(nil, STRING_CONTENT(" ccc"), nil, " ccc")],
       STRING_END("}")
     ),
     ModuleNode(
       Scope([]),
       KEYWORD_MODULE("module"),
       ConstantPathNode(
         CallNode(nil, nil, IDENTIFIER("m"), nil, nil, nil, nil, "m"),
         COLON_COLON("::"),
         ConstantReadNode()
       ),
       StatementsNode([]),
       KEYWORD_END("end")
     ),
     ModuleNode(
       Scope([IDENTIFIER("x")]),
       KEYWORD_MODULE("module"),
       ConstantReadNode(),
       BeginNode(
         nil,
         StatementsNode(
           [LocalVariableWriteNode(IDENTIFIER("x"), EQUAL("="), IntegerNode())]
         ),
         RescueNode(
           KEYWORD_RESCUE("rescue"),
           [],
           nil,
           nil,
           StatementsNode([]),
           nil
         ),
         nil,
         nil,
         KEYWORD_END("end")
       ),
       KEYWORD_END("end")
     ),
     ModuleNode(
       Scope([]),
       KEYWORD_MODULE("module"),
       ConstantPathNode(nil, UCOLON_COLON("::"), ConstantReadNode()),
       StatementsNode([]),
       KEYWORD_END("end")
     )]
  )
)
