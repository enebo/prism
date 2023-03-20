# Testing

This document explains how to test YARP, both locally, and against existing test suites.

## Test suite

`rake test` will run all of the files in the `test/` directory. This can be conceived of as two parts: individual test files, and parser regression tests.

### Test files

These test specific YARP implementation details, like comments, errors, and regular expressions. There are corresponding files for each thing being tested (like `test/errors_test.rb`).

### Regression tests

Regression tests ensure that parsed output is equivalent to previous parsed output. There are many categorized examples of valid syntax within the `test/fixtures/` directory. When the test suite runs, it will parse all of this syntax, and compare it against corresponding files in the `test/snapshots/` directory. For example, `test/fixtures/strings.rb` has a corresponding `test/snapshots/strings.rb`.

If the parsed files do not match, it will raise an error. If there is not a corresponding file in the `test/snapshots/` directory, one will be created so that it exists for the next test run.


### Testing against open source repos

[TODO when improved `rake lex` merges]

## Local testing

As you are working, you will likely want to test your code locally. `test.rb` is ignored by git, so it can be used for local testing. There are also two executables which may help you:

1. **bin/lex** takes a filepath and compares YARP's lexed output to Ripper's lexed output. It will highlight any lexed output that doesn't match. It does some minor transformations to the lexed output in order to compare them, like split YARP's heredoc tokens to mirror Ripper's.

```
$ bin/lex test.rb
```

2. **bin/parse** takes a filepath and outputs YARP's parsed node structure generated from reading the file.

```
$ bin/parse test.rb
```
