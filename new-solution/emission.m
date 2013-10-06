function prob = emission(state, obser, gmm)
    prob = mvnpdf(obser, gmm.mu(state, :), gmm.Sigma(:, :, state)) * gmm.PComponents(state);