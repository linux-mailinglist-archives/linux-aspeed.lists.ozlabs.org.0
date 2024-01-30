Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E0843153
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:33:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MTv3EZbc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhL44VRYz3btX
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:33:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MTv3EZbc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=ernesto.corona@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhKy3tJVz2ykC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:32:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706657575; x=1738193575;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ydvGfSvv6N7tRJkw22F37uu0C51pRaPo0aZFseKuUEU=;
  b=MTv3EZbc2S/M0jJsZvhRqOoBEmv2intI5DqCPspmUYYUZRGz/izqGlbN
   NFkEoX8n3xI3ptf/i62JaZ10xzyN8A+aSPxYpakoXqAffSsWGx3TyROc5
   1pTm6B1pQ2HxZQwvFcM3IwZYBeW0GgxP8pdI2TGkZwPILU19Rg47nL4Eu
   3W2ueBIbqNqVDk3y6NXH2ScIGa787u200eO4/BGH3qGPLf5gUUBnQkC+m
   IlhKG+Xh5/86ybKqEi0nSpv82ma6qiRF2mrXyPSdG1mkecPMOasusn6H9
   b1xjcwbT+NaJn0Oabto9BqHVraZOeIK/m3pX9WBX8Kf2lHcJpwGUQ7Afc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16965158"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="16965158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 15:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3953382"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 15:32:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 15:32:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 15:32:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 15:32:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 15:32:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUsnw2ePXwIApw3rGNozoq4VhhlGs+Z8Gl1xBu/3ICJ5LmXhS+uiXTP+NrZA8pC3UyhP5skRCLnwNctlX7eRX1EzOWMEbb+rUOBjHYAsFlHdqZzRcYeTyLeYRPq3WzmXnjss9PAQ7WylvNa0xa0BWKlctqTa2vgVa/1NZtA5vWgHypgRDBOUzTqTXVEOEF8zPmJdzFP8/XZi3qQQLk+El+tQVGAABfAdZnqfpBjAcQqC9OnRusq/pdJdHY6FyvHIvLC0g7nVDZKfxAOxqNIa41ekaMiBHqYQJSyPDyAgJyoKyz1ks2oTaAqAejq82aKvVioiAlbY2J1CH2W9Mtrxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YDEtnsVWE12rgv+wabHelj+I9WE5WPuKtKPEzMyMCA=;
 b=DLOJ1g6kascwwKB/OQHoNksBf2JdB9t+PEd5/ce47Qz1SIAlccPCXAQVCVIbvvx8GnYZpk5r9vS7AcTu4whubc8zfTj2CD16IeoctqbtMHoGw+XEtU5IeTo8QcZNJ+smgn6doy5mou2ejjzALZP5U6phanq1lfPc/36y4i/zqxwei/1MJMAFkKAgqdptsXal9bDRu6LhLDUjy1IYPvYWJGGCXDrHdWf2ovpAcRGo9FJkitR3lM8lKPyOcXMn4XrIMHoNyBGi3GyA1O2NKsprUnBeWNZt5Z+xd8yeKAz8aJXitqEvD8A+KAriN5AblOIOTXlzmhcEQdXkEYgPNaPqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 23:32:48 +0000
Received: from LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9]) by LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 23:32:48 +0000
From: "Corona, Ernesto" <ernesto.corona@intel.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 30 7/7] Add AST2500 and AST2600 JTAG device in DTS
Thread-Topic: [PATCH 30 7/7] Add AST2500 and AST2600 JTAG device in DTS
Thread-Index: AdpTycGjGT5ZMGOAQi+KQEUwxl6cwA==
Date: Tue, 30 Jan 2024 23:32:48 +0000
Message-ID: <LV8PR11MB8463F88C2364A08DEF3ABAC28B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8463:EE_|IA0PR11MB7744:EE_
x-ms-office365-filtering-correlation-id: 81c12e89-1073-4bd7-09ab-08dc21ebc4e2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wTT8fctxKr2zW7uKj9PEZ61UgxdJpWK3OVJOQyiR4i+8xSp9azmHb6x59dDCHXekzZO5fLVFXXvqLqj6j43YWJKTyBDF1cRUdhVCTGYIfDLOfj9CC0U3Gzrtm5QVzmH9ovBlDsqc7pvW+rKb6n8mI434pqXSFAXXhQP3MXHZp5Kw92Eidof4IWvJea1+tdEFRuKyXskCdFnOgQzhLeY+nQGS9Te1IoYdfo0OvgCZmvG2bj4ftnIYoIl7TVztBueLQkgguE7q5xrCUwh2/Uh1I5kXjAZDXG2u3+/jrdSLXS6ZPQllhm45hki708qHxt4Y3GUgKfxZOn/c24G8qSW5EPA3eA1CNCRdRQ+IFj0Iy6/eeWxWIj1yEytiFtlf7igcr9Ur0vcT3yK+0qMIEf8xn+U6DtMt2u93vKjWa76dhbwk0LONrazPJrgi0bf1L0ozKRlrCN4wT9x6rtxoPbcdbbuW1CW/g2TjapD7t3T4zqcyWzg4ylH8Mal/E8d8oSp18a2ZVayKD2JyuRDouno/ECLX7dECQ8D6dM0D2gHSP9cV8OO/iNHcjHVYXILthIqcg/hraFfLcRyadOSUo6olm1YhSuIuXlB+dxZuVmlIcfrQQqrmwc6u+mnohMVKrJAD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8463.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(52536014)(478600001)(6506007)(7696005)(55016003)(9686003)(83380400001)(5660300002)(8676002)(8936002)(4326008)(71200400001)(66556008)(316002)(66476007)(54906003)(7416002)(86362001)(66446008)(66946007)(64756008)(76116006)(122000001)(110136005)(82960400001)(38100700002)(26005)(33656002)(38070700009)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eIkbvKcyCDRWV1qyO0jO1hbtbYa17kApCwIR2RwSnEXzbKLBlwtFmaIQsjKf?=
 =?us-ascii?Q?SEY5yfazyT5bPrqHi5ybDlIITUcUupG9mqwP9ef5a8m8FsA/L5loNaRPqvi2?=
 =?us-ascii?Q?DnPuy6lZWd0moW2+fcl5ujwEXO9y5Bm0L3Y4Cf9lx5WlSfteLNi7asJ9Cm2X?=
 =?us-ascii?Q?k6i089+WQEsujCwISFSdj2fXbzBy/CRN8QyuQfOiLIx1fbLmFSL4pzNnKdbU?=
 =?us-ascii?Q?9YzLSNe9RLvQaZadRn4VvuCBrPGX4rmLR9Vdzd1b38i7DaJAl3OsAND6MLeQ?=
 =?us-ascii?Q?vkJ6XT39VYQPwEeCRIqu4Vpi6L9k5imx8R5VIWCHU0eU2N/trRiJXb49ogKf?=
 =?us-ascii?Q?j2YvKzD2XFGvd5seg6bDHiQIIm0uosMkwHCtvrHZ72zgURowT2xkXg93Rsq5?=
 =?us-ascii?Q?nm0O3i/aUWRoEcDe+GWa4S+lvlUkbHvU4vvM6I7BSWsy0EAwcvT0Vh/jKH0t?=
 =?us-ascii?Q?njvgdYkR3Qy6Gpc2rCqB7Kqb/g/Adcf6u3gF7mRR0PwuBGYh+4EP2OQxYxiR?=
 =?us-ascii?Q?GwlevQir10rLE9JIigtLelMvfxbZBRZNwNLvkZW75bepyDnf8ZzThv1tN9Yq?=
 =?us-ascii?Q?5ybed7i+V0Oi/cqW0ABR/3VW5FUiVF5c4OUxai/6RNxC0qZm/UlQ7yVaS9rN?=
 =?us-ascii?Q?0gwEvsax8yA18Pi6iL+XIXOx+j15+yLXIS2CmNG2T59jO/PGDl08yCjm0ppH?=
 =?us-ascii?Q?2D8CV3EeiV3k9j9u7F+J6BhEdnoPlyEGCJQJT6PAbVJY346NJnu8VldNam/O?=
 =?us-ascii?Q?UAAJgdfa5yYjLDOKu+mMH+2pd7RrxH70wU7VlZxt5Zssf2rD+egyzyQEfWBv?=
 =?us-ascii?Q?0SoA18BIjrYVdxRI2HpImn7h9bx3zlhvyCOrwWoD/MuuvVwhIzaE6Is+Yruz?=
 =?us-ascii?Q?kFLvU7y5VghtxZDVcZAt/eT6nDacGqTQt8JEtrt+KzBY1W7PE9bF5QuQtm7H?=
 =?us-ascii?Q?X0xvPTEdvgFGeXpBCNrY64tZBA1e07D7/o5m93mJbgjhT5LXsXKMG3sQWml2?=
 =?us-ascii?Q?TB4IaMlB2bjdewOX+dySYrv47XL4z8iFSSiDS29f+cjfe7eNDFET4yuupEkP?=
 =?us-ascii?Q?BOi//rn0kyjnXHFdipHwXzjbPFAhU9J+n6gsdV4bM7MkhJspaSHnt+Wp88t/?=
 =?us-ascii?Q?oyKK1BGj6Bcg9E+PKQMkomO9iFd79Dsnubwn5Bqgr7A4DTzalFqPkA6RWXes?=
 =?us-ascii?Q?FpH1odcTtqE7g0JN84p5rXENyl5Q0YIp2r1bDTVEM/YUyE9YLhtYMY19GVBk?=
 =?us-ascii?Q?8hB2czeSH4sIy9ZsPFTRgAC/2HkbQPNdWtDRzPvmwDiPTedSCBErxKpIz117?=
 =?us-ascii?Q?PA8Ntwkx9QKqaicQ58pukDyvZwywUel5ZC+cNJdtmqbJDkgGT00Ujl3/VZq5?=
 =?us-ascii?Q?gwTgl9LrsSacCm6bit9KzD8JIQ+YMcc6xYSDp/Ej0wsiJ5+b4vEcgeEHDWpj?=
 =?us-ascii?Q?z76o0ztP6YbLlSeuXHhqpbT8XIFJmscRM8cG8bR5kegLWAFf9KOoJJA+MV7V?=
 =?us-ascii?Q?6MSMTMhcMBcGKfkEyb207XMnN0NCuEkpv10xMjIF9YigUiSyHRJ6tkqNfwfv?=
 =?us-ascii?Q?dgfXaZZdGJsoRwP3/FHgvcxxo4MKChEn+vTj9RbJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8463.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c12e89-1073-4bd7-09ab-08dc21ebc4e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 23:32:48.3567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XvGKuZe/1tQfUHdWlqsKzqPd5FStD5F2PxAWFCpuqtMkw/Od+18zzYKCl4BMwRLSlcm6YQiiNspRJ0m/1imej8/hr1gGJIuIhjATQVN4f4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
X-OriginatorOrg: intel.com
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: "'robh@kernel.org'" <robh@kernel.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>, "Castro, Omar Eduardo" <omar.eduardo.castro@intel.com>, "'nicolas.ferre@microchip.com'" <nicolas.ferre@microchip.com>, "'lukas.bulwahn@gmail.com'" <lukas.bulwahn@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "Corona, Ernesto" <ernesto.corona@intel.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'andriy.shevchenko@linux.intel.com'" <andriy.shevchenko@linux.intel.com>, "'davem@davemloft.net'" <davem@davemloft.net>, "Chen, Luke" <luke_chen@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Adding aspeed jtag device to device tree

Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
Signed-off-by: Omar Castro <omar.eduardo.castro@linux.intel.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Cc: Jiri Pirko <jiri@nvidia.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Steven Filary <steven.a.filary@intel.com>
Cc: Amithash Prasad <amithash@fb.com>
Cc: Patrick Williams <patrickw3@fb.com>
Cc: Luke Chen <luke_chen@aspeedtech.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi |  9 +++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/as=
peed/aspeed-g5.dtsi
index 04f98d1dbb97..3610aa758702 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -445,6 +445,15 @@ vuart: serial@1e787000 {
 				status =3D "disabled";
 			};
=20
+			jtag: jtag@1e6e4000 {
+				compatible =3D "aspeed,ast2500-jtag";
+				reg =3D <0x1e6e4000 0x1c>;
+				clocks =3D <&syscon ASPEED_CLK_APB>;
+				resets =3D <&syscon ASPEED_RESET_JTAG_MASTER>;
+				interrupts =3D <43>;
+				status =3D "disabled";
+			};
+
 			lpc: lpc@1e789000 {
 				compatible =3D "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
 				reg =3D <0x1e789000 0x1000>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/as=
peed/aspeed-g6.dtsi
index c4d1faade8be..d5353f728689 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -411,6 +411,26 @@ xdma: xdma@1e6e7000 {
 				status =3D "disabled";
 			};
=20
+			jtag0: jtag@1e6e4000 {
+				compatible =3D "aspeed,ast2600-jtag";
+				reg =3D <0x1e6e4000 0x40>;
+				clocks =3D <&syscon ASPEED_CLK_APB1>;
+				resets =3D <&syscon ASPEED_RESET_JTAG_MASTER>;
+				interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+				status =3D "disabled";
+			};
+
+			jtag1: jtag@1e6e4100 {
+				compatible =3D "aspeed,ast2600-jtag";
+				reg =3D <0x1e6e4100 0x40>;
+				clocks =3D <&syscon ASPEED_CLK_APB1>;
+				resets =3D <&syscon ASPEED_RESET_JTAG_MASTER2>;
+				interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names =3D "default";
+				pinctrl-0 =3D <&pinctrl_jtagm_default>;
+				status =3D "disabled";
+			};
+
 			adc0: adc@1e6e9000 {
 				compatible =3D "aspeed,ast2600-adc0";
 				reg =3D <0x1e6e9000 0x100>;
--=20
2.25.1
