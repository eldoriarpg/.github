FROM python:3.11

RUN pip install mkdocs-material && pip install mkdocs-git-revision-date-localized-plugin

EXPOSE 80
WORKDIR app/
COPY mkdocs.yml mkdocs.yml

COPY docs/ /app/docs/
COPY profile/README.md docs/index.md

COPY .git/ /app/.git/

ENTRYPOINT ["mkdocs", "serve", "-a", "0.0.0.0:80"]
