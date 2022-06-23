-- RETRIEVING THE TOP 30 MOVIES BASED ON IMDB RATING

SELECT TOP 30 *
FROM PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
ORDER BY [IMDb-Rating] DESC

-- CLEANING DATA. CHANGED [ClintEastwood, EliWallach, LeeVanCleef, AldoGiuffrè] TO [ClintEastwood, EliWallach, LeeVanCleef, AldoGiuffre]

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'ClintEastwood, EliWallach, LeeVanCleef, AldoGiuffre'
WHERE Title = 'Il buono, il brutto, il cattivo'

-- RETRIEVING THE TOP 30 MOVIES BASED ON FILM DURATION

SELECT TOP 30 *
FROM PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
ORDER BY Duration DESC

--CLEANING DATA FROM TOP 30 MOVIES BASED ON FILM DURATION

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Category = 'Drama,Romance', Duration = '96min'
WHERE Title = 'Chun gwong cha sit'

-- BECAUSE DURATION WAS SET TO '96MIN', "CHU GWONG CHA SIT" NO LONGER IN TOP 30 MOVIES BASED ON FILM DURATION
-- CONTINUED TO CLEAN THE DATE FROM TOP 30 MOVIES BASED ON FILM DURATION

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'ClintEastwood, GianMariaVolonte, MarianneKoch, WolfgangLukschy'
WHERE Title = 'Per un pugno di dollari'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Title = 'Kung Fu Hustle'
WHERE Title = 'Kung fu'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET [Censor-board-rating] = 'PG'
WHERE Title = 'To Be or Not to Be'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'IreneJacob, Jean-LouisTrintignant, Fr�d�riqueFeder, Jean-PierreLorit'
WHERE Title = 'Trois couleurs: Rouge'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Director = 'Fran�oisTruffaut', Stars = 'Jean-PierreL�aud, AlbertR�my, ClaireMaurier, GuyDecomble'
WHERE Title = 'Les quatre cents coups'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Title= 'H�stsonaten', Stars = 'IngridBergman, LivUllmann, LenaNyman, HalvarBjork'
WHERE Title = 'Höstsonaten'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'WilliamH.Macy, FrancesMcDormand, SteveBuscemi, PeterStormare'
WHERE Title = 'Fargo'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'JayBaruchel, GerardButler, ChristopherMintz-Plasse, CraigFerguson', [Censor-board-rating] = 'PG'
WHERE Title = 'How to Train Your Dragon'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Title= 'WALL-E', [Censor-board-rating] = 'G'
WHERE Title = 'WALL·E'

-- FORGOT TO CHANGE THE CENSORSHIP RATING, SO HAD TO CREATE NEW STATEMENT WITH TITLE AS 'WALL-E' INSTEAD OF 'WALL·E', SINCE TITLE WAS CHANGED.

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET [Censor-board-rating] = 'G'
WHERE Title = 'WALL-E'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'TonyChiu-WaiLeung, MaggieCheung, SiuPing-Lam, JoeCheungTung-cho', [Censor-board-rating] = 'PG'
WHERE Title = 'Fa Yeung Nin Wah'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'VincentCassel, HubertKounde, Sa�dTaghmaoui, AbdelAhmedGhili'
WHERE Title = 'La haine'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'IreneJacob, WladyslawKowalski, HalinaGryglaszewska, KalinaJedrusik', Title = 'La double vie de V�ronique'
WHERE Title = 'La double vie de Véronique'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Title = 'Toki o kakeru shojo', [Censor-board-rating] = 'NotRated'
WHERE Title = 'Toki o kakeru shôjo'

UPDATE PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
SET Stars = 'GerardJugnot, Fran�oisBerl�and, Jean-BaptisteMaunier, KadMerad'
WHERE Title = 'Les choristes'

SELECT TOP 30 *
FROM PortfolioProject.dbo.IMDb_Dataset_From_Kaggle
ORDER BY Duration DESC
