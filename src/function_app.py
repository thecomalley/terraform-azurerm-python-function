import azure.functions as func
import datetime
import json
import logging

app = func.FunctionApp()


@app.function_name(name="HttpTrigger1")
@app.route(route="req")
def main(req: func.HttpRequest) -> str:
    user = req.params.get("user")
    return f"Hello, {user}!"
