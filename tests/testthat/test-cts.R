context("cts")

test_that("cts_compinfo()", {
  expect_error(cts_compinfo(c('xxxxx', 'aaaaaaa')))
  expect_equal(cts_compinfo('xxxxx', verbose = FALSE), NA)
  expect_equal(length(cts_compinfo("XEFQLINVKFYRCS-UHFFFAOYSA-N", verbose = FALSE)), 7)
  expect_equal(round(cts_compinfo("XEFQLINVKFYRCS-UHFFFAOYSA-N", verbose = FALSE)[[3]], 4), 289.5418)
})


test_that("cts_convert()", {
  expect_error(cts_convert(c('xxxxx', 'aaaaaaa'), 'Chemical Name', 'CAS'))
  expect_error(cts_convert('Triclosan', c('Chemical Name', 'CAS'), 'CAS'))
  expect_error(cts_convert('Triclosan', 'CAS'))
  expect_equal(cts_convert('Triclosan', 'Chemical Name', 'CAS', verbose = FALSE)[1], '105093-20-7')
  expect_equal(cts_convert('Triclosan', 'Chemical Name', 'CAS', first = TRUE, verbose = FALSE), '105093-20-7')
  expect_equal(cts_convert('xxxxxx', 'Chemical Name', 'CAS', verbose = FALSE), NA)
})

test_that("cts_compinfo(cir_query())", {
  expect_equal(round(cts_compinfo(
    gsub('InChIKey=', '', cir_query('Triclosan', representation = 'stdinchikey', verbose = FALSE)),
    verbose = FALSE)[[3]], 4), 289.5418)

})