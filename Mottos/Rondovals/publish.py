





import os


ride = "ca5b9eff57b3f39e1e2cc3852a01d51091572af44ae37929cdad8d26a6b2c6cf"

os.system (f"cd /Metro/Mottos/Rondovals/Rondoval && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Rondovals/Rondoval_Thermoplastic && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Rondovals/Rondoval_Geimfara && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Rondovals/Rondoval_Tivaevae && aptos move publish --assume-yes --named-addresses ride={ ride }");

