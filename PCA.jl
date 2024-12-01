using DataFrames
using Statistics
using LinearAlgebra


export get_transform_matr


function get_covar(df::DataFrame)
    dropmissing!(df)
    cov_matr = cov(Matrix(df))
    return cov_matr
end

function get_transform_matr(df::DataFrame, dims::Int)
    cov_matr = get_covar(df)
    E = eigen(cov_matr)
    e_vals = E.values
    e_vects = E.vectors
    m = []
    for _ in 1:dims
        ind = findmax(e_vals)[2]
        append!(m, [e_vects[:, ind]])
        e_vals[ind] = 0
    end
    m = hcat(m...)
    m = Matrix(m)
    return m
end
