-- Tabel Series (Tabel Induk)
CREATE TABLE series (
    main_title VARCHAR(100) PRIMARY KEY,
    synopsis TEXT,
    rating_score FLOAT(2),
    rating_total_users INT,
    media_type VARCHAR(6),
    status VARCHAR(9),
    genres VARCHAR(255),
    themes VARCHAR(20),
    demographics VARCHAR(15),
    total_members INT,
    total_favorites INT,
    official_site VARCHAR(30),
);

CREATE TABLE series_alter_names (
    main_title VARCHAR(255),
    alternate_title VARCHAR(255),
    FOREIGN KEY (main_title) REFERENCES series(main_title)
);


-- Tabel Anime
CREATE TABLE anime (
    main_title VARCHAR(100) PRIMARY KEY,
    studio_company_name VARCHAR(255),
    type VARCHAR(5),
    total_episodes INT,
    date_first_episode_aired DATE,
    date_last_episode_aired DATE,
    premiered VARCHAR(12),
    source VARCHAR(100),
    duration INT,
    pg_rating VARCHAR(5),
    FOREIGN KEY (main_title) REFERENCES series(main_title),
    FOREIGN KEY (studio_company_name) REFERENCES studios(company_name)
);

-- Tabel Manga
CREATE TABLE manga (
    main_title VARCHAR(100) PRIMARY KEY,
    type VARCHAR(10),
    total_volumes INT,
    total_chapters INT,
    date_first_chapter_published DATE,
    date_last_chapter_published DATE,
    serializations VARCHAR(255),
    FOREIGN KEY (main_title) REFERENCES series(main_title)
);

-- Tabel Company (Induk)
CREATE TABLE companies (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50),
    date_established DATE,
    member_favorites INT  
);

-- Tabel Company Alternate Names
CREATE TABLE company_alter_names (
    company_name VARCHAR(255),
    alternate_name VARCHAR(255),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel Studios
CREATE TABLE studios (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50) DEFAULT 'studios',
    date_established DATE,
    member_favorites INT,
    FOREIGN KEY (company_name) REFERENCES companies(company_name)
);

-- Tabel Producers
CREATE TABLE producers (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50) DEFAULT 'producers',
    date_established DATE,
    member_favorites INT,
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel Licensors
CREATE TABLE licensors (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50) DEFAULT 'licensors',
    date_established DATE,
    member_favorites INT,
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel People (Induk)
CREATE TABLE people (
    name VARCHAR(255) PRIMARY KEY,
    birthday DATE,
    website VARCHAR(30),
    biography TEXT,
    member_favorites INT,
    nationality VARCHAR(50)
);

-- Tabel People Alternate Names
CREATE TABLE people_alter_names (
    people_name VARCHAR(255),
    alternate_name VARCHAR(255),
    FOREIGN KEY (people_name) REFERENCES people(name)
);

-- Tabel Staff
CREATE TABLE staff (
    name VARCHAR(255) PRIMARY KEY,
    roles VARCHAR(100),
    FOREIGN KEY (name) REFERENCES people(name)
);

-- Tabel Voice Actors
CREATE TABLE voice_actors (
    name VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES people(name)
);

-- Tabel Character
CREATE TABLE "character" (
    name VARCHAR(50) PRIMARY KEY,
    description TEXT,
    member_favorites INT
);

-- Tabel Series Characters
CREATE TABLE series_characters (
    series_main_title VARCHAR(255),
    character_name VARCHAR(255),
    PRIMARY KEY (series_main_title, character_name),
    FOREIGN KEY (series_main_title) REFERENCES series(main_title),
    FOREIGN KEY (character_name) REFERENCES "character"(name)
);

-- Tabel Character Voice Actors
CREATE TABLE character_va (
    character_name VARCHAR(255),
    people_name VARCHAR(255),
    character_role VARCHAR(8),
    PRIMARY KEY (character_name, people_name),
    FOREIGN KEY (character_name) REFERENCES character(name),
    FOREIGN KEY (people_name) REFERENCES voice_actors(name)
);

-- Tabel Anime Producers
CREATE TABLE anime_producers (
    company_name VARCHAR(255),
    anime_main_title VARCHAR(255),
    PRIMARY KEY (company_name, anime_main_title),
    FOREIGN KEY (company_name) REFERENCES producers(company_name),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

-- Tabel Anime Licensors
CREATE TABLE anime_licensors (
    company_name VARCHAR(255),
    anime_main_title VARCHAR(255),
    PRIMARY KEY (company_name, anime_main_title),
    FOREIGN KEY (company_name) REFERENCES licensors(company_name),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

-- Tabel Anime Staff
CREATE TABLE anime_staffs (
    people_name VARCHAR(255),
    anime_main_title VARCHAR(255),
    PRIMARY KEY (people_name, anime_main_title),
    FOREIGN KEY (people_name) REFERENCES staff(name),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

-- Tabel Published Manga
CREATE TABLE published_manga (
    people_name VARCHAR(255),
    manga_main_title VARCHAR(255),
    roles VARCHAR(50),
    year_published INT,
    PRIMARY KEY (people_name, manga_main_title, roles),
    FOREIGN KEY (people_name) REFERENCES staff(name),
    FOREIGN KEY (manga_main_title) REFERENCES manga(main_title)
);

-- Tabel User
CREATE TABLE "user" (
    username VARCHAR(255) PRIMARY KEY,
    birthday DATE,
    location VARCHAR(100),
    biography TEXT,
    date_joined DATE
);

-- Tabel Reviews
CREATE TABLE reviews (
    review_id VARCHAR(20) PRIMARY KEY,
    review_category VARCHAR(50),
    description TEXT,
    date_posted DATE
);

-- Tabel Reviewed
CREATE TABLE reviewed (
    user_username VARCHAR(50),
    series_main_title VARCHAR(255),
    review_id VARCHAR(20),
    PRIMARY KEY (user_username, series_main_title, review_id),
    FOREIGN KEY (user_username) REFERENCES "user"(username),
    FOREIGN KEY (series_main_title) REFERENCES series(main_title),
    FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);

-- Tabel Manga Stats
CREATE TABLE manga_stats (
    user_username VARCHAR(50),
    manga_main_title VARCHAR(255),
    read_status VARCHAR(50),
    rating INT,
    PRIMARY KEY (user_username, manga_main_title),
    FOREIGN KEY (user_username) REFERENCES "user"(username),
    FOREIGN KEY (manga_main_title) REFERENCES manga(main_title)
);

-- Tabel Anime Stats
CREATE TABLE anime_stats (
    user_username VARCHAR(50),
    anime_main_title VARCHAR(255),
    watch_status VARCHAR(50),
    episodes_watched INT,
    rating INT,
    PRIMARY KEY (user_username, anime_main_title),
    FOREIGN KEY (user_username) REFERENCES "user"(username),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

INSERT INTO `mytable` (`main_title`,`synopsis`,`rating_score`,`rating_total_users`,`media_type`,`status`,`genres`,`themes`,`demographics`,`total_members`,`total_favorites`,`official_site`)
VALUES
('Naruto','Dream themselves difference property him different. Current indicate data. Order card push eight PM.
Claim structure population kid. Sit floor rock fill doctor. Perhaps court hold.
Eight pattern reduce few network. Including public reflect small air cause window current.
Home west word technology point protect. Floor word trial card.
Win within give road rest. Call art kind responsibility college.',2.2,7238,'Manga','Ongoing','Comedy, Documentary, Action','Gore, Psychological, Historical','Josei',70296,2265,'http://www.swanson.net/'),
('One Piece','Course especially simple husband peace civil. Wind natural suddenly kid leader deep time. During particular light.
You agency study audience under three.
Material indicate shake land half. Property level watch. Help like plan office.
Like claim administration approach leg with say.
Sister contain spring same sense. Policy manage fall us lay animal woman.
Friend movie near traditional morning wrong door. On look attack guy wall. News read huge surface really before. Why black people vote.',3.8,3915,'Manga','Ongoing','Romance, Drama','Historical, Gore, School','Josei',27585,4366,'https://finley-frost.com/'),
('Bleach','Floor east rule.
Vote ever message story four. Mrs all finally affect join.
Add research wonder to professor. Production free question Congress fish.
Site college soldier bed. Argue majority ever smile money director send. Million but possible science within place.
Term question table. Hope reflect new authority.
Little treat lawyer establish. Experience total blue value out. Worker final down compare see audience.',4.7,2243,'Manga','Completed','Fantasy','Mecha, Supernatural, Historical','Seinen',96387,2256,'https://www.villanueva.info/'),
('Attack on Titan','The study answer machine. Raise almost shoulder treatment.
Own left much see peace near late. Product federal east their. Whole behavior husband education of.
Least tax statement return. Pass difficult play become green structure drug.
Reason score necessary bank score. Course look father actually appear even born writer. Tv be right high turn break.
Into well despite bar figure relationship like anyone. Although understand billion top long pick.',2.1,6462,'Manga','Completed','Documentary, Comedy, Action','Historical, Mecha','Shoujo',25438,3725,'https://www.castillo.com/'),
('Fullmetal Alchemist','Win join from rich also. Street process past we. Role audience full education know bed character.
Certainly near law black place find. House six certainly allow actually according. Possible tend describe.
Present girl tend traditional.
Hospital doctor third stand hold many inside dream. Himself great impact go wind. Toward cell wrong which.
Entire decide officer. Nice beautiful food win. Hospital also cell approach structure.
Thing firm spring wind technology. Bank detail both cut.',1.4,7864,'Anime','Completed','Horror','Supernatural, Psychological','Shoujo',57705,5998,'http://www.lopez-anderson.com/'),
('Death Note','Chance listen reach laugh actually staff shake. Even matter wrong our thought.
Three teacher range Democrat. Scientist find chair perform thought. Send structure truth.
Become ago send cold religious floor more. Yes stay program compare cell conference. Enjoy bar west my perhaps. Force win itself turn.
Event knowledge left possible risk onto particularly oil. Often debate onto fire age.',4.8,5846,'Manga','Completed','Sci-Fi, Fantasy','Mecha','Seinen',88769,5106,'http://williams-morrison.org/'),
('Demon Slayer','Leg high back stock. Crime remember another table chair have especially. Affect food local work unit difference.
Score course suggest which line audience worry. Report social magazine lead imagine article personal. Under to you tough long window can.
Black its improve meet social yes myself. By follow movie. Near partner since. Themselves yes letter.
His when push wife clear. Staff clearly that then expect value. By bed poor many structure treatment.',2.1,1800,'Manga','Completed','Romance, Comedy','Mecha, Historical, Slice of Life','Josei',10760,7307,'http://shepard.biz/'),
('My Hero Academia','Likely firm reveal. Maybe career carry style look hotel. Always score open run understand finish. Establish itself party do.
Despite father of order despite. Determine edge improve add free high huge. Since significant shoulder country.
Those off eight create.
Above claim art defense method fast get. Clear kitchen next into arrive hour suggest party. Edge realize list training approach across.',3.9,8331,'Anime','Completed','Action','Mecha, Gore, Historical','Seinen',64512,1217,'https://case-mercer.biz/'),
('Jujutsu Kaisen','Pass onto beautiful different. Represent fund agree recognize professional hard. Professor land environmental feel idea someone. Generation everything service do but.
Commercial control if. It sound more. Enjoy why seek hold break.
Site individual young image institution remember tough. Able central wall. Usually leg paper just weight decade war.
Whom security evening budget. Night name plan argue. Form by couple others debate career. Experience cause truth others series.',4.2,1797,'Manga','Completed','Drama, Action, Comedy','Mecha','Josei',63037,3264,'https://becker.com/'),
('Hunter x Hunter','Medical line wonder much. Instead land daughter place or small focus. To buy Mr camera head lawyer sign.
Explain word run international begin as least.
Once wind large our. Third voice several country describe card focus.
Personal thank medical doctor mother. Laugh value message. Car again than artist thing want force best.
Produce moment place happy trial recognize apply either. Run whatever place often save economy herself. May feeling listen.
Never nearly man more writer occur deep.',1.9,8446,'Anime','Ongoing','Romance, Comedy','Mecha','Josei',96480,9033,'https://www.black-woods.info/'),
('Haikyuu!!','Group rule look effort lose standard his. Property likely prepare yeah.
Bed operation worry eight hour environment rest.
Give ask home mission result ever ground decision. Style several marriage sort capital assume deal.
Although charge shake manage.
Billion skill never course wait eye final. Lay college miss price. To when address feeling himself middle.
Out hard human big.',2,4081,'Anime','Ongoing','Romance, Sci-Fi, Action','School','Shounen',79244,8909,'http://armstrong.info/'),
('Gintama','Most job building election hour. Prove cover case represent place provide. Never Republican leader institution third like.
Federal research hard or subject assume wrong college. Event use address.
Then meeting whether executive close ask game. Late most pull serve entire gas common mind. Own interesting have popular team family whatever have.
Writer if together street able miss. That nation front money right reflect. Personal loss establish south rock magazine.',3.5,7083,'Manga','Completed','Sci-Fi, Comedy, Romance','Mecha, Gore','Josei',73897,9153,'http://young.org/'),
('Steins;Gate','Money increase drug fish word money. Run best his change grow sell. Finish give training key both mother if.
Training political century purpose determine off top student. Hold room old might color structure join.
Security skill power everyone draw what. Develop customer nor instead.
Serious develop central everybody cost spring wrong. Environment fill suffer response theory.
Several study fly blue poor. Involve character visit drug possible.
Be major practice relate.',2.8,3497,'Anime','Completed','Action, Drama','Gore, Slice of Life, Supernatural','Josei',56614,8992,'https://www.estrada.com/'),
('Re:Zero','Language step politics treat too find find.
Table stuff attorney throughout majority fill. Politics number network million. Leave or add pass Congress marriage property. Find accept enjoy ever fill.
Clearly management product policy. Necessary individual mention remember grow cover current. Hot risk forward.
Party understand put always enter will. Adult think seem sure.
And reflect answer you possible. Record report task catch.
Treat yes character population upon. Effort positive Mrs face why.',3.1,4033,'Manga','Ongoing','Comedy, Sci-Fi','Slice of Life, School, Mecha','Josei',20866,1446,'https://ingram.org/'),
('Sword Art Online','Music try agreement herself carry upon finish eat. Hard here woman share. House memory item medical seek.
Enough health age outside way political shoulder. Game defense information enter white. Individual address ok station glass development.
Including yeah moment indeed your take. Few son sort as wait wait economy.
Head thing stuff entire. Become magazine design article poor.
Today cold region pull world role. Television without game modern score onto green service.',4.2,5848,'Anime','Ongoing','Horror, Comedy, Action','Supernatural, Slice of Life','Josei',13672,4621,'http://www.watson-jones.com/'),
('Fate/Stay Night','Decade put make if notice. Design happen tax none west whole those.
Boy doctor hit mention high push more. Itself keep hotel learn. Himself worry nature assume poor senior.
See plant everyone plan ball. Really standard thing maintain budget.
Not him high life case court magazine. Art personal soon. Radio group instead present environment morning. Threat kid glass.
The finish interesting professional seven reason.',3.7,5474,'Manga','Ongoing','Comedy','Supernatural, Slice of Life','Shounen',82735,2192,'https://www.hill.net/'),
('Tokyo Ghoul','Soon better black hour. Top exactly then. Decade pick into.
Guy least least everything apply. Those company forget stage about wall particular.
Safe why employee anyone pressure. Ground recognize nice.
Represent strategy good lawyer miss without test. Analysis community will. Already account threat film.
Enjoy economic book physical top Republican. Benefit growth who let dog.',3.8,6188,'Manga','Completed','Sci-Fi, Documentary, Comedy','School','Seinen',15002,4059,'http://www.le-jackson.biz/'),
('Cowboy Bebop','Anything happy recently great material toward. Turn nation free.
Like interesting attorney send matter production board. No nation court food affect buy company return. Ok value defense impact.
Itself country station region front than. Hundred which join laugh car bar goal. Hard billion write issue whom identify election.
Food project position board total station course model. Tough card view. Throw trial still Republican sit cause.
Dream investment how art two. Energy really interest today.',2.4,2268,'Anime','Completed','Comedy','Supernatural, School, Slice of Life','Shoujo',33722,2390,'https://www.garcia-mclean.net/'),
('Neon Genesis Evangelion','Everyone blood idea during skin billion. Institution few baby carry yet. Suddenly thousand tonight forget set.
Social beautiful four war natural. Environmental seek reflect image picture development system. Travel crime politics play.
Specific drop goal better. Evidence particular through truth.
Foot particularly they industry raise phone. Customer low chair whose second project least wonder.',3.9,9406,'Anime','Ongoing','Drama, Comedy, Horror','Mecha, School','Seinen',92791,6526,'http://www.tran.com/'),
('Mob Psycho 100','Hold draw by according paper resource. Guess sense cultural fly. Value brother position price sometimes occur method usually.
Image above build current agree. Look thousand much involve.
Choice these physical. Dream station college simply.
Wide trouble or well buy. My fund though sit who. Thing affect couple executive reason family tonight.
Particularly measure government site human. Fine side adult heavy move music. Forget budget right behavior ball machine. Sea tend control lot reality.',4.9,2305,'Manga','Ongoing','Comedy','Historical','Seinen',53198,9985,'https://rodriguez.com/'),
('JoJo''s Bizarre Adventure','Majority similar various task court. Forward national off benefit research region.
Interview we guess surface require. Bit unit per.
Situation player gas significant. Available painting century just apply finally and.
Exist less deal great. Generation resource doctor meet eye. Each language pretty.
Place tell total avoid those source. Mission ability sometimes job month audience.
Image or usually commercial thousand Mrs to. Forget bag series bad agree area region. Provide risk to.',3.2,4347,'Anime','Ongoing','Comedy, Sci-Fi, Drama','Slice of Life','Josei',10580,1868,'https://www.smith.com/'),
('Vinland Saga','Brother point war note argue. Building seem some would. How final summer drive management painting.
Into rule agree activity direction bring. Article discuss science or. Prevent fund nice story.
Bad local personal trial popular about. Fly economic sing. See hour say tax what.
Fall cost itself manager stand call week any. Dinner level which admit leg.
Bring left thank easy wear your. May arm economy item.
Most nothing risk. Take detail form involve product behavior.',4,800,'Anime','Completed','Drama','Mecha, Gore, Slice of Life','Josei',70045,107,'http://www.ferguson.com/'),
('Mushoku Tensei','Military their many fill black thing worry. Him mother all would soon shake reality. Employee help too parent might down.
Part visit early blue professor subject. Spring baby figure happy bed.
Ball beat tend note central. Color me hour view.
Heavy pass late manager. Wide forget keep gun gun design bar. Sign kitchen know few program.
Coach discuss newspaper throughout. Onto less line right stock few.
Probably president public. Top these exactly build deal method detail.',4.7,6759,'Manga','Ongoing','Comedy','School','Shounen',89389,6400,'https://bates.com/'),
('Spy x Family','Movie future think west.
Window newspaper really move answer research story energy. Social least left social large choice guy. Subject indeed a.
Call law enter determine anyone around character. Away last hand want tell player. Raise instead concern simple case director.
Partner data democratic management election. Service tell officer feeling.',3.7,6441,'Anime','Completed','Fantasy, Romance, Documentary','Gore, Psychological, Historical','Seinen',9423,6935,'https://www.hernandez.com/'),
('Chainsaw Man','Resource day audience develop. Would evening world social serious. Kid cup age campaign coach owner. Nothing thousand us media day never.
Glass admit would center best nature join bank.
Individual strong understand break environment. Make son should his can dog.
Different charge other agreement amount. Simply education line future professor. South serve instead defense skill avoid job.
Accept necessary stuff office reach measure network degree. No tell result place listen.',1.9,4153,'Manga','Ongoing','Romance, Fantasy, Horror','Gore, Historical','Shounen',3577,9687,'https://www.rosales.com/'),
('Fruits Basket','Rock somebody try hospital prevent recent. Physical ask beyond bring traditional fund. Learn lay sure test system act approach us.
Day moment water hospital likely. Group space during camera while fall local how.
Hard ask save organization. Plant step player size. Bad soldier appear although artist note.
Fund special all. Issue general plan however direction budget TV. Continue morning work many Republican away defense.',1.9,2833,'Manga','Ongoing','Drama','Psychological, Gore','Shounen',84577,3705,'https://baker-chase.com/'),
('Horimiya','Around history price star. As experience employee example.
Tree price perhaps city process. Understand fire cold course. Beautiful drug art.
End everything Congress big go dark. Well within middle send. Unit young before. Bar amount late.
Air second coach politics product. Wonder organization offer form consumer clearly.
Officer mean natural quality front sit tell. Structure financial stand gun agent.
That data system put speech. Director series fall director.',1.1,9116,'Manga','Completed','Drama, Action, Romance','Gore, Historical, Psychological','Shoujo',77241,2836,'http://long.biz/'),
('Monogatari Series','Lead boy color painting song goal against hard.
Foot very born surface process medical. Few possible matter provide response difficult do.
Simple sit family. History someone eight return threat feeling sit thus.
Number stuff identify region old. Music account another single. Effect author weight age cell.
Standard organization action control. Argue past reality contain child according.
Share where often company movie professor. Prepare same off church.',1.7,3594,'Anime','Ongoing','Romance, Action','Historical, Supernatural','Seinen',45045,4007,'http://rose-novak.com/'),
('Berserk','Save energy him scene weight story product. The build offer last unit appear.
Character question seven long management he marriage. Help theory hand tell movie knowledge.
Blue answer blue may point. West card second us.
Similar store laugh man think building. Summer southern particularly phone art realize for.
Remain show toward your reality. Community trouble attack break happy need better natural. Its because pattern yes expert win various.',4.3,8577,'Anime','Ongoing','Drama','Historical','Shoujo',13700,8757,'http://wilson.com/'),
('Overlord','Character such read response produce. Necessary leader majority their level miss. Require environment unit far.
Future control think management run sea something. Turn face subject food audience test product understand.
Republican future religious purpose major he necessary only. Machine on culture feel method heavy.
Foreign maybe use car exactly organization beyond draw. Traditional skill success though establish human what.',1.7,1035,'Anime','Completed','Horror','Supernatural','Shounen',98269,2018,'http://stanley.info/'),
('Konosuba','Practice sea who true represent history protect. Win city yet story mind. Film away customer same.
Hair by career.
White only simply herself light cup it. Team child the why.
Business be cut cup also hot much clearly. Join sell defense fund particular sometimes.
Every resource these through discover and cold. Response full walk read forget allow seem.
Road service write yourself vote city force. Increase game east around debate whose time fear.',4.2,8668,'Anime','Completed','Documentary','Gore, Supernatural','Shounen',51107,3491,'http://www.frost-hill.biz/'),
('Violet Evergarden','Total own particular least situation represent give professor. Product deep wind until before sea professor. Form debate health with history ever term.
She painting adult material response though despite. Response else skin direction.
Film international two simply admit serve. Center camera stage increase which better off. Some individual billion away window.
Seat single happy manage against. Reality plan look store low friend guess. Away power carry.
Data young shoulder.',1.1,9316,'Anime','Ongoing','Action','Slice of Life','Seinen',55949,2414,'http://green.com/'),
('Promised Neverland','Argue establish culture stuff fact. Religious ask special. College investment hold machine.
Oil current activity meet. Why consider year center.
Arrive professor man true away. Responsibility for activity list game piece ten.
Use successful wrong push type. Talk opportunity idea.
Similar deal rate finish. Policy exactly each make month claim free.
Still keep during prove action small page. Send opportunity suffer accept establish action. Thought amount record later option benefit behind.',2.8,1823,'Manga','Completed','Documentary','Mecha, Gore, School','Josei',99288,9573,'https://www.phelps.com/'),
('Shokugeki no Soma','Special evening last less place could thing. Population better value here admit school.
Expect shoulder simply find lose full outside. Center rich national economy truth street to. Trouble he type book behavior author.
Probably glass short understand car knowledge miss. Fast risk well story laugh. Apply out big different book move.
Current wait protect space college answer reach. Food measure whether capital soon democratic election.',2.2,3031,'Manga','Ongoing','Horror','Historical, Gore, Slice of Life','Shounen',79266,9917,'http://www.andrade-peterson.info/'),
('Noragami','Perform administration detail west seek from live. Interesting carry easy along voice at full.
Official method carry.
Democrat current issue discuss focus leg blood.
Allow road radio likely dark quality happy.
Floor speech want other sell. Create we election purpose pass represent.
Next approach plant side whether. Focus difficult adult probably allow. Relationship pick of debate attention.
Trip red serve drug company day. Try for when news. Action color deal trouble down authority know.',2.4,228,'Anime','Completed','Fantasy','Gore, Slice of Life','Seinen',35952,1993,'http://www.gonzalez.info/'),
('Yuri!!! on Ice','Recent military black fast week read since. Major sort should within. Happy common order dark teach clearly.
Five size develop discuss hear. Feel financial project. Read entire above second. Wind fire the perform traditional all debate.
Population trouble everything. Science social recently report. End reduce subject energy nature time.
From compare sit western song cultural cell. Push early point focus whom watch his dream.',3.6,3600,'Manga','Ongoing','Action','Supernatural','Josei',41638,1127,'https://garcia.org/'),
('Ansatsu Kyoushitsu','Similar for find yourself firm left operation. Pm better research.
Manage final war quickly chance agree. Effort shoulder attention five fact treatment. Floor task participant high wait account.
Five tell improve debate. Consider point quality.
Type edge race training mouth. Rest behavior effect share most population still pass.
Girl check wife represent amount media school pressure. Important according difficult mind step others majority free. Difficult wish material real that anyone.',1.2,7807,'Anime','Completed','Fantasy, Romance, Comedy','Psychological','Shoujo',36184,8325,'https://www.graham.net/'),
('Durarara!!','Culture box realize speak concern. Tough avoid compare shoulder let wife sometimes.
Stage Democrat yard growth majority debate kid. Various take attention dream always drop. Environment consumer appear.
Player carry almost material whom also treatment. Growth brother environmental teacher gas friend fight.
Represent data despite pay difficult hair party. Our key resource act their off send reveal. Second economic hear resource big half. Blue suffer determine.',4.9,5572,'Manga','Completed','Drama, Documentary, Fantasy','Supernatural, Historical, Psychological','Shounen',47407,3169,'https://www.price-strickland.com/'),
('Magi','Author company author already may success take. Through drop reveal whose although environmental final.
Whatever occur two soon this whose one seven. Need read hot according. Sit political character doctor Republican number.
Ask rich understand minute daughter majority since thus. Agreement plan free agency leader.
Watch skin song heavy cup hundred four. Use difference suddenly cultural already character base news. Teach black minute business for hope.',4.5,5430,'Manga','Ongoing','Comedy, Action','Gore, Supernatural','Shounen',27557,9094,'http://www.sims.org/'),
('Nisekoi','Establish name I character risk. Mission drive true.
Particularly six debate across participant. Run everyone firm buy. Official owner debate training knowledge market list.
Health southern read deal. News reason I part several particular want turn.
Bag ability between expect peace star. Already way range happen loss none. Send evidence night if similar.
Bed knowledge recently analysis word particular care. Try half speech ten to should see.',3.5,1390,'Manga','Ongoing','Drama, Sci-Fi, Documentary','Supernatural','Shounen',95254,606,'https://hall.com/'),
('Parasyte','Animal live scene no. Adult best six top reduce. By fill point.
Performance respond there Mr. Magazine weight special push artist task whether.
Tough challenge theory natural professional east piece fight. Data expert because that memory push top continue. Another among walk structure old.
Member treatment particular operation past center we. Poor outside phone or another.
Affect lot attorney identify. From name know item poor movement.',1.6,2459,'Anime','Completed','Drama, Action','School','Shounen',15818,7812,'https://garrison.com/'),
('Barakamon','Character job plan keep suddenly. New century our job oil.
Executive statement go spring. Her half pass Mrs us political board.
Court hundred language send friend. Add admit town amount gas. Develop Democrat remain outside affect.
Others since trade continue road recognize good water. Support protect democratic her.
Situation should treatment receive radio film these today. Pressure news citizen than rate message term.
Deal rise research. Beyond practice skill per free.',4.6,691,'Manga','Completed','Documentary, Comedy, Horror','Psychological, Slice of Life','Seinen',56083,1841,'http://www.preston.com/'),
('Oregairu','Able father politics growth color close. Between head room on pay. Student family administration animal particularly education memory.
Mean collection card. Throughout action summer.
Director sport level positive. Happy today company down discuss box. Figure send team water remain five share.
Bit area production peace experience charge. Between growth again carry adult. Eight participant throughout need government current.
Cell year child level place reality. Who either music.',4,549,'Anime','Completed','Romance','School','Shoujo',99851,7813,'https://ross.com/'),
('Saekano','Answer bag Mrs important. Certain risk community media include.
Major dinner during produce firm hospital. Environment financial trade story hard possible. Garden girl impact seven color.
Authority watch respond low quickly job civil. House prevent push fall late model. How modern watch around billion war.
Learn girl moment live kitchen pass. Until purpose member safe visit long box. Collection home mission season system boy listen despite.',2,3855,'Manga','Ongoing','Horror, Fantasy, Documentary','Gore, Mecha','Shounen',61621,737,'http://www.daniels-wall.net/'),
('Bungo Stray Dogs','General or goal car. Economy however commercial group. Seven lay go area.
Current Democrat treatment level. Long itself sometimes me. Deal rise animal recently east reason yes result.
Tonight with green what player. Smile accept such style goal artist.
Simply box yes hair some activity participant.
Above after college a type. Thousand section risk.
Window administration only they structure remain. House image radio forget receive site maintain simply.',3.7,5047,'Anime','Completed','Romance, Fantasy, Sci-Fi','Supernatural, Psychological','Shounen',63491,2230,'http://taylor.biz/'),
('Kuroko''s Basketball','Claim region bed. Floor report between wide matter better.
Head medical still away college industry never. Cost item from task dark season imagine.
Difference bad animal idea thousand. Two tell science a identify sense.
First of identify road. Reflect pull certainly born control indicate ready. Natural person partner yeah yourself consider property.
Get financial week prevent. Notice attack technology here. Improve fight until.',3.3,7276,'Anime','Completed','Action, Horror','Gore, Psychological, Slice of Life','Shounen',48300,7511,'https://bishop.com/'),
('Yowamushi Pedal','Left consumer large. Draw everything rule be skill travel network develop. Watch sport response product. Reveal red develop federal.
Executive us money off economic. Section join cultural church scene. Occur seven along industry.
Still dinner young list skill truth beyond. Sit address environmental floor public career.
Fact human exactly may girl answer interview what. Head line professional mother that.',4.2,9564,'Manga','Completed','Drama, Sci-Fi','Psychological, Historical','Josei',65129,7989,'http://www.hamilton.info/'),
('Free!','Serious create design account official serious in. Level effort daughter deal read former.
Ground attention lawyer occur professional oil.
Speech wish author year quality shoulder where. Pick create yard compare affect. Who bed physical final leg public perform.
Space growth large food especially body society animal. Century pretty member pretty city change.
Ago capital it piece. Contain impact pass soon side rest hope. Parent sure southern green usually food if.',2.7,3628,'Manga','Ongoing','Romance','School, Gore, Slice of Life','Seinen',78442,483,'http://www.alexander.info/'),
('Code Geass','Entire vote into option friend both. Firm south start special can would door.
None letter true society fear there. Believe break can green tree who.
Father past or too serious. Nation product sense light.
Ready close conference reason. Right per product think teacher real.
Both heart affect consider process agent no. Six possible but PM have. Give necessary commercial. Line national deal score other painting.',2.6,190,'Manga','Ongoing','Fantasy, Action, Horror','Supernatural, Psychological, Gore','Josei',24127,9159,'https://www.fuller.com/'),
('Fairy Tail','Fact political nation dog industry never charge ever. Nothing someone but of account.
Stand partner he side full.
Too light son that. Suffer political attack quite. Half speak role between instead. Society operation card hear of picture so.
Cell tell sing stay movement position. Modern available once newspaper start institution key address.
Many sea than. Than debate ask up turn cold.
Source six budget prove store rather. Nature court land example.',2.4,7012,'Anime','Completed','Sci-Fi, Action','Supernatural','Josei',6921,304,'http://vaughan.com/'),
('Black Clover','War spend page sister. Share out guy woman film few. Professional charge together later guy budget finish hair.
Well action ready office four peace total. Big as community idea place two.
Of sell order view. Rest or in range. Seat stock pull state.
Water third require data. Individual doctor gas score collection. Wrong choose book likely.
Note city how professional significant. Likely country huge husband although seem surface sign. Begin employee start child need begin. Happy wait six.',4.5,1595,'Anime','Ongoing','Comedy','Slice of Life, Gore, Supernatural','Shoujo',68664,6644,'https://www.williams.net/'),
('Dr. Stone','Edge only nice new. Break government price tend establish determine culture.
Year day guess strong make product it. Be per wish final. Talk win early address change.
Leader quite above data. Its develop sit also.
Cause help hope raise trouble want. Force realize tree suffer represent understand environmental. Whose participant chair east raise particular involve.',3.9,7978,'Anime','Completed','Documentary, Comedy, Sci-Fi','Slice of Life','Seinen',63714,1632,'http://www.malone.net/'),
('Your Name','In up cut various audience art spend. Measure relate state bag however. National risk president fire character take.
Himself away some purpose pay forget effect. Many institution develop. Pick wall put wish.
Allow both everybody throw fast article. Himself tough economic give onto. Want billion under benefit blood after want. Tell occur over.
Yeah minute sense stand analysis. Executive value process account member memory much.',1.9,6730,'Anime','Ongoing','Fantasy, Horror, Drama','Psychological','Shounen',76671,696,'https://www.sexton-west.biz/'),
('A Silent Voice','Different think maintain senior natural. Policy financial evening describe stand. Final world world ready. Seek party station task imagine.
Financial soldier group pressure election join mother. Face by rate.
Condition own big. Quality oil kid policy. Cup blue chance son yard floor actually.
That moment strategy bag record now. Happy series yourself yet today camera.
Year computer last late these morning. Black practice player police. Power product modern beat throughout he everyone rule.',1.3,1268,'Anime','Ongoing','Action, Drama','Gore, Slice of Life','Josei',74619,2296,'http://www.edwards.net/'),
('Psycho-Pass','Stand wind news effect. Despite live probably many close apply should. Yes realize account door.
Move local central hundred eat board worry news. Make also involve argue. Marriage mention design with.
Kind arrive crime accept without event.
Receive alone quite movement road agent. Plan positive do color the nearly if.
Maybe system particularly return office voice. Hospital cause option. Nation size bill story. Vote while son color.',4.6,1669,'Anime','Ongoing','Fantasy, Sci-Fi, Romance','Supernatural, School, Historical','Josei',7290,4944,'https://www.tanner-swanson.biz/'),
('Erased','Table federal air. Case live yes dream reason computer writer. Local rather same forget.
Film play show reach get move. As and early this.
Design above social capital. Base return management indicate draw fish.
Rich gas dog conference yes.
Million season until second machine investment.
Must not quality rule present use. Figure wear involve audience majority. Piece direction food left paper education test trip.
Eat music grow ago need if. Sing safe season best surface.',2.1,3026,'Anime','Completed','Romance','Slice of Life, Psychological','Shoujo',18349,8934,'https://sandoval-silva.info/'),
('Made in Abyss','See left apply show now peace. Quickly cover rich even somebody possible performance.
Recent age add politics world. Note address old raise. All yard blood avoid sell they. Claim baby skill drive friend worker.
Question position four minute sense occur. Evening best still gas else recognize his. Physical article consumer evidence season.
Role you commercial reason sure. Option drive soon.
Message table model us personal pass modern. Audience send the agency phone.',3.8,7702,'Anime','Completed','Horror, Romance','Slice of Life, Gore','Shounen',82909,7887,'https://ingram.net/'),
('Charlotte','International last less reach media seek fill.
Medical beat food. Who power line simply. Life across radio only our office.
Certainly stock buy mean institution personal require.
Finish call interest among relationship mention fish nice. Nothing window voice hundred kid foot.
Green think capital cell. Act project class player cover discover view cover. Then case they once institution item. Military court music court bad me somebody.',4.2,4603,'Manga','Completed','Comedy','Gore','Shounen',18625,6978,'http://hernandez.net/'),
('Clannad','Sit better performance hot. Answer white stop pass though option.
Marriage happy everybody table.
Rock car sort. Method no position home mean window. Most however old player.
Simple ready discover industry instead black check. Long property suffer ready cause sometimes music.
Instead throw thought important vote cost realize. Life suffer network fear recent appear.
Everyone its after myself push. You lot partner animal use yourself.',2.9,2334,'Manga','Ongoing','Sci-Fi','Supernatural, Mecha, School','Seinen',19409,6943,'http://davis.info/'),
('K-On!','Politics data each police power idea. His how head have room glass view.
Measure onto government our tend today. Side sister another ever alone. Necessary want order.
Only interest skin community career manager stuff. Safe task specific page herself food Mr.
Wait avoid do continue. True wide movement beyond. Mention hit just me boy economy prepare.
As good any upon water ahead. Six after choose yet. Attorney evening center knowledge check.
Several tonight reflect late.',4.1,1883,'Manga','Completed','Comedy, Action, Romance','Historical, Psychological, School','Seinen',77943,2309,'https://www.brown-richardson.info/'),
('Lucky Star','Those public hundred.
Low off board mother design avoid hope. Collection task rest trip reflect.
Tree time she close piece site describe. Physical know cover woman show computer someone. Tough available task computer board sing.
Capital evening least issue. Economic share thing much. Pull rate human law entire.
Road certainly dinner level two recent. Every beautiful television sign large.',1.4,5967,'Anime','Completed','Action, Documentary','Gore, Slice of Life, Psychological','Seinen',40437,8837,'https://douglas.com/'),
('Nichijou','Beat respond individual miss red name local. Size necessary run indicate gas week boy. More public however himself follow two training.
Care guess Mr whole how indeed. Drug away his east treat others evidence thousand.
Management specific level many order wife month. Mrs he leg. Pm action especially light herself state standard. Weight society while place.
Hair sense there interview certain under. Sound subject use toward professor institution. Father catch from else work couple.',3.4,2516,'Anime','Completed','Fantasy','Slice of Life','Shounen',76133,5486,'https://www.conner.com/'),
('Anohana','Loss more truth list simply team teach.
Road political so world. Exist move knowledge themselves position different audience. Tv down seek develop history enjoy.
Hit everything give doctor bill recent most for. Safe long opportunity case there do seven those.
Traditional understand fly direction. Son above test consumer nearly grow color development. Its think perhaps include item author. Institution speak use relate pick anyone.',1.9,7892,'Manga','Completed','Fantasy, Horror, Action','Supernatural, Slice of Life, Psychological','Seinen',5612,5077,'https://www.bryan-anthony.com/'),
('Your Lie in April','Part effort buy world any than. Least look team enter owner.
Adult majority west more member. Like choice leader forward.
Course walk lot debate whose support fish. Laugh change clear campaign report professor. Place role represent age life true figure bit.
Lose can charge still federal. Data not movie last coach moment. View nor fear seven but action.
Skill nearly family ever conference fight I.
Nothing simple everybody bad check. Benefit kid all.
Party mouth religious evening.',4.6,6442,'Manga','Completed','Horror, Fantasy','Supernatural','Seinen',52433,3542,'https://wilson.com/'),
('Cells at Work','Group mean might general all difficult. Finally say health foreign science.
Water answer I. Stop bed main rise effect soon. Change six spend appear energy ground arrive nearly.
Act stand ago.
Treatment suddenly serious behavior eye million. Prevent write media.
Themselves cup city loss information exactly sound. Word these people any Mr wonder.
Indicate concern break blood remain. Spend drive network green admit sign charge. Goal challenge already end.',4.1,8150,'Anime','Completed','Sci-Fi','Supernatural','Shoujo',94779,1935,'http://lewis.com/'),
('Goblin Slayer','Course many learn reality explain interesting. Member power around manager until test production road. Bill beat near use American.
Office thus early. Carry cost none before value involve situation. Oil even color voice sell front. Republican letter build hand.
Eat marriage air what book available deep. Deal item position program hear how. Than drive land address sound. President air two heart participant town state way.',2.7,2213,'Anime','Ongoing','Fantasy, Sci-Fi','Historical','Shounen',95874,4214,'https://www.jones.biz/'),
('Rising of the Shield Hero','Not material course professional raise. Floor a style age.
Side thousand man also remember. Ground recognize manager agency serious cell much.
Suddenly morning but challenge cultural provide anything fall. Herself material toward me effect ten. Describe across prove health little control.
Same consumer rate sign school nice. Teacher at board threat oil build. Weight mention send lay nice share.',2.5,6247,'Manga','Ongoing','Drama, Comedy','Psychological','Shoujo',83849,2434,'https://www.jones.info/'),
('That Time I Got Reincarnated as a Slime','Practice too continue energy. Others road expect executive.
Without guess activity agency. Seek agency unit job ever per watch. Away course no probably.
Actually receive anyone table. Rather involve eye whole nor. Baby little member to show eye story stock.
Tend station hotel position.
Everything treatment out throughout positive key. Though kind blood entire loss institution woman. Unit either PM stand.
Study star move five soon risk without. Current office fall itself happen small.',2.1,5575,'Anime','Ongoing','Comedy, Romance','School, Mecha','Shounen',34215,8889,'https://www.holt.biz/'),
('Darling in the Franxx','Source dark increase serve bed TV.
Store degree stuff want affect. Too eight season anything than.
Lead can they particular. Near voice create under sister television catch. Begin water fill coach candidate hand computer.
Involve win authority social piece Mrs. Sound than again. Provide certain environmental foot heart.
Effect require knowledge strong. Agent middle yeah pull seem baby.',1.6,7639,'Anime','Completed','Romance, Sci-Fi','School, Gore, Mecha','Shoujo',70294,6635,'http://www.miles.com/'),
('Black Butler','Yes hospital music respond any worry score. Leader should right recently matter place stop.
Long international news land move which easy.
Miss could could parent. Check significant fast style difference. Society wait move structure law cut occur.
Possible campaign with strategy interview space election. Point ahead tell whether they feeling bill. Industry administration single institution work soldier.
Sound book attorney. Example theory look leave society. Save service teacher second.',2.9,6584,'Manga','Completed','Horror, Sci-Fi, Romance','Gore, Psychological','Shounen',42278,2341,'http://www.brown-peterson.com/'),
('Blue Exorcist','Different eight involve likely technology material.
Later skin include design family before take hair.
Standard the nice look she animal. People probably piece worry fire. Too discussion they usually rather newspaper.
Environmental character receive reach threat investment guy. Toward room west so way.
Many option gun speak member right idea crime. Writer stage person late nor attack.
Good never agent room lawyer paper customer. Goal right today between actually. All leg many debate.',4.8,5452,'Manga','Ongoing','Fantasy','Psychological, Supernatural','Shoujo',77515,1026,'http://www.buchanan.com/'),
('Sword Art Online Alternative: Gun Gale Online','Later example strong child whether result must. Many discuss perform collection.
Probably Mrs create ready position society right. Level difference prevent cold follow. Same house firm various.
Point important off business use then themselves. Great after defense section particularly work.
Off during improve police fill. Couple create man boy poor help.
Us industry subject street. Blood concern agency poor front recognize.
Example authority institution laugh mother little. Law lot usually.',3.1,3321,'Manga','Completed','Action','School, Slice of Life','Seinen',80264,5406,'http://lowe.net/'),
('No Game No Life','Opportunity what education give second sometimes worry through. Old appear respond surface.
Full land finish move space against. Drive public lead product although recently behavior nearly.
Imagine leg night note machine sound. Sister technology account time.
Fill think student vote about. Medical age senior wind. Thus really real idea.
Would instead cover cell fill law treat.',4.6,4315,'Anime','Completed','Romance, Drama, Horror','Supernatural, School, Historical','Josei',14683,8218,'http://www.zamora.com/'),
('Kakegurui','Nothing too allow house majority part space. Discuss million by operation score hospital miss. Impact itself ready trade fall to quite discover.
Sell present send former most. Direction yes these.
Similar again glass information dream day.
Center star make car stage ready window car.
Town note apply rate. Attorney threat result conference PM wonder modern. Ago could risk hand last defense serve.
Me democratic there most exactly almost training. Son fire because. Behind land those.',3.6,1623,'Anime','Completed','Sci-Fi, Action, Horror','Mecha','Shoujo',12202,3546,'http://delgado.net/'),
('The Disastrous Life of Saiki K.','That score teach whatever clear song. Relate quickly detail increase pretty determine tend. Hard respond I first sound benefit drug meeting. Skill nor town reflect easy hold born enough.
Certain nor team director north indicate major. Walk too general dream trouble.
Artist message kitchen concern answer they. Memory card already visit successful candidate.
To officer sense hot. A require low you city almost until child. Product laugh responsibility beyond.',1.1,5032,'Manga','Completed','Comedy, Romance','Historical, Slice of Life','Shoujo',21018,3886,'https://maldonado-weaver.com/'),
('Hinamatsuri','Star talk fill.
Church floor skill goal material health Democrat. Science fund former lay stage low.
Administration house close laugh. Board good improve full. Oil this oil of under investment.
Artist dream left soon. Marriage image parent include. Sport cost soon family evidence south person interest.
Health model much television person movement. Set hit situation describe two PM. Despite street movement condition dinner east pattern. Speech accept soon painting.',1.6,1549,'Manga','Completed','Comedy, Drama, Documentary','School, Slice of Life','Shoujo',54986,3222,'https://fowler-parker.info/'),
('Golden Kamuy','Group many certain world reality room television. Finish letter nearly. Change production approach themselves action mind pay.
It pay west staff according western mind. Just customer tend without talk sometimes sure.
Career whether miss wife serve way knowledge. Bill time after. Want center conference reason voice.
Career fish good marriage bag building security. Pretty food long citizen job seven. Three tree three necessary drive sea. Finally country huge lead report.',4.6,3521,'Anime','Ongoing','Action, Sci-Fi, Fantasy','Historical, Psychological, Gore','Seinen',71312,5253,'https://www.hill.org/'),
('Dororo','Anything matter allow develop. Language drop color degree Mrs community executive. Trouble enough when change believe.
Structure pattern threat travel else worker movie.
Allow argue reason check laugh discussion. Course decide why president nice inside only.
Green least five pull. Dinner order there consider.
Call activity situation step lot memory magazine society. Least decide ever itself oil maybe.
Common campaign particular total window each material. Environmental account matter dream.',2,1484,'Manga','Completed','Sci-Fi, Romance','Supernatural, School, Psychological','Josei',71800,8227,'https://www.torres.biz/'),
('Megalobox','Today concern community quite none oil current.
Behind note whose establish. Second than close lead religious future. Market adult production yourself.
Particular agent total build where. Unit mention especially issue.
Learn soldier least collection. Court popular assume image. Assume station I close.
Boy Republican father hear among hospital. Beat leave much season key minute.',3.7,7406,'Anime','Completed','Drama','Gore, Psychological, Mecha','Josei',72384,1924,'https://www.huber.biz/'),
('Carole & Tuesday','Either natural shake specific thought. Heavy there research bar.
Walk by leave would. Rich who program address build to question. Tell since here.
Down maintain piece budget cold growth court.
Open against require decide relate interest would.
Form second by certain series notice. View Republican ability partner grow. War movement budget however ever there once.
Choice national try television professor year. Price hair friend time. Argue deal middle level federal.',4.3,2340,'Anime','Completed','Fantasy, Horror','Supernatural, Mecha','Josei',20175,5415,'http://www.maynard.com/'),
('Banana Fish','Environmental structure parent her enter. Firm Mrs customer visit.
Skin education live. Coach now especially rise kitchen send financial.
Understand reduce must consider none federal second purpose. Teacher service look choice least six serious.
Raise lose start computer. Add fill step.
Left on along anything join act rate.
Democratic recognize age study. Coach once measure interesting rest direction.
Add old simply. Ahead art forget follow.',2.2,622,'Anime','Completed','Drama','School, Mecha','Seinen',14351,1978,'http://www.jackson.com/'),
('Devilman Crybaby','Full today school green. Be bit particular start.
Current kind simple people meeting. Decision whole step meeting area.
School black nearly doctor economy. Picture particular when test fact. Line sell design treat run. Wrong international today need course clearly long.
Discuss mention candidate position myself lot picture out. Among house one mouth view. That degree act draw structure recognize important.
Eat example town through wind. Public admit shoulder agree everything natural local.',3.3,1917,'Manga','Completed','Fantasy, Horror, Action','Psychological','Seinen',81443,8236,'https://www.miller-davis.info/'),
('Cells at Work: Code Black','Computer information growth chance product church. Down election know near drive town laugh.
Know general value make reach. Fill low raise experience over. Have color throw identify change body give.
Three down subject lay local use. Hold only back minute.
Front ten age firm tend another resource. Food particularly reduce which pass. Practice both run.
Structure war truth across different be cold politics. Them later give.',3.1,5542,'Anime','Completed','Romance','Mecha, Slice of Life','Seinen',7892,9714,'https://gonzalez.org/'),
('Tower of God','Day deep center give. Song agree bag site fast however stage. Speak worry on small more.
Away cup our and still among. Candidate speak play look focus.
Dark organization sing wrong should responsibility official. Put town represent interest.
Build movement wife be thing. Artist instead keep shake seven myself need.
Sometimes talk individual performance. Instead wrong condition boy financial. Everyone listen recognize.
Most easy sign person. Court quickly provide pay.',4.2,1521,'Manga','Completed','Horror, Comedy','Psychological, Historical, School','Seinen',71711,7436,'http://www.mccarthy.org/'),
('The God of High School','Wish eat artist away dog. Apply ability teacher play every. Catch never yes fact.
Impact talk when break. Before young something record finally company. Back three my return most seven. Food television simply page.
Possible kitchen at tend for offer.
Require father room radio about sign wind. Prevent around which draw almost lay expert church. Appear produce official senior.
How young board past rock dark. Fight light real work such agreement deep. Case ability impact lay shake use carry.',4.9,9584,'Anime','Ongoing','Horror, Drama','Psychological','Shoujo',90958,1892,'http://kelly.com/'),
('Noblesse','Sound it there shake artist. Season hope skill off blood visit. Modern choose free enter reality kitchen.
Bill sell deep level. Research rule put similar student provide understand. Soldier quality often argue whom forget already above.
Cut southern affect ask. Wrong movie fight society risk. Billion sea choose piece last case. What away analysis upon.
Single way every maintain. Wrong week anything. Close wall our forward first own task many.',2,7121,'Anime','Completed','Documentary','Psychological, Slice of Life, Gore','Seinen',15231,1635,'http://hunt.biz/'),
('Great Pretender','With become right occur something until same voice. Whole many culture century rock space whom. Expect eat clear picture phone very specific.
Myself green which after teach a offer. Inside operation evening continue every. Computer note government politics drop computer forget discuss.
Reduce nice serve machine professor. People agent court morning. Idea expert past discuss.
Attack candidate only thing vote run. Environment daughter laugh life short place.',3.8,4968,'Anime','Ongoing','Action, Sci-Fi, Drama','Gore, School, Psychological','Seinen',22709,9916,'https://hill.info/'),
('Dorohedoro','Third friend little news ok. Result game soldier control money.
Draw glass enough cost spring realize. Appear religious something. Past reveal police indicate state beautiful. Institution move whatever or five class.
Thank hospital show chair. Man race lay executive interesting foreign school. According toward pass eye customer police listen relate. Right time partner start according production gas.',3.2,3534,'Anime','Completed','Comedy, Fantasy','Gore, Slice of Life, School','Shoujo',82715,9584,'https://green-jensen.com/'),
('Beastars','Bank build rest admit camera ball. Street try increase space. Bank American notice customer.
Law section rest allow maintain fly. Arm speak show lead see. Board democratic send middle left once. Out either still four production.
Small management set expert situation according change. Mention keep foreign finally benefit return. System trouble bag serve.
Claim must partner theory yourself society soon. Industry money start area. Gas deep political play.',1.6,7537,'Anime','Completed','Comedy','Slice of Life, School, Mecha','Seinen',62665,3481,'http://www.suarez-frederick.com/'),
('Keep Your Hands Off Eizouken!','Form century run knowledge recognize throughout. Two almost realize blue loss conference bad. Side just short Democrat.
Amount Republican agreement. Either certain car difficult value physical. A officer water anything bar.
Leave else sign hair something attorney. Heavy rich future young large part.
Two television possible hotel safe year administration. Reveal town majority every.
Response on tell technology trip put. Mrs my arrive expect along eat. Still by factor order.',3.2,2039,'Manga','Completed','Drama','Gore','Shoujo',80307,8894,'https://matthews-rodriguez.info/'),
('Toilet-Bound Hanako-kun','Bank charge like movie commercial. Worker some town other.
Field answer establish left impact mother. Guess stock show really seven.
Road where contain her. Down lose be still stay support. Establish report door system up.
Hand learn condition tonight level.
Attorney method live behind risk. Safe create them name southern situation late. Meeting throughout collection just them.
Weight person under lot realize. Ten social because common middle in answer.',1.8,1723,'Manga','Completed','Documentary, Horror','Gore','Shoujo',56441,8594,'http://flores.com/'),
('Kakushigoto','Throw growth his enter compare next. Particularly source most read fall. Chair history kid back financial.
Land financial matter firm four.
Person soldier well style do ball how. Mean garden some example section. Development who agree civil common never where skill.
Win such research organization recent still. One expect late with read red.
Size large team. Child mention perhaps.
Live personal light parent forget. Level western example television skill.',2.8,1342,'Manga','Ongoing','Comedy','Psychological, Slice of Life','Seinen',99763,2467,'https://mason.com/'),
('Arte','View like according center. President police lead future provide pressure brother.
Worker memory none question phone chance his. Clear ball address different also second. Together just citizen that realize information picture.
Near visit rule. Light then production why safe tonight former.
Wrong story film. Mind serve around half.
Political Congress voice director too network.
Five more but surface save such director. Become range budget leg local have water. Financial policy fund table catch.',3.6,4753,'Anime','Completed','Sci-Fi, Action','Psychological','Josei',26918,1255,'http://gilbert-phillips.com/'),
('Gleipnir','Senior mission day debate light according investment end. Field rise score friend who.
Some along task. Police phone clearly consumer low tell. Individual decade serious.
State seat month loss. According provide well later call. Increase garden prove run number herself under.
Old citizen officer sign couple pay.
Boy prepare strategy them group. Loss new cold term science standard term. Hair yeah begin guess just.',4.7,3848,'Anime','Completed','Horror, Drama, Romance','Historical, School, Mecha','Seinen',43583,5247,'http://king.com/'),
('Darwin''s Game','Political example history today. Film general modern significant. Change southern management attack general game stock.
Manage money central interest. Full too drop reach. Bar start large.
Democrat recent system lead chair different others. Fact well list book prove during. Book final notice turn.
Usually pressure evidence throughout or both. Accept key least sound exist kind meet.
Too let require back. Need identify cost door audience. Look peace age not pattern.',4.5,8553,'Manga','Ongoing','Drama','School, Psychological','Shoujo',94003,6358,'http://www.sanford.com/'),
('Somali and the Forest Spirit','News peace bar drop report especially.
Single there send song son. Issue drug break treatment Republican staff kind.
Sense white father full technology. General activity phone movie weight certainly describe. Quite walk member.
Feel decade second up. Tonight choose event wish attention whether. Last edge upon go consumer green.
Floor job white plant mission fear. Glass next parent always. Between view positive design blood just.',4.6,6723,'Anime','Ongoing','Sci-Fi','Gore, Psychological','Josei',48045,2777,'https://dixon.com/'),
('In/Spectre','Box kind middle eat. Guess seem total. Free treatment foot sister read organization.
Development central her. Them name future attention remember.
Compare degree fight role. Yeah occur debate company.
Society nothing pretty special week she. Law popular well represent. Goal without civil language arrive sound change design.
Treatment human expect style main. Chance serious no speech part manager fund agree. His eat back official four camera.',1.5,355,'Manga','Ongoing','Comedy, Fantasy, Action','Supernatural, School, Historical','Josei',17567,1970,'https://smith.com/'),
('Kaguya-sama: Love is War','Feel million interest sing agency wife. South tend much several everybody.
Church actually give chance music. Show voice trouble family ground.
Figure large arrive order work performance unit. Until they soldier often summer arm field. Right part candidate past day relate.
Everything black down reduce blood parent easy. Listen different figure special since. Fine where scientist back bag. Attention under own natural Mrs produce any position.',1.6,3415,'Anime','Ongoing','Sci-Fi','Gore, Mecha, School','Shoujo',76063,1673,'https://burns.info/'),
('Quintessential Quintuplets','Court certainly box even risk. Field sing visit important.
Story much energy age senior too. Character reason general break.
Nice low traditional care first. Nearly rest painting author student support special.
People president near court fly. Station some various production relate write trouble. Notice hair pattern society relate by. Game never member realize employee.
At culture family happen drive. Performance marriage figure strong between. Science part give player.',4.4,9591,'Anime','Completed','Action','Psychological, Gore','Seinen',64789,7131,'https://hubbard.com/'),
('Domestic Girlfriend','Might close strategy time mention population. Table lot character TV hold. Program blue open during.
Somebody difficult air.
Force nice better it. Charge item office consider individual one. Picture sing sign rock effect traditional.
Mouth compare until trouble. Everyone catch these. Street budget tough usually hold part somebody.
Still new measure writer. Material base benefit miss yet purpose. Practice space they time.',2.5,7520,'Anime','Completed','Documentary, Comedy, Sci-Fi','Slice of Life','Seinen',31009,4838,'http://mills.info/'),
('Rent-a-Girlfriend','Kitchen practice bill wrong. Popular two attack paper present find on five. Outside best tax common feel election.
Sing require house much.
Agency term action should. Stage American until change. Up majority else information sit other. Letter these wind base great.
Form market wonder various. Sing movie notice year along. May focus partner hot personal speech technology baby.
We discussion sign total heart card. Page free measure. Book senior tend civil entire produce yard.',3.9,8837,'Manga','Ongoing','Drama','Psychological, Mecha','Shoujo',56644,2219,'https://gonzalez.com/'),
('Uzaki-chan Wants to Hang Out!','By west subject some. Voice may perform material purpose three.
Court at reason shoulder drop. Wife onto culture. Space glass consider garden professor finally deep.
Common goal health sort your song write. Down gas this into including ready.
Off four attention end nature loss. Medical wrong human painting interview finish. Long affect heart suggest. Also experience provide in.
Create long room. Of best with paper senior budget despite.',3.1,1763,'Anime','Completed','Action, Comedy','Historical, School, Psychological','Shoujo',51689,1307,'https://garcia.com/'),
('Arifureta','Long season bit simple picture write line.
Local care Democrat challenge low anything put.
Side notice some hope decade year me. Carry size computer box million less sound.
Spend office kind state. Health stop personal drive once baby me.
Positive enjoy area including dream indeed.
Garden our different itself they support court camera. Live really above moment city difficult. Position woman us your behind Congress wish society.
Put hour rich guess. Impact dinner structure.',1.1,2243,'Anime','Ongoing','Drama','Mecha, Psychological','Josei',52770,898,'https://may-spencer.com/'),
('How a Realist Hero Rebuilt the Kingdom','Dog rich onto industry country event. Remain young until long until everyone. Challenge culture too stock head.
Wish hand agreement store bag. For morning generation significant. Police wrong trade have happy laugh. Professional bit benefit president.
Hundred these under bank know. Mission business wide memory star. Usually must section laugh pick notice.
Owner person future civil evening thus. Back structure training alone employee example thus.',2.7,8124,'Anime','Ongoing','Comedy, Action, Sci-Fi','Mecha','Shounen',71575,3208,'https://haynes.com/'),
('Jobless Reincarnation','Avoid during then money. Nation vote college serve push area. Wrong name give trouble.
Avoid late appear stop. Reveal they design country ever together affect. Religious trip end member.
Anyone media discuss. Result even world impact bar treat return.
Story season discussion artist discuss explain. Upon race military. Truth difference method argue.
Foreign significant month my mind bed determine. Street head senior their. Perform themselves government power. Continue expect style health.',3.5,4932,'Manga','Completed','Romance, Horror','School','Josei',20411,5177,'https://hamilton-mckee.com/'),
('Combatants Will Be Dispatched!','Save outside painting attorney including push low. Part friend away. Car different him full win particularly.
Special serious age realize gun.
Room building state appear walk within. Bill window player return candidate ball.
Bit now worry plan. Million material high church city wait sound lawyer. Well moment affect design should.
Card sell save everything. Take debate himself today church sound chair. Service get beautiful buy.',4.6,3305,'Manga','Ongoing','Drama','Historical','Josei',21299,4674,'https://mendoza.com/'),
('My Next Life as a Villainess','Both amount little challenge reality. Expect produce institution need foreign. Purpose son statement look town eight reason.
Store represent then culture. Last face suffer pay thought spend summer. Discussion central group.
Sound officer heavy tend. International claim seem traditional successful spend staff. Involve positive leave physical walk. According baby near expert treatment hot.
Build American top. Someone hotel clearly technology less sure. Around seven resource carry.',4.4,1691,'Anime','Completed','Comedy, Sci-Fi, Documentary','Mecha, Gore','Seinen',99651,1516,'https://www.walter.biz/'),
('The Misfit of Demon King Academy','Many serious Republican guess during so against. Bank to attorney front fly full whose bank.
Weight team available product information particularly young visit.
Social major network spend agreement a. Compare friend score relate law debate.
Full have major close manage take. Open apply budget you quite. Store lead parent agreement staff between produce.
Yard give give table rise. Sign job reach administration. However management town three box task occur.',2.6,9072,'Manga','Ongoing','Horror, Fantasy','Psychological','Josei',70696,8766,'https://castillo.net/'),
('Cautious Hero','Experience girl stop floor boy. Action yourself those believe popular.
Remember system class really debate talk team offer. Trial main full customer worker play. Five nearly condition century present say every.
Piece sure eight more believe plan. How many far long arrive system responsibility. Entire Republican big defense visit bit fall.
Design such professional decision support. Trouble boy friend start out. Sound yard four education yes machine.
Whole in think firm. Serious perhaps either.',1.7,3485,'Manga','Ongoing','Fantasy, Documentary','Supernatural, Gore','Shoujo',97154,3216,'https://hughes-scott.com/'),
('Ascendance of a Bookworm','Attention degree you write war rock. Upon international need rise. Upon help discover themselves new for.
Different guess particularly meet. Car others visit attack respond.
Week hope fish many news push side.
Animal forward including voice. Fine training remain important own rest someone. Their test less.
Agent suffer charge specific. Prevent girl visit.
Recognize station police institution effort on rate. Memory almost party live material feel hospital.',4.9,1641,'Anime','Ongoing','Comedy, Romance','Historical','Seinen',80165,3331,'https://dudley.org/'),
('Grimgar of Fantasy and Ash','Skin upon rich security role treat save. Writer yes begin and because dark reflect.
Five energy whose move present moment. Military positive within thus side book. Old American affect end market that cut.
City risk single feeling just. Risk nothing official free none.
Mother another range because garden cold ahead. View management security do hear care. Foreign can under focus protect national nice.',4.5,9690,'Manga','Ongoing','Romance, Comedy, Horror','School, Supernatural','Shounen',89498,2996,'https://malone.com/'),
('Is It Wrong to Try to Pick Up Girls in a Dungeon?','Each mention ahead live space next where read. Film help air exist relationship rest social. Doctor why thank decide heavy suffer reach.
Official a lot born. Simple book foot indicate left. Stand sister trouble executive recently maintain at. Organization boy drug radio measure own important degree.
Quality right everybody letter building gas. Model difficult attack. Very tell player suffer know try.',1.4,5620,'Anime','Completed','Documentary','School, Psychological, Gore','Seinen',99157,7652,'http://johnson-prince.info/'),
('DanMachi','Back charge between explain. Worry various reflect economic. Wall fall condition treat.
Professor group rock easy live understand. Small short few degree.
Minute tough employee pattern. By everything wrong less cut different. Improve factor listen someone. Way camera themselves feeling clearly the article.
Behavior since trouble customer. Participant role property look attack authority everyone. Trip provide form American up realize page.',2.8,8631,'Manga','Completed','Drama, Sci-Fi','Slice of Life, Supernatural, Gore','Josei',21080,7492,'https://rogers.com/'),
('Log Horizon','Or special receive arm kind pull language. Effort young pretty and participant structure. Series case bar fire what trial.
Provide allow win lay if realize report. Late such audience tree style the. Place edge pattern bag.
Plant answer forward cold the would kind. Pretty forget yourself end test these.
Debate network amount anyone. Thank thank whom window. Suffer century family interview especially interesting.',3.9,1316,'Manga','Ongoing','Comedy, Documentary, Romance','School, Slice of Life','Shounen',26379,2008,'http://stephenson-clayton.info/'),
('How Heavy Are the Dumbbells You Lift?','Surface them recent alone. Kind summer expert reach throughout occur. Around name anything community man.
Sing set just fly improve one. Eat cut beat relationship boy computer wide.
Top until government property final company. Development power expert medical. Professional increase manage pressure.
Debate rate unit career positive conference collection. New blue similar near. Sign history six perhaps. Analysis need agree level region.',2.8,7219,'Anime','Ongoing','Documentary','Slice of Life, School','Shounen',19996,7113,'https://perez-marquez.com/'),
('Grand Blue','Near talk ten character make evidence lawyer market. Treatment support specific wish.
Painting determine school mission feel game get wear. Nature into amount. Watch amount magazine air trouble.
Record official stage resource who. Old however shoulder ball per.
Technology this power history action international hot. Nation chance image audience individual Republican successful later. Fact bit green brother Mrs street decide.
Theory daughter color. Base court lead beat. Exactly movie away young.',3,7748,'Manga','Ongoing','Action, Drama, Sci-Fi','Slice of Life','Seinen',79740,4839,'http://price.net/'),
('Komi Can''t Communicate','Degree certainly let along. Support finish spend debate open affect wrong require.
Structure husband per. Lawyer woman exactly tree ability international task. Establish fall eight perhaps coach. Worry say but wall economy since gun.
Recent sea start environmental. Claim bill capital skill.
Drop interest instead great design. Point board budget successful.
Drug matter like necessary recent house those center.
Remember actually middle. Right the security.',3.8,3169,'Anime','Completed','Romance','Supernatural, Gore','Seinen',26764,4945,'https://www.medina-brown.net/'),
('Sono Bisque Doll wa Koi wo Suru','Institution although prevent figure suffer.
They value on western difficult. Challenge side down suddenly. Follow never need. Care give free go city lose.
Affect new site what event.
Fact whatever guy nor mouth girl. Model go cover compare successful rate himself. Late hope president walk my two see economic.
Want cover risk though. Type determine form.
Attention action real well company. Ball but performance feel spring news. Sign ago generation much.',3.4,7540,'Anime','Completed','Comedy, Action','School, Gore','Shoujo',70503,407,'http://wise-white.com/'),
('Nagatoro','Member just others company ready. Phone take teach religious bill huge simple. More beat in officer arm try success next.
Series first mouth history. Successful huge experience if son research. Read financial authority we.
Yourself music bit project fast both.
Energy blood on customer she.
Understand possible feel. Remember main provide bit other. Agree system director according future recognize.
Friend wife reality. Against ago increase should go eat one.',2,1429,'Anime','Completed','Romance','Historical','Seinen',59822,3208,'https://www.jennings.com/'),
('Aharen-san wa Hakarenai','Catch tough trip certain dark. No his final key security.
Check mouth hit garden between. Purpose challenge million Democrat great compare food song. Just enjoy agreement lay.
Mrs leader professional hospital happy. Crime Mrs also by course and.
Play where religious whom line yeah. Education process today purpose view. Land cut list in significant second page brother. Stop rate hope apply manager Republican life.
Full decision turn eight effort. Skill friend bar player let probably.',1.3,7402,'Manga','Completed','Fantasy, Horror, Documentary','Psychological, Supernatural, Slice of Life','Shoujo',76924,7917,'https://www.cook.com/'),
('Teasing Master Takagi-san','Member agent avoid bar consider arrive century. Month short class least price development sound.
Report point exist after.
Instead table relate strong different career. Born red operation federal family kitchen. Join fine mention where affect risk information.
Dream better while. Let around after attention. Rock military very.
These test doctor something loss power. Increase natural performance season former. Class short central which.',4.3,2333,'Anime','Completed','Action, Sci-Fi, Comedy','Mecha, Psychological','Shoujo',60092,8366,'http://www.peck-thomas.com/'),
('Rascal Does Not Dream of Bunny Girl Senpai','Maintain effort foreign popular. Bar interest will newspaper. Least billion stop old five apply answer.
Resource very financial idea take.
Box allow woman safe tend manage. Sort exist whether attack improve industry.
Morning may turn current store several. Statement attention forget response behind manager partner. Good study chair public.
Study later feel. Sort one business agency.
Thousand view yet environment true improve organization. Minute itself somebody indicate support central.',4.9,8644,'Manga','Ongoing','Comedy','Supernatural, Historical, School','Josei',45710,3160,'https://www.anderson-vincent.com/'),
('Yamada-kun and the Seven Witches','Individual Democrat write act check everything radio own. Price ago lay nothing. Ten everybody sport finally.
Tree left reality both training couple future loss. Lead safe build reality. Per somebody training both.
Institution social remain by air mean behind. Rule trouble station rate.
Range character under model trial me. Region must relate finish official. Peace out key role.
Author others election. Quite despite prevent too Republican interest.',3.1,4067,'Manga','Completed','Action, Sci-Fi, Romance','Slice of Life','Seinen',70501,2567,'http://avery.com/'),
('The World God Only Knows','Despite mind yeah environmental around fire hundred half. Into woman sea respond young politics remain. Themselves change relationship everything move blood little policy.
Focus Republican lead above almost only owner. Arrive goal chance clearly reach notice trial. Go beyond him give spring. Smile discuss foreign fight.
Environment entire plant college purpose leader. Fill write child own year least law. Open fish itself fill notice season.',1.8,7494,'Manga','Ongoing','Comedy, Action, Documentary','Slice of Life','Shounen',32193,1273,'https://www.richardson.com/'),
('Haganai','Cost might hope wall black behind. Outside soon art speak edge house.
True already science business. Music around old body common toward.
Arm dream ahead drive determine dark garden foreign. Dark south level same east food. Stock some contain high.
Attorney his until find. Wide among short concern customer deal. Police indeed industry fill customer.
Agent last gas our serious fight. Set citizen much economy.
Professional doctor soldier. Art newspaper hard system series financial outside.',1.5,5107,'Anime','Completed','Horror, Fantasy','Psychological, School','Shoujo',2372,2384,'http://www.yang.net/'),
('Gamers!','List science wind toward they. Easy charge war own to employee. Tree staff accept beautiful plan.
Skill add president together. Result agency yes smile up character hit. Allow base whom modern.
Morning me set character table minute. Mind officer person health reason significant.
Over sign human own. Wind campaign any government world focus toward. City commercial push.
Matter beautiful truth machine memory return hair. Scientist woman others our power.',3.8,5084,'Anime','Ongoing','Romance, Sci-Fi','Gore, Slice of Life, Supernatural','Josei',7381,6232,'http://zavala-baker.com/'),
('Classroom of the Elite','Some school break name movement. Explain peace information notice term likely these.
Identify reflect create chance tell reveal yeah. Nearly way actually must remain prevent less.
Run wide production. Knowledge item beyond often deep. Attack too provide daughter.
Significant effect activity staff general himself. Young particular whose lay. School head social girl ever get.
Physical more as analysis thus majority oil. Myself myself few low father.',2.9,6595,'Manga','Ongoing','Drama, Documentary','Supernatural, Psychological, School','Seinen',91732,9043,'http://hardy.org/'),
('The Melancholy of Haruhi Suzumiya','Way director past movement market move.
Right sell five almost sound begin. Reach group their picture section safe. Tax whom news night recently although. Senior need tonight arrive art price quite.
Billion almost hand interesting direction many. Significant art key resource rule. Common get draw heart.
Ever magazine for several there activity shake. Exactly protect this nice. Hundred television way road investment cell crime.',3.6,3220,'Manga','Ongoing','Fantasy, Horror, Documentary','Slice of Life, Psychological, School','Shounen',71735,6202,'https://rodriguez.net/'),
('Love, Chunibyo & Other Delusions','Simply crime successful join push. Mention major future wrong. Mother region ok may feeling.
Consider important let plan American. Medical should system form cover customer.
Reflect thought front. Before talk late last. Support firm value staff. Paper should poor.
Understand shoulder challenge answer late. Resource of maybe card class around investment.
Realize move teacher less natural. Young guess fund program general.',4.6,4579,'Manga','Completed','Romance, Action, Comedy','Supernatural','Seinen',36898,8577,'https://guerrero.com/'),
('A Certain Scientific Railgun','Pull whole man. Build between month. Away wait bad.
Raise must arrive generation condition. Season father prevent realize. Sport tend over general grow here.
Fall high successful career establish pretty. Individual fight huge important.
Set treatment road land. Huge improve radio long involve leg into. However military large family opportunity. Easy face else usually its people.
Forget soldier report. Reach address focus election seem. Plant kitchen page he yet give.',2,8462,'Anime','Ongoing','Fantasy, Drama','Mecha, Supernatural','Shoujo',31789,5611,'https://torres.com/'),
('Parasyte: The Maxim','Citizen energy house game series find tend same. Return article event then.
Sport as actually collection century cut director. Pm find serve we bring read newspaper own.
Group wish court continue or. Miss reason rich responsibility half tend. Section many within rather address quickly heavy stay.
Agreement follow task necessary upon development firm career. Pull my down she drug realize. Performance book just save create worry she.
Camera sense any just treat. Star change deal modern.',3.3,3202,'Anime','Completed','Horror, Romance','Historical, Psychological','Shoujo',83893,4127,'https://www.roberts-galvan.com/'),
('Black Lagoon','Alone present role. Evening old example third.
Reveal seem various Republican. Rich name watch follow issue. Election everything appear how.
Trip painting pick never himself key recent. Foot should admit camera. Before involve we.
Ahead above protect future bring including everyone. Employee seven cell check sort behavior. Wait yeah consider and enjoy early leave.
Military rich system find southern. Her order perhaps. Cultural follow property thought in point executive.
Half nothing station.',4.2,4244,'Manga','Ongoing','Documentary','Mecha, Psychological','Shoujo',18013,8347,'https://www.williams.info/'),
('Angel Beats!','Nature purpose pull school activity. Provide method response picture single TV main. Tell need several about others under.
Street language catch young occur local front. Investment more off resource specific two.
Above mouth tend star over cultural reason. Interview child candidate into second. Fall speech rise worker standard less without.
Office doctor author democratic. Gun under individual.',2.9,2904,'Manga','Completed','Sci-Fi','Slice of Life','Shoujo',7845,3608,'https://sullivan.com/'),
('Trigun','Most part class rest Mrs. Arrive market relate sign likely. Hope member source arm per study.
Point forget onto must test. Ten film upon political enter.
Soon whole role. Network skin chair say. Degree talk never avoid memory never.
Any experience whose support foot blue. A player conference listen.
On agree soon image I push treat. City guy someone any others. Surface finally nearly character animal enjoy.',3.3,7353,'Manga','Completed','Comedy','Supernatural','Josei',20436,4987,'https://weaver.net/'),
('Soul Eater','Interesting simply according huge great half court. Author big remain.
Full than home order safe. Morning financial film stand add.
Raise painting develop administration become. Who news commercial compare do expect forward. Right plant magazine camera.
Environment stuff quickly fly open run. Machine huge hit big the line network. Executive night pay art thank cover always.
Use or thousand father do drive. Degree job opportunity purpose staff. Science never environmental full should.',1.8,9082,'Anime','Completed','Fantasy, Horror, Sci-Fi','Historical, School','Shounen',66894,7176,'https://waller.com/'),
('Akame ga Kill!','Summer rise result candidate why painting. Very collection hundred air effect administration. Involve as almost story develop draw store.
Look computer bring about. Personal hotel sign but stage member specific seek. Field be age west safe.
Heavy he but focus senior.
Girl sound direction onto drive house. Nothing threat lay kid trade benefit. State green program meet improve.
Way woman vote. Only surface idea turn. Able decision body recent hair.',3.4,8861,'Anime','Completed','Sci-Fi, Drama, Romance','School, Mecha, Slice of Life','Shounen',73855,6480,'http://www.montgomery.info/'),
('Sword Art Online: Alicization','Leave technology check miss level couple indeed. Author well level minute executive.
Career meeting morning physical society. Way however task nation. Method debate maintain well face do.
Western coach cost series. Do size east upon consumer purpose next deal.
Area institution us south ten. Person TV human sound director shoulder. Fund wide various.
Little bit future media.',1.3,253,'Anime','Completed','Fantasy','Slice of Life, Supernatural','Josei',60971,6990,'https://www.hampton.com/'),
('Fairy Tail: Final Series','Improve sort fly least service once unit. Finish reflect treatment rest. Per effect improve word five wish argue. Throughout opportunity structure adult drop.
Mission picture shake. Smile individual page glass reality any together expert.
She claim city long what. Business development woman result try follow arm simple.
Skill popular whatever major. Entire possible reveal free.',5,9486,'Manga','Completed','Comedy, Sci-Fi, Romance','School, Gore, Mecha','Shounen',62012,7920,'https://www.shelton.net/'),
('Blue Period','Line success discover role group nearly. Early current leg serious very.
Try thing open author. No safe professor at. Floor window thank sound.
Knowledge sing however much listen consumer case nature. Family thus center by community important apply. Avoid high learn large well feeling worry. Big need school health once amount onto test.
Page large federal memory. Song ok cup. Share employee benefit citizen tend college. Evening film interest own new lose.',4.2,4441,'Manga','Ongoing','Romance, Fantasy, Documentary','Gore, Psychological, Slice of Life','Josei',3452,3872,'https://www.torres.com/'),
('Ergo Proxy','Total idea stand special. Cut current media approach across.
Amount first training use main teach the. Understand open parent single spend. That stop front voice. Goal write action without whatever.
No wait five involve hundred. Foreign story resource. Rule avoid follow senior.
Sister charge job along myself religious. Throw fight mouth nice. Third according customer staff new.
Small improve top eye. Several defense yard if type spring. More figure result call into.',4.8,3701,'Manga','Completed','Documentary, Comedy','Slice of Life, Supernatural, Gore','Seinen',29584,4375,'http://www.lutz.biz/'),
('86 (Eighty-Six)','These between group until student. Person remember once may culture again guy.
Another finally wrong continue service floor. Group young control boy possible.
Blood history kitchen others coach. View even claim give data give election.
World team reveal finally bad while. Choice soon computer walk push country college.
Next child significant great author offer. Her near maybe itself job game field. Job low stock.',3.9,6700,'Anime','Ongoing','Action, Sci-Fi','Historical','Seinen',32362,4890,'http://chandler.com/'),
('The Ancient Magus'' Bride','Trouble realize official white American speak. Let into wear heavy side and. Method factor pick action.
About will camera seven kid. Kid able shake wonder.
Nation suddenly focus order provide. Despite clear eye game avoid.
Thank fear fire including interesting Mrs. During citizen degree notice material much. Central nor last huge day.
Generation society half reduce effort. Hold when technology loss. Very senior seem public need.',3.2,4755,'Manga','Ongoing','Fantasy, Horror, Romance','Gore','Shoujo',63588,8995,'http://richards-ruiz.com/'),
('Akudama Drive','Program others ok would never piece organization power. Provide assume able have wear specific face help.
Somebody agency stock certain. State fight reveal floor culture certain.
Then high maintain fish. Easy manager first clear pattern idea price.
Mind help recent natural for bill. No instead single near. Ahead different attack fire paper scene whole.
Option policy whose authority. Garden century common Congress three mission. They modern impact since could. For radio condition fine.',1.2,6914,'Manga','Ongoing','Documentary','Mecha, Supernatural','Josei',88692,8583,'https://sanchez.info/'),
('Horou Musuko','Hand nor time between true. Arm claim onto television.
Believe summer out career between thing. Entire system if recent later eat. Country while real run push light.
Discussion environmental remain main. While prepare fight all room effect. Business station music especially enjoy man father near.
State hand into system break. Leader paper music for. Whose same form hundred which section real both.',1.1,6304,'Manga','Ongoing','Comedy, Drama','Psychological','Seinen',58284,302,'http://bauer.org/'),
('Witch Hunter Robin','Need door thing live person moment. Trouble sort exactly over. Whose read off admit from write experience.
Large weight evidence show.
Run fact figure. Ability stop politics new brother. Western fear point sort month.
Your interesting stock seem common behind raise tonight.
Glass water behavior miss along. Foreign determine list from color professor school.
According save me per. Better during visit process easy environmental.
Operation money image. Quality answer will assume.',3.1,277,'Manga','Ongoing','Comedy','Mecha, School','Josei',56549,699,'https://www.davila-wright.net/'),
('Texhnolyze','Stock artist ever east. Camera program ever out return too positive.
Century success most truth raise within. Wall guess remember worker various might task. Police standard try plan.
Fear play born. Owner message major customer far support hundred.
North adult happen remember. Want best after for watch visit data major. Catch dream successful gas.
Agree trip traditional learn pressure. Difficult current kid report common avoid glass. Commercial conference room street song loss.',1.9,8954,'Anime','Ongoing','Horror','Mecha, Historical','Shounen',78464,6926,'http://www.marshall.com/'),
('Samurai Champloo','Recently generation activity put detail. Worry leave ask since. Trouble tell draw southern.
Walk same admit democratic better director within role. Edge exist drive somebody eight expert that.
Follow together friend. Apply you sound page.
Than town bag number term pull move away. Along room yet couple. Art upon hospital education pull open north.
Serve return matter young page. Agree wind challenge drug many building attorney.
Paper impact response trip include store consumer. Arm back value.',5,322,'Manga','Completed','Sci-Fi','School, Historical','Shoujo',52768,7202,'http://brown-warren.com/'),
('Baccano!','Statement sit expect contain little past. Good serious deep analysis inside. Begin radio eye.
Just trade become she. Individual rise notice here throw. Likely notice head message nothing reason town performance.
Strategy decide sign fly. Three question collection capital fall region product. Computer central street study.
And image pattern piece although white. Yet however keep once focus continue voice. Article analysis occur several whom lay.',4.3,9215,'Anime','Completed','Horror, Comedy, Romance','Mecha','Shoujo',7398,4507,'http://www.ross.com/'),
('Eden of the East','Play before involve. Policy glass standard camera among catch. Sister call once manage treatment hold direction.
Coach prepare prepare bill artist final yourself.
Improve people economy challenge look material. Decide herself summer wind respond either whatever. Shake stage front house.
Site song finally interesting sense green. Window myself attorney do safe behind Mrs.
Mr parent hit PM economic night front. Above car idea art. Nature recently soldier in start.',4.7,5214,'Anime','Completed','Fantasy','Slice of Life, Psychological','Shoujo',92368,9176,'https://www.gray.com/'),
('Angels of Death','Possible also energy how once buy professor contain. Discussion interview full range hope here statement.
Notice set organization ready read.
Most tonight goal hospital perhaps anything maybe. Candidate kind direction news order music garden. And me cold process.
Issue seven suddenly accept. Material police with mouth part office. Point on herself either.
While matter what customer drop.
Ok friend blood as want ten four. Recognize stop get foreign physical indeed.',2.4,7372,'Manga','Ongoing','Horror','School, Slice of Life, Gore','Shounen',33258,8684,'http://www.young.com/'),
('Zombie Land Saga','Describe sound difference write approach close support price. Half individual simple short sister out talk.
Might model fine training. Piece agree institution morning officer. Itself teacher home like cause their. Deal picture star kind serious state.
Cost everything leave lead physical scientist education. Interesting entire many.
Least foot miss. Push still serve reveal senior. Age prevent next candidate hold.',1.1,143,'Anime','Ongoing','Documentary, Comedy','Historical, Psychological, Supernatural','Shounen',56701,9540,'https://www.davidson.com/'),
('ReLIFE','Method and go officer. Will gun sort wish.
Industry the fill eat debate meeting. Government increase fall better political hold.
Class or drive professor program player. General allow surface put test high. Sure minute move simply commercial value ten.
President think collection would. Sort general certain environmental mean successful. Quality but staff particular far. Song standard western report tend.',3.1,6843,'Anime','Ongoing','Fantasy','Psychological, Supernatural','Josei',20171,4461,'http://www.oliver.biz/'),
('Plastic Memories','Consumer election blood.
Story test agent allow everybody. Region third something firm. Not person discussion family a.
Style economic sell speak. Need college back city.
Approach create surface these nothing suffer. Top would politics company he throughout seat.
Character hot behavior protect nature score. Good radio six want act. Trip eat model society.',2,1381,'Manga','Ongoing','Sci-Fi, Romance','Gore','Shoujo',50317,6308,'http://morgan.net/'),
('Tamako Market','Wear behavior join especially true scene. Only everything police activity five.
Follow water suggest figure job near. Peace point in million common none return citizen. Think front market baby area.
From hundred particularly again less our population. Sign deal reveal five. Fight foreign former until strategy figure.
Bank heavy compare peace glass above. Republican administration throughout prove. Organization everybody him experience scientist.',3.6,4436,'Manga','Ongoing','Action, Fantasy, Romance','Supernatural, Historical','Josei',96120,2535,'https://www.lee-ross.info/'),
('Akiba Maid War','Field money throughout trouble such.
Sport exist rest southern toward sound. Way everything bar commercial after program professional. Street already oil.
Father bit fear hit town. Wonder leave himself common product cost economy.
Herself wish pass individual property Mr. Admit huge affect service place message left share. Indicate want great central we stay light. Air nation rather only.
Type range onto best within month. Program collection nearly section relationship daughter mother buy.',4.5,3250,'Manga','Ongoing','Fantasy, Documentary','Slice of Life, School','Josei',26408,6898,'https://www.small-lawson.org/'),
('Summer Wars','Important across thank produce job. Much value event season.
Force player teach just. Another heavy government source more couple.
Mean seven various movie edge south again why.
Vote report season style talk each. Explain short idea. President reach leader same carry every land others.
Left education detail animal.
Top computer cultural close sell ground similar. Value ever morning all individual laugh subject. West push mean wrong he wind first.',4.7,3886,'Manga','Completed','Sci-Fi, Romance','Historical, Mecha','Seinen',57538,4717,'http://www.whitehead.net/'),
('Children of the Sea','Call together get impact remember dinner possible sister. Night beautiful everybody protect community finish lose. Audience strategy loss know to room hair.
Whom training wide name certainly. Group never at tax. Particularly statement tax recent.
Much find collection shoulder environment draw live.
Director major new newspaper. Run take cost. Force wall know serve now sure else.
Black source skin thing our. Avoid though police American believe.
Watch music they. Turn way city able summer.',4.9,7775,'Manga','Completed','Fantasy, Sci-Fi, Romance','Supernatural, Mecha','Josei',19773,5241,'https://welch-rogers.com/'),
('The Boy and the Beast','Course strategy black position. The hard nor.
Best what vote though. Face loss somebody study final. Poor analysis miss organization unit trial field.
Or much too pay yet measure. Majority evening kid produce. Hold up lay sing fill.
Teach someone this job less.
Physical inside financial international candidate radio. Majority us time fly. Wide cost little rule seem newspaper house happen. Time specific media five.',3,5464,'Anime','Ongoing','Documentary, Comedy','Historical, Gore, School','Seinen',82630,9090,'http://noble-lucas.biz/');