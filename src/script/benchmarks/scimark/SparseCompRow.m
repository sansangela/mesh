
num_flops(N, nz, num_iterations) {
    actual_nz = (nz/N) * N;
    i2f(actual_nz * 2 * num_iterations)
};

matmult(M, val, row, col, x, NUM_ITERATIONS) {
    cyclen([ 0.0 ], NUM_ITERATIONS, { _ =>
        count(M) | { r => reduce(plus, 0.0, 
            range(row[r], row[r+1] - row[r]) | { i => x[ col[i] ] *. val[i] })
        }
    })
};
