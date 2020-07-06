print ("assign data_out[0] = data_in[0];")
for x in range(35):
    print("assign data_out[%d] = data_in[%d];"%(x,(int(x*6))%35))
print ("assign data_out[35] = data_in[35];") 
