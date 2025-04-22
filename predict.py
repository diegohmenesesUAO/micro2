from torchvision import models, transforms
from PIL import Image
import torch
import io

# Cargar el modelo
model = models.resnet18(pretrained=True)
model.eval()

# Transformaciones
transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])

# Cargar etiquetas de clases
with open("imagenet_classes.txt") as f:
    labels = [line.strip() for line in f.readlines()]

def predict_image(image_bytes):
    image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
    img_t = transform(image)
    batch_t = torch.unsqueeze(img_t, 0)
    out = model(batch_t)
    _, index = torch.max(out, 1)
    return labels[index]
