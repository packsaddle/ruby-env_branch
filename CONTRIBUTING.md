# NOTE

DO NOT ADD encrypted value to environment variable on this repository!
`test/test_test_helper.rb` asserts `ENV`.
And this will show `ENV` accidentally in CI log.
