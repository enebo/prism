ProgramNode(0...148)(
  [],
  StatementsNode(0...148)(
    [CallNode(0...10)(
       nil,
       nil,
       IDENTIFIER(0...3)("foo"),
       nil,
       nil,
       nil,
       BlockNode(4...10)([], nil, nil, (4...6), (7...10)),
       "foo"
     ),
     CallNode(12...29)(
       nil,
       nil,
       IDENTIFIER(12...15)("foo"),
       nil,
       nil,
       nil,
       BlockNode(16...29)(
         [],
         nil,
         BeginNode(0...29)(
           nil,
           nil,
           RescueNode(19...25)(
             KEYWORD_RESCUE(19...25)("rescue"),
             [],
             nil,
             nil,
             nil,
             nil
           ),
           nil,
           nil,
           (26...29)
         ),
         (16...18),
         (26...29)
       ),
       "foo"
     ),
     CallNode(31...64)(
       nil,
       nil,
       IDENTIFIER(31...34)("foo"),
       nil,
       nil,
       nil,
       BlockNode(35...64)(
         [],
         nil,
         StatementsNode(40...60)(
           [RescueModifierNode(40...54)(
              NilNode(40...43)(),
              (44...50),
              NilNode(51...54)()
            ),
            NilNode(57...60)()]
         ),
         (35...37),
         (61...64)
       ),
       "foo"
     ),
     CallNode(66...80)(
       nil,
       nil,
       IDENTIFIER(66...69)("foo"),
       nil,
       nil,
       nil,
       BlockNode(70...80)(
         [IDENTIFIER(74...75)("a")],
         BlockParametersNode(73...76)(
           ParametersNode(74...75)(
             [RequiredParameterNode(74...75)()],
             [],
             [],
             nil,
             [],
             nil,
             nil
           ),
           [],
           (73...74),
           (75...76)
         ),
         nil,
         (70...72),
         (77...80)
       ),
       "foo"
     ),
     CallNode(82...116)(
       nil,
       nil,
       IDENTIFIER(82...85)("foo"),
       PARENTHESIS_LEFT(85...86)("("),
       ArgumentsNode(86...109)(
         [InterpolatedStringNode(86...109)(
            (86...92),
            [StringNode(101...105)(
               nil,
               STRING_CONTENT(101...105)("  b\n"),
               nil,
               "  b\n"
             )],
            (105...109)
          )]
       ),
       PARENTHESIS_RIGHT(92...93)(")"),
       BlockNode(94...116)(
         [IDENTIFIER(98...99)("a")],
         BlockParametersNode(97...100)(
           ParametersNode(98...99)(
             [RequiredParameterNode(98...99)()],
             [],
             [],
             nil,
             [],
             nil,
             nil
           ),
           [],
           (97...98),
           (99...100)
         ),
         StatementsNode(111...112)([LocalVariableReadNode(111...112)(0)]),
         (94...96),
         (113...116)
       ),
       "foo"
     ),
     CallNode(118...148)(
       nil,
       nil,
       IDENTIFIER(118...121)("foo"),
       PARENTHESIS_LEFT(121...122)("("),
       ArgumentsNode(122...141)(
         [InterpolatedStringNode(122...141)(
            (122...128),
            [StringNode(133...137)(
               nil,
               STRING_CONTENT(133...137)("  b\n"),
               nil,
               "  b\n"
             )],
            (137...141)
          )]
       ),
       PARENTHESIS_RIGHT(128...129)(")"),
       BlockNode(130...148)(
         [],
         nil,
         StatementsNode(143...144)(
           [CallNode(143...144)(
              nil,
              nil,
              IDENTIFIER(143...144)("a"),
              nil,
              nil,
              nil,
              nil,
              "a"
            )]
         ),
         (130...132),
         (145...148)
       ),
       "foo"
     )]
  )
)
