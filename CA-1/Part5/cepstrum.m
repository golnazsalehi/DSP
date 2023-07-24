function c = cepstrum(x)
    FFT = fft(x);
    Abs = abs(FFT);
    Log =log(Abs);
    c = ifft(Log);
end