# data(accel)
# accel
# library(ggplot2)
# library(tidyr)
# accel |> head(1000) |> pivot_longer(-time)
# accel |> head(1000) |> pivot_longer(-time, values_to = "Acceleration",
#                                     names_to = "Channel")
# accel |>
#   head(1000) |>
#   pivot_longer(-time, values_to = "Acceleration",
#                                     names_to = "Channel") |>
#   ggplot(aes(x = time, y = Acceleration)) +
#   geom_line() + facet_grid(Channel ~ .)

# put this utility into a function
# more details are needed for distribution documentation
# one tip for making the visualization function is that we could use minimal
# formatting so that the users can use however they want later

#' Plot 3DF Accelerometry Data
#'
#' @param x a tibble with columns time, X, Y, Z.
#' @param x_var the x-axis variable.
#' @returns A ggplot object, faceted by channel, showing the acceleration
#' or energy (in the Fourier domain) of the data.
#' @importFrom ggplot2 ggplot aes geom_line facet_grid
#' @importFrom tidyr pivot_longer
#' @export
plot_accel = function(x, x_var = "time"){
  x |>
    pivot_longer(-!!x_var, values_to = "Acceleration", names_to = "Channel") |>
    # ggplot(aes_string(x = x_var, y = "Acceleration")) + # reference cols w/ str.
    ggplot(aes(x = !!as.symbol(x_var), y = "Acceleration")) +
      geom_line() +
      facet_grid(Channel ~ .)
}

# update documentation
# document()

# test
# plot_accel(accel |> head(1000))

# allow outside formatting (the returned result is a "ggplot" object)
# plot_accel(accel |> head(1000)) + theme_bw()
# plot_accel(accel |> head(1000)) + theme_minimal() # not that clear

# usually Accelerometry Data is not treated in the form as in the "accel" data
# Fourier Transform (another representation of the Accelerometry Data, gives
# weights to different frequencies): spectral signature--the amount of energy
# being spent at different frequencies.

# see more in "spectral.R" in the next LectureCodes folder
