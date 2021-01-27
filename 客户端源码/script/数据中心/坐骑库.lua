--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-12 06:33:21
--======================================================================--
function 引擎.补差(zq,角色)
	local zqs={}
	zqs.x,zqs.y=0,0
	if zq=="汗血宝马" and (角色=="桃夭夭" or 角色=="神天兵" ) then
		zqs.x,zqs.y=0,0
	    return zqs.x,zqs.y
	elseif zq=="魔骨战熊" or zq=="月影天马" then
		zqs.x,zqs.y=3,-12
	    return zqs.x,zqs.y
	elseif zq=="九尾神狐" then
		zqs.x,zqs.y=5,0
	    return zqs.x,zqs.y
	elseif zq=="暗影战豹" then
		zqs.x,zqs.y=0,-12
	    return zqs.x,zqs.y
	elseif zq=="飞天猪猪" then
		zqs.x,zqs.y=0,40
	    return zqs.x,zqs.y
	elseif zq=="飞天猪猪" then
		zqs.x,zqs.y=0,40
	    return zqs.x,zqs.y
	elseif zq=="瑞彩祥云" or zq=="七彩祥云"then
		zqs.x,zqs.y=3,-35
	    return zqs.x,zqs.y
	elseif zq=="落英纷飞"  then
		zqs.x,zqs.y=3,-45
	    return zqs.x,zqs.y
	elseif zq=="齐天小轿" or zq=="凤舞灵蝶" then
		zqs.x,zqs.y=3,-60
	    return zqs.x,zqs.y
	elseif zq=="风火飞轮" or zq=="流云玉佩" then
		zqs.x,zqs.y=1.5,-70
	    return zqs.x,zqs.y
	end
	if  (zq == "披甲战狼" or zq == "魔力斗兽")  and (角色=="鬼潇潇" or 角色=="鬼潇潇" ) then
	    zqs.x,zqs.y=0,35
	    return zqs.x,zqs.y
	end
	return zqs.x,zqs.y
end

function 引擎.坐骑库(id,zq,sp)
	if zq==nil then
	    return
	end
	local zqs = {
		宝贝葫芦 = {0x63C1AA04,0x939B6AA2,2,"shape.wd5"},
		神气小龟 = {0xE88353,0x702610D3,3,"shape.wd5"},
		汗血宝马 = {0x7B49FA9A,0x3F76F5B2,4,"shape.wd5"},
		欢喜羊羊 = {0x8D4DBAAE,0x2636063C,5,"shape.wd5"},
		魔力斗兽 = {0x4B0E16F1,0x28F7499E,4,"shape.wd5"},
		披甲战狼 = {0x3B0CC9,0xF6B76F79,5,"shape.wd5"},
		闲云野鹤 = {0x49CAB729,0x1544FBAD,4,"shape.wd5"},
		云魅仙鹿 = {0x621ECF47,0x98D7DB2,5,"shape.wd5"},
		七彩神驴 = {0x03633E07,0x01040DCE,4,"shape.wd5"},
		银色穷奇 = {0x0536E9A0,0x023E3D97,3,"shape.wd5"},
		天使猪猪 = {0x02549905,0x055833D5,3,"shape.wd5"},
		九尾神狐 = {0x03C81881,0x03E53AEF,2,"shape.wd5"},
		金鳞仙子 = {0x05B30629,0x065C9E28,1,"shape.wd5"},
		踏雪灵熊 = {0x0773EB94,0x23C8E5DE,3,"shape.wd5"},
		九霄冰凤 = {0x08DB9888,0x0C2671A9,3,"shape.wd5"},
		战火穷奇 = {0x0A5927A8,0x0BDDE762,3,"shape.wd5"},
		玄冰灵虎 = {0x0A648F68,0x0A8F525E,3,"shape.wd5"},
		御风灵貂 = {0x5BCF5B7B,0x0A6E3345,3,"shape.wd5"},
		青霄天麟 = {0x0BBA930C,0xF5B6264C,3,"shape.wd5"},
		琉璃宝象 = {0xC01D7558,0x343087B3,3,"shape.wd5"},
		莽林猛犸 = {0xBE8BCD59,0x1EE017FE,3,"shape.wd5"},
		暗影战豹 = {0x2283C8E4,0x256B2E02,4,"shape.wd5"},
		鹤雪锦犀 = {0x2C490405,0x61F5973D,3,"shape.wd5"},
		猪猪小侠 = {0x2D5B61B8,0x366A7D69,3,"shape.wd5"},
		飞天猪猪 = {0x2D7948EF,0xD9195AA8,1,"shape.wd5"},
		沉星寒犀 = {0x43E7BE1F,0x77C1746C,3,"shape.wd5"},
		妙缘暖犀 = {0x52282FC2,0x843816AD,3,"shape.wd5"},
		玄火神驹 = {0x5504B0BE,0xE8DD3341,3,"shape.wd5"},
		怒雷狂狮 = {0xEC31AF3B,0x55E4FB5C,3,"shape.wd5"},
		月影天马 = {0xC9086441,0x76C33E92,3,"shape.wd5"},
		魔骨战熊 = {0xBB49CBB2,0x8247EBC3,3,"shape.wd5"},
		轻云羊驼 = {0x9BDE4F15,0xC5C3525E,3,"shape.wd5"},
		粉红小驴 = {0xC7655C83,0xAD4889BD,3,"shape.wd5"},
		粉红小驴 = {0xC7655C83,0xAD4889BD,3,"shape.wd5"},
		独角兽 = {0xFF100011,0xFF100010,5,"jy.wdf"},
		独角兽1 = {0x30303016,0x30303017,6,"jy.wdf"},
		海豚恋人 = {0x00300100,0x00300101,5,"jy.wdf"},
		冰晶魅灵 = {0x00300601,0x00300602,6,"wzife.wd5"},
		炫影天马 = {0x02010225,0x02010226,5,"wzife.wd5"},
		玲珑雪狐 = {0x01000078,0x01000077,7,"wzife.wd5"},
		玲珑雪狐女 = {0x01000080,0x01000079,5,"wzife.wd5"},
		烈焰雄狮 = {0x01000083,0x01000082,5,"wzife.wd5"},
		九尾神狐1 = {0x01000084,0x01000085,8,"wzife.wd5"},
		瑞彩祥云 = {0x00000001,0x00000002,1,"shape.wd5"},
		风火飞轮 = {0x00000003,0x00000003,1,"shape.wd5"},
		落英纷飞 = {0x00000004,0x00000004,1,"shape.wd5"},
		凤舞灵蝶 = {0x00000005,0x00000006,1,"shape.wd5"},
		七彩祥云 = {0x00000007,0x00000008,1,"shape.wd5"},
		齐天小轿 = {0x00000009,0x00000010,1,"shape.wd5"},
		流云玉佩 = {0x00000011,0x00000012,1,"shape.wd5"},

	}
	local sps = {
		展翅高飞 = {0x2DC16EF4,0x47A59E6C,"shape.wd5"},
		旗开得胜 = {0x4FB7A645,0xC89B8D7B,"shape.wd5"},
		霸王雄风 = {0x8AC5514E,0xD30116BE,"shape.wd5"},
		独眼观天 = {0xCB41BF07,0x6D415352,"shape.wd5"},
		威武不屈 = {0xE385373B,0x71FE0155,"shape.wd5"},
		深藏不露 = {0x2529E5A5,0x51C03CD4,"shape.wd5"},
		异域浓情 = {0xE8B35E96,0x3949C769,"shape.wd5"},
		流星天马 = {0x72489CFD,0x4D136355,"shape.wd5"},
		威猛将军 = {0x5BDBA7CB,0x5CDC5A5E,"shape.wd5"},
		知情达理 = {0xCCBF24B8,0xFE4B37F2,"shape.wd5"},
		气宇轩昂 = {0xEC4C09DF,0x57B096DF,"shape.wd5"},
		如花似玉 = {0xA6966FD2,0xCA8864D1,"shape.wd5"},
		傲视天下 = {0xBB906984,0x2549904, "shape.wd5"},
		铁血豪情 = {0x742FBF19,0x103FFB93,"shape.wd5"},
		唯我独尊 = {0x7F6FFC35,0x716B5DC1,"shape.wd5"},
		异域风情 = {0x1FED0CD8,0xD8EB6880,"shape.wd5"},
		叱咤风云 = {0xAB007164,0x2E177381,"shape.wd5"},
		假面勇者 = {0xE7CB8205,0xE615404,"shape.wd5"},
		霓裳魅影 = {0xE0CB07C8,0xD9D958E6,"shape.wd5"},
		披星戴月 = {0x8ED6D8CC,0xC5D8F53D,"shape.wd5"},
		烈焰燃情 = {0x8C575D26,0x7B15590A,"shape.wd5"},
		天雨流芳 = {0x503F394B,0x23BF657B,"shape.wd5"},
		灵光再现 = {0xC4D118C5,0xCBC6930A,"shape.wd5"},
		倾国倾城 = {0x1F01B8BE,0xBDA4DDAB,"shape.wd5"},
		--落英纷飞 = {0x00000001,0x00000001,"shape.wd5"},
		空 = {}
	}
	local scs
	if id == "飞燕女" then
		scs = {{2708080383,1337608376,"shape.wdf"},{0x4492502E,0xF6D6D5E6,"shape.wd5"},{0xDCB946EC,0xDCC84D4E,"shape.wd5"},{0xDF01F29D,0xA77B55E4,"shape.wd5"},{0x6E0AD379,0x87C7A650,"shape.wd5"}}
	elseif id == "英女侠" then
		scs = {{2898894124,3708489082,"shape.wdf"},{0xD43912A9,0xD2D4CAD3,"shape.wd5"},{0x70291C50,0x30CABF19,"shape.wd5"},{0x726C392E,0x68FB1969,"shape.wd5"},{0x2474769B,0xACD868DE,"shape.wd5"}}
	elseif id == "巫蛮儿" then
		scs = {{1602126433,4185651500,"shape.wdf"},{0xF2BC9369,0xB11F6642,"shape.wdf"},{0x9B73C75F,0xDA0A8B06,"shape.wdf"},{0x2F5EAD3F,0x499F9D37,"shape.wdf"},{0xCCC0985C,0xC8F56BA3,"shape.wdf"}}
	elseif id == "偃无师" then
		scs = {{0x00000098,0x00000102,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"},{0x00000110,0x00000111,"common/shape.wda"}}
	elseif id == "逍遥生" then
		scs = {{1492865095,304945535,"shape.wdf"},{0xA35491C9,0x49D7C76E,"shape.wd5"},{0xB770EAD4,0x9A1479D8,"shape.wd5"},{0x76D629EA,0xFB50C58F,"shape.wd5"},{0x3D392EF4,0xA5E02A65,"shape.wd5"},{0x02010225,0x02010226,"wzife.wd5"},}
	elseif id == "剑侠客" then
		scs = {{1228435406,1425276052,"shape.wdf"},{0x67101CB7,0x9C8790BA,"shape.wd5"},{0x32DA9583,0xEC9AC961,"shape.wd5"},{0x766731D,0x8C50358A,"shape.wd5"},{0xA95A126D,0x513DDE6C,"shape.wd5"},{0xFF100011,0xFF100010,"jy.wdf"},{0x30303016,0x30303017,"jy.wdf"},{0x01000078,0x01000077,"wzife.wd5"},{0x01000084,0x01000085,"wzife.wd5"}}
	elseif id == "狐美人" then
		scs = {{3753105193,3988533543,"shape.wdf"},{0xE3123BDA,0x956305B5,"shape.wd5"},{0xFB798485,0xD1997415,"shape.wd5"},{0x64C21A63,0xD5D2FA14,"shape.wd5"},{0xBCD86DDA,0xF0062006,"shape.wd5"}}
	elseif id == "骨精灵" then
		scs = {{812821174,493656179,"shape.wdf"},{0xBEEF3795,0x3C6BF98F,"shape.wd5"},{0xE2C1CDE4,0xBAD0F711,"shape.wd5"},{0x75B09FA1,0x5E5736EE,"shape.wd5"},{0x83DD50D3,0xB84C7C38,"shape.wd5"}}
	elseif id == "鬼潇潇" then
		scs = {{0x00000065,0x00000053,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"},{0x00000118,0x00000119,"common/shape.wdc"}}
	elseif id == "杀破狼" then
		scs = {{652210495,1032044905,"shape.wdf"},{0xE137A55D,0xDB553291,"shape.wdf"},{0x8BEA762D,0x14EE7109,"shape.wdf"},{0x46A79E5,0x3CD5444,"shape.wdf"},{0xF974CEB,0x54A8F096,"shape.wdf"}}
	elseif id == "巨魔王" then
		scs = {{2213567130,1051618199,"shape.wdf"},{0x21ED721D,0x5A05E1C0,"shape.wd5"},{0x9DFEB143,0x77C20678,"shape.wd5"},{0x1AF61311,0x6E370D46,"shape.wd5"},{0xCC1426ED,0x39FE09DB,"shape.wd5"}}
	elseif id == "虎头怪" then
		scs = {{571142035,803245291,"shape.wdf"},{0x99AD84CD,0x9FA6D533,"shape.wd5"},{0xF56603D1,0x83DBBA94,"shape.wd5"},{0x37FFB9DF,0x64426F93,"shape.wd5"},{0x95BC0425,0xC6053278,"shape.wd5"},{0x01000083,0x01000082,"wzife.wd5"}}
	elseif id == "舞天姬" then
		scs = {{1050893021,3778545729,"shape.wdf"},{0x54DB4F4D,0xCB722714,"shape.wd5"},{0xD92FC3DE,0x809F42FE,"shape.wd5"},{0x212848A1,0xAAD7CB93,"shape.wd5"},{0xB44DF735,0xECA5DB49,"shape.wd5"},{0x01000080,0x01000079,"wzife.wd5"}}
	elseif id == "玄彩娥" then
		scs = {{1362263605,3715462681,"shape.wdf"},{0x861EE4D9,0x9F2F9C11,"shape.wd5"},{0x3316877C,0x31F77503,"shape.wd5"},{0x779A3DF,0x622664DC,"shape.wd5"},{0xA6FD7850,0xB9FD9DBD,"shape.wd5"}}
	elseif id == "桃夭夭" then
		scs = {{0x00000091,0x00000090,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"},{0x00000109,0x00000110,"common/shape.wdb"}}
	elseif id == "羽灵神" then
		scs = {{2581796502,1858805344,"shape.wdf"},{0x7D31F43E,0x76E4E3D6,"shape.wdf"},{0x7B86A5F4,0xE496A2D7,"shape.wdf"},{0x8072202A,0x6528F013,"shape.wdf"},{0x4BBD02E6,0x694A236B,"shape.wdf"}}
	elseif id == "神天兵" then
		scs = {{2115558165,1433167185,"shape.wdf"},{0x77104303,0xBC38000F,"shape.wd5"},{0xF4EF98B5,0x7C731501,"shape.wd5"},{0x7F6D09AB,0x13AD1C23,"shape.wd5"},{0x60A47C21,0x63930A54,"shape.wd5"}}
	elseif id == "龙太子" then
		scs = {{2944637360,4098637790,"shape.wdf"},{2944637360,4098637790,"shape.wdf"},{0x4F27A59F,0x801F438D,"shape.wd5"},{0x46F4FDF6,0xC9EF2751,"shape.wd5"},{0x5B0EDDAD,0xB227D39F,"shape.wd5"},{0x643F7DDE,0xCC8E0921,"shape.wd5"},{0x00300100,0x00300101,"jy.wdf"},{0x00300601,0x00300602,"wzife.wd5"}}
	end
	if zq==nil then
		tp.窗口.消息框:添加文本("坐骑zp1为空"..zq,"xt")
	elseif  zq~=nil and zqs[zq]==nil then
		tp.窗口.消息框:添加文本("坐骑zp2为空"..zq,"xt")
	elseif  zq~=nil and zqs[zq]~=nil and zqs[zq][3]==nil then
		tp.窗口.消息框:添加文本("坐骑zp3为空"..zq,"xt")
	end
	if zqs[zq]==nil then
		return
	end
	local bh = zqs[zq][3]
	-- table.print(zqs[zq])
	return {坐骑资源=zqs[zq][4],坐骑站立=zqs[zq][1],坐骑行走=zqs[zq][2],人物资源=scs[bh][3],人物站立=scs[bh][1],人物行走=scs[bh][2],坐骑饰品站立=sps[sp][1],坐骑饰品行走=sps[sp][2],坐骑饰品资源=sps[sp][3]}
end

function 引擎.一体坐骑(造型,坐骑)
	-- local 名称 = 造型..坐骑
	-- if 名称 == "剑侠客_超级小飞象" then
	-- 	return {0X77104303,0X7721212}
	-- end
	-- return {}
	local 临时资源 = {}
	local zy = {
		萤雪轻裘 = {
			[1] = {0x00000094,0x00000093,"shape.wd5"},
			[2] = {0x00000096,0x00000095,"shape.wd5"},
			[3] = {0x00000098,0x00000097,"shape.wd5"},
			[4] = {0x00000100,0x00000099,"shape.wd5"},
			[5] = {0x00000102,0x00000101,"shape.wd5"},
			[6] = {0x00000104,0x00000103,"shape.wd5"},
			[7] = {0x00000106,0x00000105,"shape.wd5"},
			[8] = {0x00000108,0x00000107,"shape.wd5"},
			[9] = {0x00000110,0x00000109,"shape.wd5"},
			[10] = {0x00000112,0x00000111,"shape.wd5"},
			[11] = {0x00000114,0x00000113,"shape.wd5"},
			[12] = {0x00000116,0x00000115,"shape.wd5"},
			[13] = {0x00000120,0x00000119,"shape.wd5"},
			[14] = {0x00000122,0x00000121,"shape.wd5"},
			[15] = {0x00000124,0x00000123,"shape.wd5"},
			[16] = {0x00000118,0x00000117,"shape.wd5"},
			[17] = {0x00000126,0x00000125,"shape.wd5"},
			[18] = {0x00000128,0x00000127,"shape.wd5"}
			},
		锦绣梦幻 = {
			[1] = {0x00000078,0x00000077,"shape.wd5"},
			[2] = {0x00000080,0x00000079,"shape.wd5"},
			[3] = {0x00000046,0x00000045,"shape.wd5"},
			[4] = {0x00000048,0x00000047,"shape.wd5"},
			[5] = {0x00000050,0x00000049,"shape.wd5"},
			[6] = {0x00000052,0x00000051,"shape.wd5"},
			[7] = {0x00000054,0x00000053,"shape.wd5"},
			[8] = {0x00000056,0x00000055,"shape.wd5"},
			[9] = {0x00000058,0x00000057,"shape.wd5"},
			[10] = {0x00000060,0x00000059,"shape.wd5"},
			[11] = {0x00000062,0x00000061,"shape.wd5"},
			[12] = {0x00000064,0x00000063,"shape.wd5"},
			[13] = {0x00000068,0x00000067,"shape.wd5"},
			[14] = {0x00000070,0x00000069,"shape.wd5"},
			[15] = {0x00000072,0x00000071,"shape.wd5"},
			[16] = {0x00000066,0x00000065,"shape.wd5"},
			[17] = {0x00000074,0x00000073,"shape.wd5"},
			[18] = {0x00000076,0x00000075,"shape.wd5"}
			},
		平步青云 = {
			[1] = {0xDE00A004,0xDE00A003,"shape.wd5"},
			[2] = {0xDE00A006,0xDE00A005,"shape.wd5"},
			[3] = {0xDE00A008,0xDE00A007,"shape.wd5"},
			[4] = {0xDE00A010,0xDE00A009,"shape.wd5"},
			[5] = {0xDE00A012,0xDE00A011,"shape.wd5"},
			[6] = {0xDE00A014,0xDE00A013,"shape.wd5"},
			[7] = {0xDE00A016,0xDE00A015,"shape.wd5"},
			[8] = {0xDE00A018,0xDE00A017,"shape.wd5"},
			[9] = {0xDE00A020,0xDE00A019,"shape.wd5"},
			[10] = {0xDE00A022,0xDE00A021,"shape.wd5"},
			[11] = {0xDE00A024,0xDE00A023,"shape.wd5"},
			[12] = {0xDE00A026,0xDE00A025,"shape.wd5"},
			[13] = {0xDE00A028,0xDE00A027,"shape.wd5"},
			[14] = {0xDE00A030,0xDE00A029,"shape.wd5"},
			[15] = {0xDE00A032,0xDE00A031,"shape.wd5"},
			[16] = {0xDE00A034,0xDE00A033,"shape.wd5"},
			[17] = {0xDE00A036,0xDE00A035,"shape.wd5"},
			[18] = {0xDE00A038,0xDE00A037,"shape.wd5"}
			},
		月色朦胧 = {
			[1] = {0xDE00A042,0xDE00A041,"shape.wd5"},
			[2] = {0xDE00A044,0xDE00A043,"shape.wd5"},
			[3] = {0xDE00A046,0xDE00A045,"shape.wd5"},
			[4] = {0xDE00A048,0xDE00A047,"shape.wd5"},
			[5] = {0xDE00A050,0xDE00A049,"shape.wd5"},
			[6] = {0xDE00A052,0xDE00A051,"shape.wd5"},
			[7] = {0xDE00A054,0xDE00A053,"shape.wd5"},
			[8] = {0xDE00A056,0xDE00A055,"shape.wd5"},
			[9] = {0xDE00A058,0xDE00A057,"shape.wd5"},
			[10] = {0xDE00A060,0xDE00A059,"shape.wd5"},
			[11] = {0xDE00A062,0xDE00A061,"shape.wd5"},
			[12] = {0xDE00A064,0xDE00A063,"shape.wd5"},
			[13] = {0xDE00A066,0xDE00A065,"shape.wd5"},
			[14] = {0xDE00A068,0xDE00A067,"shape.wd5"},
			[15] = {0xDE00A070,0xDE00A069,"shape.wd5"},
			[16] = {0xDE00A072,0xDE00A071,"shape.wd5"},
			[17] = {0xDE00A074,0xDE00A073,"shape.wd5"},
			[18] = {0xDE00A076,0xDE00A075,"shape.wd5"}
			},
		炫影天马 = {
			[1] = {0xA0000037,0xA0000038,"shape.wd5"},
			[2] = {0xA0000039,0xA0000040,"shape.wd5"},
			[3] = {0xA0000041,0xA0000042,"shape.wd5"},
			[4] = {0xA0000043,0xA0000044,"shape.wd5"},
			[5] = {0xA0000045,0xA0000046,"shape.wd5"},
			[6] = {0xA0000047,0xA0000048,"shape.wd5"},
			[7] = {0xA0000049,0xA0000050,"shape.wd5"},
			[8] = {0xA0000051,0xA0000052,"shape.wd5"},
			[9] = {0xA0000053,0xA0000054,"shape.wd5"},
			[10] = {0xA0000055,0xA0000056,"shape.wd5"},
			[11] = {0xA0000057,0xA0000058,"shape.wd5"},
			[12] = {0xA0000059,0xA0000060,"shape.wd5"},
			[13] = {0xA0000061,0xA0000062,"shape.wd5"},
			[14] = {0xA0000063,0xA0000064,"shape.wd5"},
			[15] = {0xA0000065,0xA0000066,"shape.wd5"},
			[16] = {0xA0000067,0xA0000068,"shape.wd5"},
			[17] = {0xA0000069,0xA0000070,"shape.wd5"},
			[18] = {0xA0000071,0xA0000072,"shape.wd5"}
			},
		腾云仙牛 = {
			[1] = {0xA0000109,0xA0000110,"shape.wd5"},
			[2] = {0xA0000111,0xA0000112,"shape.wd5"},
			[3] = {0xA0000113,0xA0000114,"shape.wd5"},
			[4] = {0xA0000115,0xA0000116,"shape.wd5"},
			[5] = {0xA0000117,0xA0000118,"shape.wd5"},
			[6] = {0xA0000119,0xA0000120,"shape.wd5"},
			[7] = {0xA0000121,0xA0000122,"shape.wd5"},
			[8] = {0xA0000123,0xA0000124,"shape.wd5"},
			[9] = {0xA0000125,0xA0000126,"shape.wd5"},
			[10] = {0xA0000127,0xA0000128,"shape.wd5"},
			[11] = {0xA0000129,0xA0000130,"shape.wd5"},
			[12] = {0xA0000131,0xA0000132,"shape.wd5"},
			[13] = {0xA0000133,0xA0000134,"shape.wd5"},
			[14] = {0xA0000135,0xA0000136,"shape.wd5"},
			[15] = {0xA0000137,0xA0000138,"shape.wd5"},
			[16] = {0xA0000139,0xA0000140,"shape.wd5"},
			[17] = {0xA0000141,0xA0000142,"shape.wd5"},
			[18] = {0xA0000143,0xA0000144,"shape.wd5"}
			},
		甜蜜泡泡 = {
			[1] = {0xA0000145,0xA0000146,"shape.wd5"},
			[2] = {0xA0000147,0xA0000148,"shape.wd5"},
			[3] = {0xA0000149,0xA0000150,"shape.wd5"},
			[4] = {0xA0000151,0xA0000152,"shape.wd5"},
			[5] = {0xA0000153,0xA0000154,"shape.wd5"},
			[6] = {0xA0000155,0xA0000156,"shape.wd5"},
			[7] = {0xA0000157,0xA0000158,"shape.wd5"},
			[8] = {0xA0000159,0xA0000160,"shape.wd5"},
			[9] = {0xA0000161,0xA0000162,"shape.wd5"},
			[10] = {0xA0000163,0xA0000164,"shape.wd5"},
			[11] = {0xA0000165,0xA0000166,"shape.wd5"},
			[12] = {0xA0000167,0xA0000168,"shape.wd5"},
			[13] = {0xA0000169,0xA0000170,"shape.wd5"},
			[14] = {0xA0000171,0xA0000172,"shape.wd5"},
			[15] = {0xA0000173,0xA0000174,"shape.wd5"},
			[16] = {0xA0000175,0xA0000176,"shape.wd5"},
			[17] = {0xA0000177,0xA0000178,"shape.wd5"},
			[18] = {0xA0000179,0xA0000180,"shape.wd5"}
			},
		千云沙墨黑 = {
			[1] = {0xA0000181,0xA0000182,"shape.wd5"},
			[2] = {0xA0000183,0xA0000184,"shape.wd5"},
			[3] = {0xA0000185,0xA0000186,"shape.wd5"},
			[4] = {0xA0000187,0xA0000188,"shape.wd5"},
			[5] = {0xA0000189,0xA0000190,"shape.wd5"},
			[6] = {0xA0000191,0xA0000192,"shape.wd5"},
			[7] = {0xA0000193,0xA0000194,"shape.wd5"},
			[8] = {0xA0000195,0xA0000196,"shape.wd5"},
			[9] = {0xA0000197,0xA0000198,"shape.wd5"},
			[10] = {0xA0000199,0xA0000200,"shape.wd5"},
			[11] = {0xA0000201,0xA0000202,"shape.wd5"},
			[12] = {0xA0000203,0xA0000204,"shape.wd5"},
			[13] = {0xA0000205,0xA0000206,"shape.wd5"},
			[14] = {0xA0000207,0xA0000208,"shape.wd5"},
			[15] = {0xA0000209,0xA0000210,"shape.wd5"},
			[16] = {0xA0000211,0xA0000212,"shape.wd5"},
			[17] = {0xA0000213,0xA0000214,"shape.wd5"},
			[18] = {0xA0000215,0xA0000216,"shape.wd5"}
			}
	}
	if 造型 == "飞燕女" then
		临时资源 = zy[坐骑][1]
	elseif 造型 == "骨精灵" then
		临时资源 = zy[坐骑][2]
	elseif 造型 == "鬼潇潇" then
		临时资源 = zy[坐骑][3]
	elseif 造型 == "狐美人" then
		临时资源 = zy[坐骑][4]
	elseif 造型 == "虎头怪" then
		临时资源 = zy[坐骑][5]
	elseif 造型 == "剑侠客" then
		临时资源 = zy[坐骑][6]
	elseif 造型 == "巨魔王" then
		临时资源 = zy[坐骑][7]
	elseif 造型 == "龙太子" then
		临时资源 = zy[坐骑][8]
	elseif 造型 == "杀破狼" then
		临时资源 = zy[坐骑][9]
	elseif 造型 == "神天兵" then
		临时资源 = zy[坐骑][10]
	elseif 造型 == "桃夭夭" then
		临时资源 = zy[坐骑][11]
	elseif 造型 == "巫蛮儿" then
		临时资源 = zy[坐骑][12]
	elseif 造型 == "舞天姬" then
		临时资源 = zy[坐骑][13]
	elseif 造型 == "逍遥生" then
		临时资源 = zy[坐骑][14]
	elseif 造型 == "玄彩娥" then
		临时资源 = zy[坐骑][15]
	elseif 造型 == "偃无师" then
		临时资源 = zy[坐骑][16]
	elseif 造型 == "英女侠" then
		临时资源 = zy[坐骑][17]
	elseif 造型 == "羽灵神" then
		临时资源 = zy[坐骑][18]
	end
	return 临时资源
end
	-- body
