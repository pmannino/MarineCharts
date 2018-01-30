--
-- File generated with SQLiteStudio v3.1.0 on Wed Jul 13 13:50:55 2016
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Panels
CREATE TABLE Panels (
    chartName text,
    file_name text,
    panel_no text,
    panel_title text,
    panel_type text,
    projection text,
    scale integer,
    sounding_unit text,
    CONSTRAINT Panels_PK PRIMARY KEY (chartName, panel_no)
);

-- Table: ProductCatalogs
CREATE TABLE ProductCatalogs (date_created text, date_valid text, dt_valid text, DateRetrieved DATETIME, ref_spec text, ref_spec_vers text, s62AgencyCode text, time_created text, time_valid text, title text, CONSTRAINT ProductCatalogs_PK PRIMARY KEY (title));

-- Table: Vertices
CREATE TABLE Vertices (
    chartName text,
    panel_no text,
    lat real,
    long real,
    pointNumber integer,
    CONSTRAINT Vertices_PK PRIMARY KEY (chartName, panel_no, pointNumber)
);

-- Table: USACECharts
CREATE TABLE USACECharts (chartName text, DateRetrieved DATETIME, edition real, location_from text, location_to text, river_name text, river_miles_begin integer, river_miles_end integer, s57_file_date_posted text, s57_file_file_size text, s57_file_location text, s57_file_time_posted text, CONSTRAINT USACECharts_PK PRIMARY KEY (chartName));

-- Table: RNCCharts
CREATE TABLE RNCCharts (
    chartName text,
    DateRetrieved DATETIME,
    horizontalDatum text,
    ntm_date text,
    ntm_edition integer,
    ntm_edition_last_correction integer,
    raster_edition integer,
    raster_edition_last_correction integer,
    source_date text,
    source_edition integer,
    source_edition_last_correction integer,
    title text,
    verticalDatum text,
    zipfile_datetime text,
    zipfile_datetime_iso8601 text,
    zipfile_location text,
    zipfile_size integer,
    CONSTRAINT RNCCharts_PK PRIMARY KEY (chartName)
);

-- Table: AllTopoMaps
CREATE TABLE AllTopoMaps (Series VARCHAR, Version VARCHAR, CellID INTEGER, MapName VARCHAR, PrimaryState VARCHAR, Scale INTEGER, DateOnMap INTEGER, ImprintYear INTEGER, WoodlandTint VARCHAR (1), VisualVersionNumber INTEGER, PhotoInspectionYear INTEGER, PhotoRevisionYear INTEGER, AerialPhotoYear INTEGER, EditYear INTEGER, FieldCheckYear INTEGER, SurveyYear INTEGER, Datum VARCHAR, Projection VARCHAR, Advance VARCHAR (1), Preliminary VARCHAR (1), Provisional VARCHAR (1), Interim VARCHAR (1), Planimetric VARCHAR (1), SpecialPrinting VARCHAR (1), SpecialMap VARCHAR (1), ShadedRelief VARCHAR (1), Orthophoto VARCHAR, PubUSGS VARCHAR (1), PubArmyCorpsEng VARCHAR (1), PubArmyMap VARCHAR (1), PubForestServ VARCHAR (1), PubMilitaryOther VARCHAR (1), PubReclamation VARCHAR (1), PubWarDept VARCHAR (1), PubBurLandMgmt VARCHAR (1), PubNatlParkServ VARCHAR (1), PubIndianAffairs VARCHAR (1), PubEPA VARCHAR (1), PubTennValleyAuth VARCHAR (1), PubUSCommerce VARCHAR (1), Keywords VARCHAR, MapLanguage VARCHAR, ScannerResolution INTEGER, CellName VARCHAR, PrimaryStateName VARCHAR, NLat REAL, WLong REAL, SLat REAL, ELong REAL, LinktoHTMCMetadata VARCHAR, DownloadGeoPDF VARCHAR, ViewFGDCMetadataXML VARCHAR, ViewThumbnailImage VARCHAR, ScanID INTEGER, GDAItemID INTEGER CONSTRAINT AllTopoMaps_PK PRIMARY KEY, CreateDate VARCHAR, ByteCount INTEGER, GridSize VARCHAR, Download VARCHAR (1) DEFAULT N, DownloadDate DATETIME);

-- Table: CoastPilots
CREATE TABLE CoastPilots (Region INTEGER, Name VARCHAR (20), Edition INTEGER, LastUpdate DATE, URL VARCHAR (64), Description VARCHAR (128), CONSTRAINT CoastPilots_PK PRIMARY KEY (Region));

-- Table: Locations
CREATE TABLE Locations (
    chartName text,
    loc text,
    loc_type text,
    CONSTRAINT Locations_PK PRIMARY KEY (chartName, loc)
);

-- Table: ENCCharts
CREATE TABLE ENCCharts (
    chartName text,
    cscale text,
    DateRetrieved DATETIME,
    edtn text,
    isdt text,
    lname text,
    src_chart text,
    status text,
    uadt text,
    updn text,
    zipfile_datetime text,
    zipfile_datetime_iso8601 text,
    zipfile_location text,
    zipfile_size integer,
    CONSTRAINT RNCCharts_PK PRIMARY KEY (chartName)
);

-- Index: ntm_date_idx
CREATE INDEX ntm_date_idx on ENCCharts(isdt);

-- View: ChartsToUpdate
CREATE VIEW ChartsToUpdate AS
SELECT 'ENC' AS Product,
       chartName as ChartName,
       lname AS Title,
       isdt as LastAccessTime,
       uadt as CreationTime,
       zipfile_datetime_iso8601 as LastWriteTime,
       zipfile_location as URL
  FROM ENCCharts
 WHERE isdt >= (SELECT DateRetrieved
                  FROM ProductCatalogs
                 WHERE title = 'ENC Product Catalog'
               )
    OR DateRetrieved IS NULL
UNION
SELECT 'RNC' AS Product,
       chartName as ChartName,
       title AS Title,
       ntm_date as LastAccessTime,
       source_date as CreationTime,
       zipfile_datetime_iso8601 as LastWriteTime,
       zipfile_location as URL
  FROM RNCCharts
 WHERE ntm_date >= (SELECT DateRetrieved
                      FROM ProductCatalogs
                     WHERE title = 'RNC Product Catalog'
                   )
    OR DateRetrieved IS NULL
UNION
SELECT 'USACE' AS Product,
       chartName as ChartName,
       river_name AS Title,
       s57_file_date_posted as LastAccessTime,
       s57_file_date_posted as CreationTime,
       s57_file_date_posted || 'T' || s57_file_time_posted as LastWriteTime,
       s57_file_location as URL
  FROM USACECharts
  WHERE s57_file_date_posted >= (SELECT DateRetrieved
                                   FROM ProductCatalogs
                                  WHERE title = 'IENC U37 Product Catalog'
                                )
    OR DateRetrieved IS NULL;

-- View: BoundingBox
CREATE VIEW BoundingBox AS
SELECT MapName,
       PrimaryState,
       CellName,
       GDAItemID,
       Download
  FROM AllTopoMaps
 WHERE nlat BETWEEN 36.75 AND 39.625 AND 
       slat BETWEEN 36.75 AND 39.625 AND 
       elong BETWEEN-77.375 AND-75.25 AND 
       wlong BETWEEN-77.375 AND-75.25 AND 
       Version = 'Current'
 ORDER BY nlat,
          elong ASC;

-- View: ToposToUpdate
CREATE VIEW ToposToUpdate AS
SELECT *
  FROM AllTopoMaps
 WHERE Download = 'Y';

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
