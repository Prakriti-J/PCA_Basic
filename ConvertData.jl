using DataFrames
using LinearAlgebra

export converted_df

function converted_df(df::DataFrame, A::Matrix)
    df = Matrix(df)
    reduced_data = df * A
    reduced_df = DataFrame(reduced_data, :auto)
    return reduced_df
end