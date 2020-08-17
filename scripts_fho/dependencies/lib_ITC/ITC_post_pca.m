function [factor_time,factor_time_peak,factor_freq,...
    factor_freq_peak,factor_index_in_times,...
    factor_index_in_freqs] = ITC_post_pca(FactorResults_tpca, FactorResults_stpca,times,freqs)

tpca_threshold = 0.4;
spca_threshold = 0.8;

[factor_time,factor_time_peak,filename,...
    factor_index_in_times] = analyze_rotatedmatrix_tpca_with_times(FactorResults_tpca,...
    times,tpca_threshold);


[factor_freq,factor_freq_peak,...
    factor_index_in_freqs] = analyze_rotatedmatrix_fpca_with_freqs(FactorResults_stpca,...
        freqs, filename,spca_threshold);