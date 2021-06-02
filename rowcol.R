patientsurvey <- data.frame("q1" = c(0, 0, 1, 0, 1),
                            "q2" = c(0, 1, 0, 0, 1),
                            "q3" = c(0, 1, 0, 1, 1),
                            "q4" = c(1, 1, 1, 1, 1),
                            "q5" = c(1, 0, 1, 0, 1))

rowMeans(patientsurvey)
rowSums(patientsurvey)
colMeans(patientsurvey)
colSums(patientsurvey)
