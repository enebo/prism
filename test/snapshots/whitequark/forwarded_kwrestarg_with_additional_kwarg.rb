ProgramNode(0...41)(
  ScopeNode(0...0)([]),
  StatementsNode(0...41)(
    [DefNode(0...41)(
       IDENTIFIER(4...7)("foo"),
       nil,
       ParametersNode(8...10)(
         [],
         [],
         [],
         nil,
         [],
         KeywordRestParameterNode(8...10)(USTAR_STAR(8...10)("**"), nil),
         nil
       ),
       StatementsNode(13...36)(
         [CallNode(13...36)(
            nil,
            nil,
            IDENTIFIER(13...16)("bar"),
            PARENTHESIS_LEFT(16...17)("("),
            ArgumentsNode(17...35)(
              [HashNode(17...35)(
                 nil,
                 [AssocSplatNode(17...19)(nil, (17...19)),
                  AssocNode(21...35)(
                    SymbolNode(21...30)(
                      nil,
                      LABEL(21...29)("from_foo"),
                      LABEL_END(29...30)(":"),
                      "from_foo"
                    ),
                    TrueNode(31...35)(),
                    nil
                  )],
                 nil
               )]
            ),
            PARENTHESIS_RIGHT(35...36)(")"),
            nil,
            "bar"
          )]
       ),
       ScopeNode(0...3)([USTAR_STAR(8...10)("**")]),
       (0...3),
       nil,
       (7...8),
       (10...11),
       nil,
       (38...41)
     )]
  )
)
