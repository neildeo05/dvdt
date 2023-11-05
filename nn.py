import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
import queue 

TILE_Y = 4
TILE_X = 4


def pad(input_matrix):
    i = input_matrix.shape[0]

    target_shape = (4, 4)
    if i >= target_shape[0]:
        return input_matrix
    padding_height = max(0, target_shape[0] - i)
    padding_width = max(0, target_shape[1] - 4) 
    padded_matrix = F.pad(input_matrix, (0, padding_width, 0, padding_height))
    return padded_matrix

def tiled_matrix_mul(A, B, tile_size=4):
    a_height, a_width = A.shape
    b_height, b_width = B.shape
    x_q = queue.Queue()
    w_q = queue.Queue()
    for i in range(0, a_height, tile_size):
        for j in range(0, b_width, tile_size):
            for k in range(0, a_width, tile_size):
                i_tile = min(i + tile_size, a_height)
                j_tile = min(j + tile_size, b_width)
                k_tile = min(k + tile_size, a_width)
                A_tiled = A[i:i_tile, k:k_tile]
                B_tiled = B[k:k_tile, j:j_tile]
                x_q.put(pad(A_tiled))
                w_q.put(pad(B_tiled))
                
    return x_q, w_q, (a_height, b_width)
    


class CustomMatrixMul(torch.nn.Module):
    def __init__(self):
        super().__init__()
    def forward(self, x, y):
        x_q,w_q,c_shape = tiled_matrix_mul(x,y)
        C = torch.empty(c_shape)
        



        return x @ y

class model(nn.Module):
    def __init__(self):
        super(model, self).__init__()
        self.fc1 = nn.Linear(64, 32)
        self.fc2 = nn.Linear(32, 32)



module = model();
x = torch.randn(1, 64)

i = [idx for idx in list(module.named_parameters())]

# Simple Model: Linear -> ReLU -> Linear -> Softmax
CMM = True
cmm = CustomMatrixMul() if CMM else torch.mm
sm = torch.nn.Softmax()
with torch.autograd.profiler.profile(use_cuda=False) as prof:
    s1 = cmm(x,i[0][1].T) + i[1][1]

    s2 = torch.relu(s1)
    s3 = cmm(s2,i[2][1].T) + i[3][1]

    s4 = sm(s3)
    


print(prof)
