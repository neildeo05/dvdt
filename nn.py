import torch
import torch.nn as nn
import numpy as np
from scipy.special import softmax 
# Define a simple fully connected neural network for MNIST classification

class CustomMatrixMul(torch.nn.Module):
    def __init__(self):
        super().__init__()

    def forward(self, x, y):
        a = torch.mm(x,y)
        
        return a

class model(nn.Module):
    def __init__(self):
        super(model, self).__init__()
        self.fc1 = nn.Linear(64, 32)
        self.fc2 = nn.Linear(32, 10)



module = model();
x = torch.randn(1, 64)

i = [idx for idx in list(module.named_parameters())]

# Simple Model: Linear -> ReLU -> Linear -> Softmax
cmm = CustomMatrixMul()
sm = torch.nn.Softmax()
with torch.autograd.profiler.profile(use_cuda=False) as prof:
    s1 = cmm(x,i[0][1].T) + i[1][1]
    print(s1.shape)
    s2 = torch.relu(s1)
    s3 = cmm(s2,i[2][1].T) + i[3][1]
    print(s3.shape)
    s4 = sm(s3)
    


print(prof)
