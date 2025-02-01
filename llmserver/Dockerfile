FROM python:3.11-slim

# 
WORKDIR /code

# 
COPY ./Logit_LANGCHAIN/requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./Logit_LANGCHAIN /code/app

# 포트 노출
EXPOSE 8080

# 애플리케이션 실행
CMD ["uvicorn", "app.server:app", "--host", "0.0.0.0", "--port", "8080"]
