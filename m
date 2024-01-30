Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2A843143
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:30:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ObC2pRyI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhH93MGzz3bYQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:30:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ObC2pRyI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ernesto.corona@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhH24NtNz2xSl
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:30:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706657423; x=1738193423;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8FYwn+ls3LFEZcsKi6QlcxyIbvofsEtoRXGIAfoRnSI=;
  b=ObC2pRyIpT9Zgns4ekQHD9Z7YShleOKIM7TSd4b52ikkG7PJwtsmqRaV
   qO9Lr8SNrGAOwuyPALTaqsczLl59JZHiYvsLU1nKiJE5ChRba/naldFtq
   3Ws+HwOVG6As4UhLQWm1FrwmDmhvlkwzAriz/kCY38bElHX4NjJ4d1wlZ
   31p6ZJyXOfOLlK8ZAE1S2lEWv3V3xC8MKAJM5dLjb2iU+/JQUqGfFpoNX
   7XKZ0JxSPfH/mxl4LJEhw4Lc1S4EcMx9j7WdrAeYCZZk5wMkYNCGLWzPK
   iFzhXrcS+d+2j7zvalvwe+iIdoVIAFehdyjcMQ3lxoVVElAHEFLpJBwf7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="24911822"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="24911822"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 15:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822362925"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="822362925"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 15:30:17 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 15:30:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 15:30:16 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 15:30:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ircuCRnVE8BoHDPLxcqgq9RrHELyWGB+lAQo7uameymEQ0pEGMY4P5ln3Epd1KpkkGmOMyaHvRdtIZuzOybF6uRdCBjmRh5Tg/z9jbZzCS4h9tMcmiHRHJkbWiqPkMtHOI2PdWPrmzzoZSZVnTD300SEv4VFN8MoEP5RiE+4BIqyt7C6HTrNLG6WvN/IEg8C+i7t8PqXlTSGc98qQjLCemdFcmOIdFOzapvbQ+OvxL++2hHp+iWDu0rQ7DHLN5Oe7FVrosco/6jhcLzALX8NzQBObVTVd3njaaqLs6XVVTx1FGr5kgrTznLM2j3PwUjbXzNy2pJoqa8gAo6d9WObIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF2Y7T45+1BJ4VqWk3TubnuFU67oYyG1E6H4v8hbiT4=;
 b=Ocbc4hlNWT1xTPas86ZCjiDXB+6vUo9LU49ha3ZMuWei7LUZcMpnhhtwCOOATMPF2LEsw4aU6U66e+Y8pkhJNDjKrlVqZbQ4FXVPw5O6zE3oPgrRbcfxGvd7Cp+oHR21Hn8kV9nehQrAz+pDhBiXfZo1v64uuZzKtlLSD8wPpPTpM/BgouJcymgy2QrqFMJ2v3r57caFdg0v/luDGC2nL1yxUPH4vYJ0DCiGKpiUwimKRMopbwthjSLe9zFvZB262uz9sgvzIOAN157aGDtU1806GlK0tHC5RZqbGWXypQE/dibb0jP4pxeMNGv61G+iR4b83pW2BT3v1hAGfd4/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 23:30:11 +0000
Received: from LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9]) by LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 23:30:11 +0000
From: "Corona, Ernesto" <ernesto.corona@intel.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 30 2/7] Add binding for Aspeed SOC
Thread-Topic: [PATCH 30 2/7] Add binding for Aspeed SOC
Thread-Index: AdpTw29UtVObMhC6QWmxwGxV5pgt5w==
Date: Tue, 30 Jan 2024 23:30:10 +0000
Message-ID: <LV8PR11MB8463D0017B82135324127DB98B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8463:EE_|DM6PR11MB4689:EE_
x-ms-office365-filtering-correlation-id: d74d4a86-6fd3-4830-44af-08dc21eb670c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lt1PnEWxEQvmV4Ov52mX3QyA2vlJUsor8G/sJpq20sbTHuTVHkvDEsqORRCNfZ1EKDaw+cSokqRiw9evy2MhIjmGP9Xyx7zK8JkF71zcrEVEN1UYG0PVt+2NyPUHLuMSz4+fXC0adqq/2moB8kObkN8ZMvc+jztbWYlZoathajYvm8/q3dD7Nxsyw4tI6i2EsFiqahtGuNStwKS4aDSnwIHiUbZtohPUKjQFybWqXOZKrFPstkBQ+shIt05Z70dmOp/ddQY5vHkKwYv+Tlnk6kJtSXVQG+gvAOkHhbBFufHuR2sxZqk7kUmvS0tzDe6grZtByFMLqMuMNGIDIhDrdtweHk19JDB0lKLL5ThXVvP9OgoIqvB/+O1lCoppnfQWvCBhlhvFvO8h/E+wqcYOTo3yjTSI2G04Pskj+Qlkb04DyZjdb2MeNX3Q6m4/tA1JABeCg+4vrqzsRc4FK+ASmEV5SEnZomNjW59jf67sM+7NXWX/i4/J2xO2G/8FgU+yzbiRoVoh5v8l9iPf/mFakouv5BnNbCVhpOSzUjpyIlnyPmNzkRbCaduPjgJhJEF7YwaIl9iS1lxr97j+XMBPuURR1CdqHKrz0d6KPS76sG+pMTE9zeQMOrKvBaFxU8Gzk6p/cqCqHooxOBlVzt+ylg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8463.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(9686003)(38100700002)(26005)(122000001)(8676002)(52536014)(8936002)(4326008)(7416002)(478600001)(966005)(76116006)(7696005)(64756008)(54906003)(6506007)(2906002)(5660300002)(66556008)(66476007)(71200400001)(66946007)(66446008)(110136005)(41300700001)(316002)(38070700009)(82960400001)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?htai/8S237CHOfPL4ebGysCe/OM2DMiXoibPtOM02/PT5HVKU5otiLfEJCVV?=
 =?us-ascii?Q?bRddXZnuLlfwy183Qa4IwihKioIsaVlkw6IG7Ve/PpO9V7X6h36H0kd3hh3P?=
 =?us-ascii?Q?kxuu52EqrzFEE8TThDS7a91irDsVttfESh3/aP1tb0lolViflBqxe/D9Uv1T?=
 =?us-ascii?Q?bozdQwZZxkPXPNmDEgw7Je/oI4rCTeIzj6u++FqIgSnlHvBq2wEy+kiH7UDc?=
 =?us-ascii?Q?bIqCFuCVIL8wPKvWhBxnaIG7cLOaK38oSI6MWPTIPC+xiB21ENrie+8mtaA0?=
 =?us-ascii?Q?3Rm9Fjf5cxhKFXcejCNK8Yp7d48phr+jr3NLYXZaCBcZZdRSejKJayPFbQNq?=
 =?us-ascii?Q?5gjwbh4lO/A/N18gQHzAYJUdgZsGseHROnRqcapXnVtqHxuprxo4XdEsHDxs?=
 =?us-ascii?Q?569rUVaBgZxQfjiFYJLvM8GCm7SHmSmI0/vMQ0mjaCS8seluX4e7kpWuute0?=
 =?us-ascii?Q?AeBKV1RhAwCQbOBo6w1BKrHeHH6rwUjuxco0t9nwi/4IF8YxYKTlxUVegbNL?=
 =?us-ascii?Q?XushY4fsyqM9jih8ADzfmdf1dVPR0RbP4QtiG9JIHbEXe/GZTLuIw3g/F34g?=
 =?us-ascii?Q?ZzqqIhfB5x8p3qBI1kkDvB1jxxgEUn6FdbYPI+s6Cd5LvODi8Uzvl9MXzikZ?=
 =?us-ascii?Q?ZsdYLkHqVGHUkrsVr80XgKca8TtizxPuBoq1FIP+FO01HoJ2zuanL959wnI+?=
 =?us-ascii?Q?j6WNKEr3CoHdBq2bO/uPbuzh5JgvXMGKWpL4/eSAbOl9iH0FsK3U2tk6cv/u?=
 =?us-ascii?Q?ypz9rzXtj92K9qnLxSs3tVLQnJpsDLvyMRDFrU9mXuJoY/h7bZssFJC+jCfr?=
 =?us-ascii?Q?UX+HH+U1tZ4DjrNYMLRRzBqev9L3y8M+A6WlCjHmJaQ+OQZsOb92kOKovhKJ?=
 =?us-ascii?Q?81LJ6eaP60BlURVar78d/IAvRf1NP6t832reX1YsHtRaakCvg0UqwEfDzjHA?=
 =?us-ascii?Q?S6cILDmZgeZ7/bCZczEkPcyo/pZtXtEhZD++GzJgrrV5mmfkEABPuqe2D7tp?=
 =?us-ascii?Q?7+cZZt/JjLDADeHc/TgdhQHqwtBVmT7Wgkui8nDXlJfqmNWlfUxWka/xpoKq?=
 =?us-ascii?Q?K61vJZeBkKqH8mWYlqdK5O4+n6kykl4Op7wreB4wbsOLbEUvAfvT5Ns5oQVE?=
 =?us-ascii?Q?GJyESsQ9vVACQd8LXezeqeB2U35SuvNNtNngVZxVm3V/BXr5if7Ix9Qh3LH6?=
 =?us-ascii?Q?8o9RCoSZ526G7yGIPbiukUNjC/LVQE/xnk5if4bT0Jmr4kSf+hSwqMNMW4sQ?=
 =?us-ascii?Q?FLO0DwTkvFqDRCNH1Uw1ReU3KPfPwlj8i+2UioU1P0kuKJrvf3ElEbigyIzR?=
 =?us-ascii?Q?hzCxjRdIEhXm77hKgy+RF+amqrc9PO+KWRYOWnxss1L6ZpLpIqjYwf2xqcQh?=
 =?us-ascii?Q?y6UsnCF4azXXiwxdVMYTt4kZzifXnY+WYZGD9W0l7lt8LmkQRwg1m50m00xB?=
 =?us-ascii?Q?9Qeon3053QC4w0QkE7xMS92BfEo/KbuHXL7Mh4Ol3sLlKAjgZh1B3xNLQ2Ib?=
 =?us-ascii?Q?hp71WShg6lnmY7ERiQd2cYyE5065VAAkSI0+k02AzIHE3oqwdM6AbYeI26Sa?=
 =?us-ascii?Q?sv0QxJ3oSbWmmGtIjzxCybSkhWLRf/ZFb/XbdxU2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8463.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74d4a86-6fd3-4830-44af-08dc21eb670c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 23:30:10.9407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1K9tgPDNg+tqxIsjUHt6hvEVqxecx11lh1H7GLtlYORK7wzpoLTemI0mwiK0AgEggwMZVoZoRpBW7IQLD+ZlYY/oHNQy36AtTWe4TpRqFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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
Cc: "'mark.rutland@arm.com'" <mark.rutland@arm.com>, "'alexandre.belloni@bootlin.com'" <alexandre.belloni@bootlin.com>, "'ebiggers@google.com'" <ebiggers@google.com>, "Filary, Steven A" <steven.a.filary@intel.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "'robh@kernel.org'" <robh@kernel.org>, "Corona, Ernesto" <ernesto.corona@intel.com>, "'corbet@lwn.net'" <corbet@lwn.net>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "Chen, Luke" <luke_chen@aspeedtech.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'tytso@mit.edu'" <tytso@mit.edu>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "Castro,
 Omar Eduardo" <omar.eduardo.castro@intel.com>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Aspeed AST2400, AST2500 and AST2600 JTAG controller driver.

Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
Signed-off-by: Omar Castro <omar.eduardo.castro@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Steven Filary <steven.a.filary@intel.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>
Cc: Amithash Prasad <amithash@fb.com>
Cc: Patrick Williams <patrickw3@fb.com>
Cc: Luke Chen <luke_chen@aspeedtech.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Rgrs <rgrs@protonmail.com>
---
v29->v30
Comments pointed by Steven Filary <steven.a.filary@intel.com>
- Add Suport for 26xx series

v28->v29
Comments pointed by Ernesto Corona <ernesto.corona@intel.com>
- Change documentation to the new dt-bindings yaml format.

v27->v28
v26->v27
v25->v26
v24->v25
v23->v24
v22->v23
v21->v22
v20->v21
v19->v20
v18->v19

v17->v18
v16->v17
v15->v16
Comments pointed by Joel Stanley <joel.stan@gmail.com>
- change clocks =3D <&clk_apb> to proper clocks =3D <&syscon ASPEED_CLK_APB=
>
- add reset descriptions in bindings file

v14->v15
v13->v14
v12->v13
v11->v12
v10->v11
v9->v10
v8->v9
v7->v8
Comments pointed by pointed by Joel Stanley <joel.stan@gmail.com>
- Change compatible string to ast2400 and ast2000

V6->v7
Comments pointed by Tobias Klauser <tklauser@distanz.ch>
 - Fix spell "Doccumentation" -> "Documentation"

v5->v6
Comments pointed by Tobias Klauser <tklauser@distanz.ch>
- Small nit: s/documentation/Documentation/

v4->v5

V3->v4
Comments pointed by Rob Herring <robh@kernel.org>
- delete unnecessary "status" and "reg-shift" descriptions in
  bindings file

v2->v3
Comments pointed by Rob Herring <robh@kernel.org>
- split Aspeed jtag driver and binding to separate patches
- delete unnecessary "status" and "reg-shift" descriptions in
  bindings file
---
 .../devicetree/bindings/jtag/aspeed-jtag.yaml | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml

diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml b/Docu=
mentation/devicetree/bindings/jtag/aspeed-jtag.yaml
new file mode 100644
index 000000000000..1a412e83b81b
--- /dev/null
+++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/jtag/aspeed-jtag.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed JTAG driver for ast2400, ast2500 and ast2600 SoC
+
+description:
+  Driver adds support of Aspeed 24/25/2600 series SOC JTAG controller.
+  Driver implements the following jtag ops
+    freq_get
+    freq_set
+    status_get
+    status_set
+    xfer
+    mode_set
+    bitbang
+    enable
+    disable
+
+  It has been tested on Mellanox system with BMC equipped with
+  Aspeed 2520 SoC for programming CPLD devices.
+
+  It has also been tested on Intel system using Aspeed 25xx SoC
+  for JTAG communication.
+
+  Tested on Intel system using Aspeed 26xx SoC for JTAG communication.
+
+maintainers:
+  - Oleksandr Shamray <oleksandrs@mellanox.com>
+  - Jiri Pirko <jiri@nvidia.com>
+  - Ernesto Corona<ernesto.corona@intel.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - aspeed,ast2400-jtag
+              - aspeed,ast2500-jtag
+              - aspeed,ast2600-jtag
+
+
+  reg:
+    items:
+      - description: JTAG Master controller register range
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+      jtag: jtag@1e6e4000 {
+          compatible =3D "aspeed,ast2500-jtag";
+          reg =3D <0x1e6e4000 0x1c>;
+          clocks =3D <&syscon ASPEED_CLK_APB>;
+          resets =3D <&syscon ASPEED_RESET_JTAG_MASTER>;
+          interrupts =3D <43>;
+      };
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+      jtag1: jtag@1e6e4100 {
+          compatible =3D "aspeed,ast2600-jtag";
+          reg =3D <0x1e6e4100 0x40>;
+          clocks =3D <&syscon ASPEED_CLK_APB1>;
+          resets =3D <&syscon ASPEED_RESET_JTAG_MASTER2>;
+          interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+      };
+
+...
--=20
2.25.1
