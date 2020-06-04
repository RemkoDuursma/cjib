

# 1.
max(c(NA,NA,NA), na.rm = TRUE)


# 2.
floor(12.1)
ceiling(12.1)


# round_up_down



# 3.
# Function scope
melding <- "Hoofdstraat 12, 5524 AJ, Geeneveen"
pc <- str_extract(melding, "[0-9]{4}[[:space:]]+[a-zA-Z]{2}")
pc_ns <- str_replace(pc, "[[:space:]]", "")
out <- str_replace(melding, pc, pc_ns)
out[is.na(out)] <- melding[is.na(out)]
out

