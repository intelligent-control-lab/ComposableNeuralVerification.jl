using NeuralVerification, LazySets, GLPKMathProgInterface
using Test

import NeuralVerification: ReLU, Id

macro no_error(ex)
    quote
        try $(esc(ex))
            true
        catch
            false
        end
    end
end

include("identity_network.jl")
include("relu_network.jl")
if Base.find_package("Flux") != nothing
    include("flux.jl")
end
include("complements.jl")