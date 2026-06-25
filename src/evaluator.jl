function evaluate(assignmentsAI::Vector{Int},assignmentsData::Vector{Int})
    length(assignmentsAI) == length(assignmentsData) || throw(ArgumentError("Vector lengths do not match"))
    minimum(assignmentsAI) != 1 && throw(ArgumentError("Invalid Numbering for Vector assignmentsAI"))
    minimum(assignmentsData) != 1 && throw(ArgumentError("Invalid Numbering for Vector assignmentsData"))
    kAI = maximum(assignmentsAI)
    kData = maximum(assignmentsData)
    score = -1

    if kAI < kData
        possibleReindexings = permutations(1:kData,kAI)
        for i in possibleReindexings
            score = max(score,sum(i[assignmentsAI] .== assignmentsData))
        end
    else
        possibleReindexings = permutations(1:kAI,kData)

        for i in possibleReindexings
            score = max(score,sum(i[assignmentsData] .== assignmentsAI))
        end
    end
    return score / length(assignmentsAI)

end