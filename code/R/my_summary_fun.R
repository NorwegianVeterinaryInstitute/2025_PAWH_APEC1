#' Summarize a data frame, excluding specified columns and formatting the output.
#'
#' This function takes a data frame as input, removes specified columns,
#' converts all remaining columns to factors, generates a summary, and formats the result as a data frame.
#'
#' @param data A data frame to summarize.
#' @param remove_col Columns to exclude from the summary. Accepts tidyselect syntax.
#' @param maxsum Maximum number of unique values to include in the summary.
#'
#' @return A data frame containing the summary of the input data.
#'
#' @importFrom dplyr select mutate_all
#' @importFrom purrr coalesce
#' @importFrom rlang enquos !!!
#'
#' @examples
#' # Example usage:
#' # data <- data.frame(
#' #   Isolate.ID = 1:5,
#' #   AMR.genes = c("geneA", "geneB", "geneC", "geneD", "geneE"),
#' #   col1 = sample(c("A", "B", "C"), 5, replace = TRUE),
#' #   col2 = sample(1:10, 5, replace = TRUE)
#' # )
#' # result <- my_summary_fun(data, remove_col = c(Isolate.ID, AMR.genes), maxsum = 200)
#' # print(result)
#'
#' @export
my_summary_fun <- function(data, remove_col, maxsum = 200) {
    remove_col <- enquos(remove_col)
    
    data %>%
        dplyr::select( - (!!! remove_col)) %>%
        dplyr::mutate_all(factor) %>%
        summary(., maxsum = maxsum) %>%
        as.data.frame.matrix(row.names = NULL) %>%
        dplyr::mutate_all(~coalesce(., "")) %>%
        `rownames<-`(NULL)
}