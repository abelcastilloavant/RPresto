# Copyright (c) 2015-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

#' S3 implementation of \code{\link[dplyr]{db_desc}} for Presto.
#'
#' @rdname dplyr_function_implementations
#' @keywords internal
#' @export
db_desc.PrestoConnection <- function(x) {
  info <- dbGetInfo(x)
  return(.description_from_info(info))
}

.description_from_info <- function(info) {
  return(paste0(
    'presto ',
    ' [',
    info[['schema']],
    ':',
    info[['catalog']],
    ' | ',
    info[['user']],
    '@',
    info[['host']],
    ':',
    info[['port']],
    ']'
  ))
}
