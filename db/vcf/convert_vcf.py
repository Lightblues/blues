# %%
import pandas as pd
import vobject

file_path = 'Yanglab22.vcf'
with open(file_path, 'r') as f:
    vcard_data = f.read()
    vcards = vobject.readComponents(vcard_data)

# %%
vcard = next(vcards)
vcard
# %%
dir(vcard)
# %%
