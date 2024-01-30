Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41058843150
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:32:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NuXnFwJV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhKv0td8z3c4M
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:32:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NuXnFwJV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ernesto.corona@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhKj4zj7z2ykC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:32:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706657562; x=1738193562;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=UhS3cY1awZ0CJvtNfsU5ZICkNgXJjNDZLajrb8KmI/0=;
  b=NuXnFwJVnbRLtpt21/J+7doLJqiGmnCS2++iVWUutpRNuTooNNP31pV4
   YIrgH9O3SYr6XhzZh+gONuzpoAQm2mJCoM9QXrHVh/XTl+NlozhZ6ucUD
   dSuCL5DC1LhVV9zCo5QzA5wPBQ3tKWQ7hdVdayFhd7wwyXkzv8PT4wY9f
   aPwn0AtdZjLHifY94PDjhfX+gJ6ilzOWnzyRmHdhiSZabsmm+j1s0rhGg
   KPsH1VQ53/3LNls1wCrLxXJAsWoLr8RoiK4K/KzHT1bO7NmHgrGq9mbNH
   CcL5W0U1smACdySdvAQg0D1sqJ38x9vbCAVHz9PinDocC09q+/SVuFiHf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="24912693"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208,217";a="24912693"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 15:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="737916847"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208,217";a="737916847"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 15:32:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 15:32:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 15:32:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 15:32:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 15:32:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea3o97ptq/l2ck18d0xZ7wk+4cOn1c1WBFaQsrM9v8YIqfA9dvGdnaTdU75ZzmL9XcMrbhcReI9LJtX1RolHXg1+i3rbQ12m07tgY3JJytP3G1JIIQCxg0CXHH0rBldGzBSUXUj63qjhma6QdYNxHsh5zA3Og2pkXylnBJB6brrKeKCQsrVoN3/vxPH+vNfrqba0IZoxatxe0Rej068sY5NhdOdCYjslVAbGKQlvF2UVbc2/5fIYvRzLAwZp2bwIgkt155XNou39ZeIo6ZkO720iQTQNFEVg9KXbyFzcxNnkyS0VhNgh/C05zG38H7JrKFvZddrmjIYSWZlQ+LKweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap65SARrv0Q6du0nry2e3mjKbVRbASxMAAX/aEI5m74=;
 b=hmLUAvN8wgtuLVwzLnVyqL/+u4mWQRHxD/K/lzWoCaTJGSRNsoRkTrttn/wEtTBOl8c3GQNlUAnPYVbg6TZySTS3nEAkOFHuSUPqEcHlF1odIuQGjK3M7TxWC8FE1CHz1EZuAK/Ydi0uZ+cWNz8FT5uTl+EvjRQuSznNAGj+F2ATTY4nS+aR3I7h+7tN3YO6zhJwk/rlNsam5B631MeSrN/YsxJv6JkdUEw7JSyF86WF3zYE4kheseT9ltICKZo6xE51fF8GVhNls3jh6hBNvffxiIyLGFQAlgnLNT7a2FqFl2LaMaJn1LAOrC+FANRasAjkHLYzQThWbV/DSd/X4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 23:32:34 +0000
Received: from LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9]) by LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 23:32:33 +0000
From: "Corona, Ernesto" <ernesto.corona@intel.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 30 6/7] Add JTAG core driver Maintainers
Thread-Topic: [PATCH 30 6/7] Add JTAG core driver Maintainers
Thread-Index: AdpTyS1M5fNOTll1QZOTXrS6GzGn4w==
Date: Tue, 30 Jan 2024 23:32:33 +0000
Message-ID: <LV8PR11MB846312B6C1F23325DACDF3778B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8463:EE_|IA0PR11MB7744:EE_
x-ms-office365-filtering-correlation-id: 8c7805a9-9718-4d44-d1fe-08dc21ebbc0d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kIXTKFXcpObevSHBz4ONlYMkR7Af7HkBRV5tZiKQk4MxlO0XtXAqDc4AHiH+q3/8X+jD7OcWdhZLR79B7X2uegbPcETjjtRASr0FtprIMDfagidMErUs4vERzInBr53fBAhZdQ8O9QS/TZdJxSf2MPwBzbXw8e0LYtV0sWKb04avkETVyH/CVf0n5c9ilVyfuFEBpxzYJ7ZYwqQ5tRiVqNlRPq/7w1YwO8KcvQ1a9mcl+1qThKQBBW6+81ERxeNbXshi68Jlhsbu2q/DCZ3o1a498qKLHewwpw26/JvhYLsMujD+EEr1gA7Rs6HTInhucVRhn7F8yqyyLo/A8rgVmbN8Q/uaSFTc7IpxYPvX0PzfrMeLtaHyWWvk7UqLY/zR4HxY6OQ4sOpTnXVE5jAh1r6FiUDFpwGXQqJJjpKI1Qc6ZyTf2ZKsH+D/5gjn994EkyHqXalqQsEzEkx7GJq7yrIsn1HiL5RvcjT1xssAkYKEMTdW7sjx2g3qa914X5SZt4tSbz70lffFJ/lU8rKLQWwdgkabA2UJ3rwfF4kmijzGN6aQudXiPJvzkN4g4akLM1vg0CXNwBqj8csDQGsA1YUWLwSYcBuB14nutu25OBH7q6gsruNsjwCEYnY95GvkfSAzijroqydQnmotrwDMohL9uUpl/kMEi07z1+Ex57w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8463.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(52536014)(478600001)(6506007)(7696005)(55016003)(9686003)(5660300002)(8676002)(8936002)(4326008)(71200400001)(66556008)(316002)(66476007)(54906003)(7416002)(86362001)(66446008)(66946007)(64756008)(76116006)(122000001)(110136005)(82960400001)(38100700002)(26005)(33656002)(38070700009)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O/sUo6gohJ63uWqfbO+Mf+l2g98XUpSi4p2f22KpMwnkj4VSBzhyaQJafQhE?=
 =?us-ascii?Q?xkGGjF44+2k/74i+BDfqU+5V3JZJlV283hQKm+UaD4lapZs654wuvYWv6Iyc?=
 =?us-ascii?Q?BeHxlhTDr4NIPOEqipmAl3KDRg5Lw8qQ2kIXgnEeixq41y+eniC1qf7tVYCp?=
 =?us-ascii?Q?JIRlJxjAGG/376Zf44QH0sVQNOMrp52xUdo3PwIccM34i5iGgbVjzNkvfIIt?=
 =?us-ascii?Q?Psa8vEyRtmlZXipL/Rcb+yntXTwGMtvmt0u4ddrJgLbMipIW6ntHcNV2VFy4?=
 =?us-ascii?Q?IvPTPx0pjOQBFj9eD2OfdUub81NyCcUYJbPdt3yKQnwQkiwJoyO2o6vEj3FM?=
 =?us-ascii?Q?utfD/asB+pD5e63kG54YmAI351sSsLavVfJf3LzscWVDdo/hdKqyGkh76r0c?=
 =?us-ascii?Q?D1fr0yByQ8AyN0RYTjHnuh/pddlOInbB8/WsHZKJn73GxKfgg2yqv8JsB6hi?=
 =?us-ascii?Q?+qLSWxpfp4uln9LHxmd1bCbRD6or8XHSizbF2hwhKPEEdFqAx15B0IQ9uRKj?=
 =?us-ascii?Q?X9zUId5bQLprrySLZEzKKMMAJ49DHQInO8bQxTqnyZUowNA+ajjdrx86TKpU?=
 =?us-ascii?Q?lB0d04xGrMpo2Gbqr6Ja5td6nshZHeCEibjnIK0elfGEHTM8KyLpX5w2wXUB?=
 =?us-ascii?Q?LuNwFWx+m9+1iQMgpZyMzoFh9eXMcxUEL60Q+PSPNYy9SFJw8fiRcmPfeTKu?=
 =?us-ascii?Q?vnjzqPWQRtVr3RDeE//mWXt0boXUdDe58sAHjjVOdOCUmDLvVpEPzPtL6qYT?=
 =?us-ascii?Q?8Wpg3D1DQIg/3zGrk3DaAaOdY6V11weuMh7bcG5unSM2zU0iBSohElHY2GX3?=
 =?us-ascii?Q?m1+WZbRzOR2hyojRXUfhjRLj0D2qRpVcNwx7gPVySTqZbe7tsjiD00BUkuRR?=
 =?us-ascii?Q?EFcWeFz5Ap8d848fTcn/B6tf5Kgy8Z4KYnLUwFrcXfJhW1eQQ8tEBH1AhMlQ?=
 =?us-ascii?Q?98qAQ7aSil05o9ah63gKeFiJMev/kjWblHaOA6c3Mb+J2zSssG97tYywwMdT?=
 =?us-ascii?Q?NgTcw7TJGnNclg3J0q+awKCGAL2ZCyN0rlPS1qC8t+9QLwXLKG0eSPPU8BB0?=
 =?us-ascii?Q?RRfiSV4oS7udJZM/slmpIHcqN7gR3N5yt4ys0JbMFHE7d8U+h5XYUxfJByaC?=
 =?us-ascii?Q?xjZsy4xLQXRAwD1qydcenJSPG4eVIMIjXUsiOV4gvouqJC2Noqv1syMKCvxl?=
 =?us-ascii?Q?l1oqu2c4hiDe764ujd8X0qmF5aZ4iLhykOhtwfe7qD9SRJk+Xs06rNUv+Xuk?=
 =?us-ascii?Q?z8wWOaKbCE1+gKrmzfUEdUIE2Xo85cnFzvxB5T4ozR+46Jomu4yDG8QEr8Y6?=
 =?us-ascii?Q?g3jWRzhW/f6oiCpFzP7aMsPTBijnosPaIZGW+YqcyyBX+YJciCxQWLrJ2X7c?=
 =?us-ascii?Q?Afq2VPTcZc+Ib5SC2eDm2k9rFIOhC0wLJ5NqWChvXgjXaih6uil5L42fhoUD?=
 =?us-ascii?Q?3AqQmrLLYnfmmhup11RDeyYqtGkoX5c5XwNCIXCJiBT1hypKte0vofwGY9oc?=
 =?us-ascii?Q?A05aGwdJV15kYW+4ftgS3z6KTpa2+Bqoa2GVyqm3LN+Kx5KAx15HPi+GNxya?=
 =?us-ascii?Q?P/ZY5mlnGsotvVwJjPErwcMnT3kHfgD/ElJgpsw7?=
Content-Type: multipart/alternative;
	boundary="_000_LV8PR11MB846312B6C1F23325DACDF3778B7D2LV8PR11MB8463namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8463.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7805a9-9718-4d44-d1fe-08dc21ebbc0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 23:32:33.5543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eanyutohgj2HAtem6SzSAz+zRDRmlJ/KBD3iQ0O88HXhdEPDSOsOOac3pmuXHTNm9EfB8cDcD6U0I07P5w2vVvwirkZJ3HEbsD9OShnNlxg=
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
Cc: "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'robh@kernel.org'" <robh@kernel.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>, "'nicolas.ferre@microchip.com'" <nicolas.ferre@microchip.com>, "'lukas.bulwahn@gmail.com'" <lukas.bulwahn@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "Corona, Ernesto" <ernesto.corona@intel.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'andriy.shevchenko@linux.intel.com'" <andriy.shevchenko@linux.intel.com>, "'davem@davemloft.net'" <davem@davemloft.net>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "Chen, Luke" <luke_chen@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_LV8PR11MB846312B6C1F23325DACDF3778B7D2LV8PR11MB8463namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

JTAG class driver provide infrastructure to support hardware/software JTAG =
platform drivers. It provide user layer API interface for flashing and debu=
gging external devices which equipped with JTAG interface using standard tr=
ansactions.

Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
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
Cc: Rgrs <rgrs@protonmail.com>
---
MAINTAINERS | 13 +++++++++++++
1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a69..764732f1fe19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11532,6 +11532,19 @@ L:                linux-serial@vger.kernel.org
S:           Orphan
F:           drivers/tty/serial/jsm/
+JTAG SUBSYSTEM
+M:        Oleksandr Shamray <oleksandrs@mellanox.com>
+M:        Vadim Pasternak <vadimp@mellanox.com>
+M         Ernesto Corona <ernesto.corona@intel.com>
+M:        Omar Castro <omar.eduardo.castro@linux.intel.com>
+M:        Jiri Pirko <jiri@nvidia.com>
+S:          Maintained
+F:          Documentation/ABI/testing/jtag-dev
+F:          Documentation/devicetree/bindings/jtag/
+F:          drivers/jtag/
+F:          include/linux/jtag.h
+F:          include/uapi/linux/jtag.h
+
K10TEMP HARDWARE MONITORING DRIVER
M:         Clemens Ladisch <clemens@ladisch.de>
L:            linux-hwmon@vger.kernel.org
--
2.25.1

--_000_LV8PR11MB846312B6C1F23325DACDF3778B7D2LV8PR11MB8463namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">JTAG class driver provide infrastructure to support =
hardware/software JTAG platform drivers. It provide user layer API interfac=
e for flashing and debugging external devices which equipped with JTAG inte=
rface using standard transactions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Oleksandr Shamray &lt;oleksandrs@mell=
anox.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Ernesto Corona &lt;ernesto.corona@int=
el.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Omar Castro &lt;omar.eduardo.castro@l=
inux.intel.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Acked-by: Arnd Bergmann &lt;arnd@arndb.de&gt;<o:p></=
o:p></p>
<p class=3D"MsoNormal">Cc: Jiri Pirko &lt;jiri@nvidia.com&gt;<o:p></o:p></p=
>
<p class=3D"MsoNormal">Cc: Vadim Pasternak &lt;vadimp@mellanox.com&gt;<o:p>=
</o:p></p>
<p class=3D"MsoNormal">Cc: Mauro Carvalho Chehab &lt;mchehab+samsung@kernel=
.org&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Cc: Greg Kroah-Hartman &lt;gregkh@linuxfoundation.or=
g&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Cc: David S. Miller &lt;davem@davemloft.net&gt;<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">Cc: Nicolas Ferre &lt;nicolas.f=
erre@microchip.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal">Cc: Rob Herring &lt;robh@kernel.org&gt;<o:p></o:p></=
p>
<p class=3D"MsoNormal">Cc: Andy Shevchenko &lt;andriy.shevchenko@linux.inte=
l.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Cc: Lukas Bulwahn &lt;lukas.bulwahn@gmail.com&gt;<o:=
p></o:p></p>
<p class=3D"MsoNormal">Cc: Steven Filary &lt;steven.a.filary@intel.com&gt;<=
o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">Cc: Amithash Prasad &lt;amithas=
h@fb.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal">Cc: Patrick Williams &lt;patrickw3@fb.com&gt;<o:p></=
o:p></p>
<p class=3D"MsoNormal">Cc: Luke Chen &lt;luke_chen@aspeedtech.com&gt;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">Cc: Billy Tsai &lt;billy_tsai@aspeedtech.com&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Cc: Rgrs &lt;rgrs@protonmail.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">MAINTAINERS | 13 +++++++++++++<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 13 insertions(+)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/MAINTAINERS b/MAINTAINERS<o:p></o:p></p=
>
<p class=3D"MsoNormal">index 8d1052fa6a69..764732f1fe19 100644<o:p></o:p></=
p>
<p class=3D"MsoNormal">--- a/MAINTAINERS<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/MAINTAINERS<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -11532,6 +11532,19 @@ L:&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux-ser=
ial@vger.kernel.org<o:p></o:p></p>
<p class=3D"MsoNormal">S:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; Orphan<o:p></o:p></p>
<p class=3D"MsoNormal">F:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drivers/tty/serial/jsm/<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">+JTAG SUBSYSTEM<o:p></o:p></p>
<p class=3D"MsoNormal">+M:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Oleksa=
ndr Shamray &lt;oleksandrs@mellanox.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">+M:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vadim =
Pasternak &lt;vadimp@mellanox.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Ernesto Corona &lt;ernesto.corona@intel.com&gt;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+M:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Omar Castro &lt;omar.eduardo.castro@linux.intel.com&gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+M:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Jiri Pirko &lt;jiri@nvidia.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+S:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Maintained<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+F:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Documentation/ABI/testing/jtag-dev<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+F:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Documentation/devicetree/bindings/jtag/<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"ES-MX">+F:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; drivers/jtag/<o:p></o:p></span></p>
<p class=3D"MsoNormal">+F:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; include/linux/jtag.h<o:p></o:p></p>
<p class=3D"MsoNormal">+F:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; include/uapi/linux/jtag.h<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">K10TEMP HARDWARE MONITORING DRIVER<o:p></o:p></p>
<p class=3D"MsoNormal">M:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C=
lemens Ladisch &lt;clemens@ladisch.de&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">L:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; linux-hwmon@vger.kernel.org<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
</div>
</body>
</html>

--_000_LV8PR11MB846312B6C1F23325DACDF3778B7D2LV8PR11MB8463namp_--
