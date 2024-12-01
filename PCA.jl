using DataFrames
using Statistics
using LinearAlgebra

function get_covar(df::DataFrame)
    cov_matr = cov(Matrix(df))
    return cov_matr
end

function covar_eigs(cov_matr::Matrix, k::Int)
    E = eigen(cov_matr)
    e_vals = E.values
    e_vects = E.vectors
    m = []
    for _ in 1:k
        ind = findmax(e_vals)[2]
        append!(m, [e_vects[ind, :]])
        e_vals[ind] = 0
    end
    m = hcat(m...)
    m = Matrix(transpose(m))
    return m
end

