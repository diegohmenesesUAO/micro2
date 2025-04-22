from fastapi import FastAPI, File, UploadFile
from predict import predict_image
import uvicorn

app = FastAPI()

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    image_bytes = await file.read()
    class_name = predict_image(image_bytes)
    return {"prediction": class_name}

if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=80)
