ProgramNode(
  Scope([IDENTIFIER("i"), IDENTIFIER("j"), IDENTIFIER("k")]),
  StatementsNode(
    [ForNode(
       LocalVariableWriteNode(IDENTIFIER("i"), nil, nil),
       RangeNode(IntegerNode(), IntegerNode(), (10..12)),
       StatementsNode([LocalVariableReadNode(IDENTIFIER("i"))]),
       (0..3),
       (6..8),
       nil,
       (17..20)
     ),
     ForNode(
       LocalVariableWriteNode(IDENTIFIER("i"), nil, nil),
       RangeNode(IntegerNode(), IntegerNode(), (32..34)),
       StatementsNode([LocalVariableReadNode(IDENTIFIER("i"))]),
       (22..25),
       (28..30),
       nil,
       (41..44)
     ),
     ForNode(
       MultiWriteNode(
         [LocalVariableWriteNode(IDENTIFIER("i"), nil, nil),
          LocalVariableWriteNode(IDENTIFIER("j"), nil, nil)],
         nil,
         nil,
         nil,
         nil
       ),
       RangeNode(IntegerNode(), IntegerNode(), (58..60)),
       StatementsNode([LocalVariableReadNode(IDENTIFIER("i"))]),
       (46..49),
       (54..56),
       nil,
       (65..68)
     ),
     ForNode(
       MultiWriteNode(
         [LocalVariableWriteNode(IDENTIFIER("i"), nil, nil),
          LocalVariableWriteNode(IDENTIFIER("j"), nil, nil),
          LocalVariableWriteNode(IDENTIFIER("k"), nil, nil)],
         nil,
         nil,
         nil,
         nil
       ),
       RangeNode(IntegerNode(), IntegerNode(), (84..86)),
       StatementsNode([LocalVariableReadNode(IDENTIFIER("i"))]),
       (70..73),
       (80..82),
       nil,
       (91..94)
     ),
     ForNode(
       LocalVariableWriteNode(IDENTIFIER("i"), nil, nil),
       RangeNode(IntegerNode(), IntegerNode(), (106..108)),
       StatementsNode([LocalVariableReadNode(IDENTIFIER("i"))]),
       (96..99),
       (102..104),
       (111..113),
       (116..119)
     ),
     ForNode(
       LocalVariableWriteNode(IDENTIFIER("i"), nil, nil),
       RangeNode(IntegerNode(), IntegerNode(), (131..133)),
       StatementsNode([LocalVariableReadNode(IDENTIFIER("i"))]),
       (121..124),
       (127..129),
       nil,
       (140..143)
     )]
  )
)
