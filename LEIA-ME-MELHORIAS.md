# Azzurra — o que mudou e como publicar

## Performance (meta: mobile abaixo de ~1,5s)

O CSS e o JS agora estão embutidos dentro de cada página — o navegador não faz mais duas requisições extras antes de desenhar a tela. A imagem principal de cada página (o maior elemento visível, que o Google mede como LCP) agora tem `preload` e `fetchpriority="high"`, então começa a baixar imediatamente. Seções abaixo da dobra usam `content-visibility` no mobile, adiando o custo de renderização do que não está na tela.

**Imagens já otimizadas:** as fotos foram convertidas para WebP (de 2,2 MB para ~0,9 MB no total) e todas as páginas já apontam para os novos arquivos. Os JPG originais comprimidos também estão na pasta `images/` como compatibilidade (o og-image das redes sociais continua em JPG). O script `otimizar-imagens.sh` fica no repositório para quando você adicionar fotos novas.

## SEO e E-E-A-T

O title da home agora começa com a palavra-chave: "Pet Shop na Pompeia (SP) | Banho, Tosa e Veterinário | Azzurra". O schema LocalBusiness da home ganhou a Dra. Victória Aschermann (CRMV/SP 52841) como funcionária, link para o Google Maps e slogan. Os dois artigos do blog agora exibem "Revisado pela Dra. Victória Aschermann (CRMV/SP 52841)" e trazem isso no schema (`reviewedBy` + `dateModified`) — é exatamente o tipo de sinal de expertise que o Google procura em conteúdo de saúde animal. Todas as páginas internas ganharam schema BreadcrumbList, twitter card e theme-color. Corrigi também uma URL quebrada do logo no schema dos artigos (`azzurrapet.com...`). O sitemap agora tem `lastmod` e o llms.txt cita as credenciais da veterinária.

## Como publicar

Substitua os arquivos do repositório pelos desta pasta (a estrutura é a mesma: raiz + `blog/`). O `blog/index.html` não foi alterado (não veio no envio) — mantenha o seu; ele continua usando `css/style.css`, que segue no lugar. Depois rode o script de imagens, commit e push.

## Próximos passos que valem mais que qualquer código

1. **Google Business Profile**: é o fator nº 1 para "pet shop na pompeia". Perfil completo, categoria "Pet shop" + "Veterinário", fotos novas toda semana e pedir avaliação a cada cliente satisfeito (mande o link direto pelo WhatsApp pós-atendimento). Responda todas as avaliações.
2. **Página da Dra. Victória**: uma página `/equipe.html` com foto, formação e CRMV, linkada dos artigos, fortalece ainda mais o E-E-A-T.
3. **1 artigo por mês** no blog, sempre revisado pela veterinária (ex.: "vacinas para filhotes em SP", "acupuntura para cães idosos").
4. Meça de novo no [PageSpeed Insights](https://pagespeed.web.dev/) depois de publicar — antes e depois do script de imagens.
