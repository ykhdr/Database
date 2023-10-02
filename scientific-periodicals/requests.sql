-- Поиск всех изданий по издательству
SELECT publications.name
FROM publishers
         JOIN public.publishers_publications pp ON publishers.id = pp.publisher_id
         JOIN publications ON pp.publication_id = publications.id
WHERE publishers.name = ?;

-- Поиск всех изданий, в которых печатается указанный автор
SELECT publications.name
FROM articles
         JOIN public.articles_publications ap ON articles.id = ap.article_id
         JOIN publications ON ap.publication_id = publications.id
WHERE articles.author = ?;

-- Подсчет числа всех статей, написанных авторами за указанный срок
-- Date format : 'YYYY-MM-DD'
SELECT count(ap.article_id)
FROM publication_issues
         JOIN publishers_publications pp on pp.publication_id = publication_issues.publication_id
         JOIN public.publications p on p.id = pp.publication_id
         JOIN public.articles_publications ap on p.id = ap.publication_id
WHERE publication_date >= ?
  and publication_date <= ?;

-- Поиск автора, написавшего больше всего статей
SELECT author, count(articles.id) as article_count
FROM articles
GROUP BY author
ORDER BY article_count DESC
LIMIT 1;

