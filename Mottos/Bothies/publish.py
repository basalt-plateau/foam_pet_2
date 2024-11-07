





import os


ride = "ca5b9eff57b3f39e1e2cc3852a01d51091572af44ae37929cdad8d26a6b2c6cf"

os.system (f"cd /Metro/Mottos/Bothies/Bothy && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Bothies/Bothy_Thermoplastic && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Bothies/Bothy_Mwanaanga && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Bothies/Bothy_Tivaevae && aptos move publish --assume-yes --named-addresses ride={ ride }");

