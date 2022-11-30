from fastapi import FastAPI
from vision import *
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    return {"message": "Hello"}


@app.get("/camera_data")
async def root():
    if (int(((8-vision_compute())*100)/8) == 100):
        var = 0
    else:
        var = 75

    return {
        "data": {
            "dummy0":
            {
                "num_of_places": 10,
                "available_spaces": 5,
                "percentage_occupation": 50,
                "likelyhood": 60
            },
            "dummy1":
            {
                "num_of_places": 10,
                "available_spaces": 1,
                "percentage_occupation": 90,
                "likelyhood": 10
            },
            "dummy2":
            {
                "num_of_places": 10,
                "available_spaces": 9,
                "percentage_occupation": 10,
                "likelyhood": 95
            },
            "dummy3":
            {
                "num_of_places": 10,
                "available_spaces": 5,
                "percentage_occupation": 50,
                "likelyhood": 60

            },
            "dummy4":
            {
                "num_of_places": 20,
                "available_spaces": 10,
                "percentage_occupation": 50,
                "likelyhood": 80
            },
            "dummy5":
            {
                "num_of_places": 10,
                "available_spaces": 5,
                "percentage_occupation": 50,
                "likelyhood": 60
            },
            "dummy6":
            {
                "num_of_places": 10,
                "available_spaces": 5,
                "percentage_occupation": 50,
                "likelyhood": 60
            },
            "dummy7":
            {
                "num_of_places": 6,
                "available_spaces": 1,
                "percentage_occupation": 84,
                "likelyhood": 10
            },
            "dummy8":
            {

                "num_of_places": 20,
                "available_spaces": 5,
                "percentage_occupation": 75,
                "likelyhood": 65
            },
            "dummy9":
            {
                "num_of_places": 10,
                "available_spaces": 5,
                "percentage_occupation": 50,
                "likelyhood": 60
            },
            "dummy10":
            {
                "num_of_places": 10,
                "available_spaces": 5,
                "percentage_occupation": 50,
                "likelyhood": 60
            },

            "dummy11": {
                "num_of_places": 8,
                "available_spaces": vision_compute(),
                "percentage_occupation": int(((8-vision_compute())*100)/8),
                "likelyhood": int(var),
            }
        }
    }
1
