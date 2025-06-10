# Project:     PSI Schools Outreach Program -- developer capacity demonstration
# Author:      Cornelius Tanui (kiplimocornelius@gmail.com)
# Data source: N/A
# Database:    N/A
# File name:   funcs.R
# Purpose      User-defined functions 
# Date:        10 June 2025
# Version:     1

# convert pain scale to emojis
pain_to_emoji <- function(x) {
  cut(x,
      breaks = c(-Inf, 0.5, 3.5, 6.5, 9.5, Inf),
      labels = c("😀", "🙂", "😐", "😣", "😫"),
      right = FALSE
  )
}

# convert pain scale to colours
pain_to_colour <- function(x) {
  cut(x,
      breaks = c(-Inf, 0.5, 3.5, 6.5, 9.5, Inf),
      labels = c("#38c172", "#a3e635", "#facc15", "#f97316", "#ef4444"),
      right = FALSE
  )
}
