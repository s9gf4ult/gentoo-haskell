module Cache where

import MaybeRead
import Error
import Text.XML.HaXml.Haskell2Xml
import Text.XML.HaXml.Pretty
import Text.XML.HaXml.Types
import Text.XML.HaXml.Parse
import Distribution.Package
import Data.Version
import Network.Hackage.Client
import System.IO
import Control.Exception
import Prelude hiding(catch)

thisVersion=Version { versionBranch=[0,1],versionTags=[] }

data Cache = Cache
	{ serverName::String
	, packages::[(PackageIdentifier,String,String)]
	}

getCacheFromServer :: String -> IO Cache
getCacheFromServer serv = do
	pkgs <- listPackages serv
	return $ Cache
		{ serverName=serv
		, packages=map (\(pkg,_,loc,sig)->(pkg,loc,sig)) pkgs
		}

writeCache :: FilePath -> Cache -> IO ()
writeCache path cache = writeFile path (show (document (cacheToXML cache)))

readCache :: FilePath -> IO Cache
readCache path = do
	file <- readFile path `catch` const (throwDyn InvalidCache)
	case xmlParse' path file of
		Left str -> throwDyn InvalidCache
		Right doc -> case cacheFromXML doc of
			Nothing -> throwDyn InvalidCache
			Just res -> return res

cacheToXML :: Cache -> Document
cacheToXML cache = Document prolog emptyST mainElement [] where
	prolog = Prolog Nothing [Comment "This file provides cached information for HackPort.\nYou can update this file by using 'hackport update'."] Nothing []
	mainElement = Elem "cache" [("server",AttValue [Left $ serverName cache]),("version",AttValue [Left $ showVersion thisVersion])] (map ((CElem).packageToXML) (packages cache))

packageToXML :: (PackageIdentifier,String,String) -> Element
packageToXML (pkg,loc,sig) = Elem "package" [("name",AttValue [Left $ pkgName pkg]),("version",AttValue [Left $ showVersion $ pkgVersion pkg]),("location",AttValue [Left loc]),("signature",AttValue [Left sig])] []

packageFromXML :: Content -> Maybe (PackageIdentifier,String,String)
packageFromXML (CElem (Elem name attrs _)) = case name of
	"package" -> do
		pkgname <- lookup "name" attrs
		pkgversion <- lookup "version" attrs
		location <- lookup "location" attrs
		signature <- lookup "signature" attrs
		rpkgname <- case pkgname of
			AttValue [Left n] -> return n
			_ -> Nothing
		rpkgversion <- case pkgversion of
			AttValue [Left n] -> readPMaybe parseVersion n
			_ -> Nothing
		rloc <- case location of
			AttValue [Left n] -> return n
			_ -> Nothing
		rsig <- case signature of
			AttValue [Left n] -> return n
			_ -> Nothing
		return (PackageIdentifier { pkgName=rpkgname, pkgVersion=rpkgversion },rloc,rsig)
	_ -> Nothing
packageFromXML _ = Nothing

cacheFromXML :: Document -> Maybe Cache
cacheFromXML (Document _ _ mainElement []) = do
	case mainElement of
		Elem "cache" attrs cont -> do
			version <- lookup "version" attrs
			rversion <- case version of
				AttValue [Left n] -> readPMaybe parseVersion n
				_ -> Nothing
			if rversion==thisVersion then do
				ser <- case lookup "server" attrs of
					Just (AttValue [Left n]) -> return n
					_ -> Nothing
				pkgs <- mapM packageFromXML cont
				return (Cache {serverName=ser,packages=pkgs})
				else throwDyn WrongCacheVersion
		_ -> Nothing
