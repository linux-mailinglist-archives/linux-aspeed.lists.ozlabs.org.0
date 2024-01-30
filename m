Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD5843137
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 00:27:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J78eJvU1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPhCX63wQz3bsQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 10:27:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J78eJvU1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=ernesto.corona@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 31 Jan 2024 10:27:13 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPhCP4fthz2yk6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 10:27:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706657234; x=1738193234;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=dj4fNdaV0B4LFRX8QPtapv3KH7ZixEn3y6fMsbr88+Y=;
  b=J78eJvU137xUPi0CInh/qFSSLcD6Ykb6zBMxyy3/eUYMgzIuOd860quW
   IQ9Ptf1CaSUMvXgUpjVDwmmMxQB+xJoTzabXjjpoT2zFNnVDDEcQ+sngt
   SRGpuV7StcWkElbY1QKjZr6TQUEjlePengW4VNAvNKNEAnynccQF3vPPM
   aTI+d3nWUNRMZbOYsYlJQKYCceOP3Kk2I2ym0AsgFS1mb/pJw/OyaTOXQ
   I8/1a+g5xHeb1rj3pIVaXdqWslxaYUdebK4qNVhfADIaANKStCqzSkguH
   HMaoOk2nc0oSS68V1WowfCHFatFTolp/rL963Nx2864cua8VumRbLHCKc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10099876"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10099876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 15:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="36668421"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 15:26:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 15:26:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 15:26:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 15:26:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsFkF6706StDli+Cvar5l5NCyLyqJ6ERw6+nf7SjYdujD1km6YV/q5DnVdAxhDtsX792ayUoiDNiHdm05xab0ucCSSCDIQL91VBwOtROUC6sFWk5u2cGpRyXZ5iKI4Q36Z7Si6WrqM7YkXf/dw0XNLKQ/flLwcg3oWRAh0PWtJvmcqOs/P1BS9MLbqVJMVqjY+lXXEt/rm6cnFBAd/AJd8rdnkBprhkkZHlWVkHbSUXrT/vBv3z6HT78/e0hmD8BJ9kx9T7yoPP1LJckxtZmAJFW2wZVqjwudV1f9FE67bzi2N2UHn92gxD9jiihNtVCp3nenz8TkChJ+oP7ZVe8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QinTtBJ/8i92wdRlPJssMXyQrpTuWh9NTJdYrlHN8Y8=;
 b=YEELYb49Cl5AWtWllnMGG1FoILCG/Rfga1TXmBKa9cYPnpiQt/JIXj+Vd3ekGQcIhqCftmz+20bwzQntgIYQh4kMiZ86wN38Pi6CfHUebdFn4Ym6WErrVTrcvf/67ZkxueJ5U9AFePhHH3Ylo29+LrTHCCpRvu/QwIv8q7N0gnWmiiOVHpOoBuoKAsfe3v21qcwgHlwFWDEEkIk1vHnJ65CbuaLnIRCLfLOoxYOXOSrtkjvH0vpAUK11ziTI3k0DaScJdDTJngRRT3HxRky58/6lfUwPNnqxMBR/NyHBKI7KfxJ/47rj4r3sjaPFOUI4QCByy33vS6sWB+9tvgcW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 23:25:58 +0000
Received: from LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9]) by LV8PR11MB8463.namprd11.prod.outlook.com
 ([fe80::5262:6eb1:2787:8cb9%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 23:25:58 +0000
From: "Corona, Ernesto" <ernesto.corona@intel.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 30 0/7] JTAG driver introduction
Thread-Topic: [PATCH 30 0/7] JTAG driver introduction
Thread-Index: AdpTu0p/12fIkUQFRlWDJlYXiVHqLg==
Date: Tue, 30 Jan 2024 23:25:58 +0000
Message-ID: <LV8PR11MB84630A9738C99952A0ABEC788B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8463:EE_|DM6PR11MB4689:EE_
x-ms-office365-filtering-correlation-id: a72d7e59-64e2-4c2a-ff66-08dc21ead09c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FcjQQHn0TX0WnGAA4g45sWnd2/PBh57qWRsvgy8n78LBVGgFHAwY8YN9t4XyowYrKvNb4k/AaWoKHej6cMe5wHh1zmbmxz/xaODDk3UqJTuSk2dFizKfeEr0KdBHwcydDydwYFPQwMLYntb8VSir2w8PMTOHYgvamXynvkMC4xbiaC4zykqU/oh3smWIOW2gcA/qqCu8dVd1R/b3eVk9T5M0xbrsndGqnvDqlfVfc1iHd7TuVwVV02fmj5Wn4wVvB8QDhRRQbp3asqMqkiyJRPGQ0oOkXJYR7cPyoUX5ocElC1NK/Vq1H1j0xawQBYIs8JuD2N5w4k7FyNzoQ+yaRgqqpe/j5wWnlFF+JAj2CRRHYXVdCVcmHHJS1w5DdbEEjZfkl2fCrwqExfRCKBwRSfJf8Fnsr/3l7VtLWxu3DJiQxhPXKF9CVb48peILTqsmFHdZ5gBo6I7OUWZHELqGiI6gyLlFfFvnzInQp8lwzYkBJjlxwcRyOtKJ3m87sqmItWqqJmqw50zNyGadJ23Su/VhqjCucnYqSIsz8I1O4x3Mrwf2RIAH1bzXZofLJFIeKUDmBTu5vLvv8ZIihjQ7Pmcg7rfB2erJiXZSfhEAIQWsuK/iipTXpXtQns9KLLOo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8463.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(55016003)(83380400001)(110136005)(66446008)(86362001)(33656002)(82960400001)(41300700001)(38070700009)(316002)(26005)(122000001)(38100700002)(9686003)(2906002)(6506007)(54906003)(64756008)(7696005)(478600001)(76116006)(71200400001)(66946007)(66556008)(5660300002)(66476007)(4326008)(8936002)(8676002)(52536014)(7416002)(7406005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bzHUmClJStTgu9KOfvUyr7xcJZod8cYEyFiZKeHVJ+Y1KZ6G2C/Pc0qTkT3G?=
 =?us-ascii?Q?lH1tehzEDHOs8thAl0KC1xhRIL0vI44t7fMbLtpFrEntLKcsh9qj+0LDB7fp?=
 =?us-ascii?Q?jSFPOPEXF+1cMa44hJNF452I2qcZt5v/5bZSJn98xRuPEnj+Sh7jaILKO4xa?=
 =?us-ascii?Q?k6COkXRP7oCY+zYJzw22hK0FsFcVDLnhJT8l4V/RtuNomr2ASerktseIsVid?=
 =?us-ascii?Q?ytDTqIqdsqYWkiTRnQBIvSxgheYdPvaekC3FfbpCWK8u5BLD1arleKOV5Atd?=
 =?us-ascii?Q?1HquLgUi4aoXjfWYzMjhDjlXMdizUlUtdJJF/mmw6N0DhxvGEa5WYYrszO+P?=
 =?us-ascii?Q?8tY6gWJxXDyfsq9QCCfmro810Q96kFgWOb97oVKD1voR5JMK0dqvsIUDCO0V?=
 =?us-ascii?Q?rnlZyTlJIruMQdiG1DpZQ8uNaETPl1uGBY8fP0DAmemCHDgiQ6BDHd1h5Bx8?=
 =?us-ascii?Q?RZhTgrn8wURLv3RlEU2BPT5Rq/uJroKaUudnnxcBAsUwklBBubsIjMTwCx5i?=
 =?us-ascii?Q?awcy0qKo0qvu422V/RVzMEWrfIYLP3PxdUXtH+kWP1SjGLi5l0hR3lEd+3kO?=
 =?us-ascii?Q?vsHaBDsWixpLdzLcGjQPXgEkKaOrrnR6/Irf0pgp9V7vJy8tnYkLsrxHOmNN?=
 =?us-ascii?Q?/h4L17RjB+QX6L2UDQRFSNsGTA0Z1bQ3uOlcKNzHTgoIfsctzI1iViaDrQOd?=
 =?us-ascii?Q?gAWaOdU9+UZgaxSU5RzZmRC+Z+YKkr0qHW2DXx6T8je7IMzDRuzHsP/Brypm?=
 =?us-ascii?Q?8c1rFpaG8jj4HPwGPtAHaz4uyl/ZqqNK8Pxo0AacBXTcsttaXgw3+CRVWvIW?=
 =?us-ascii?Q?m3D5OI0Wve/Q/u+tslufCYgCia9rvWLHjEpkQcNUIbFn4FYFIRHJZX+op2Ks?=
 =?us-ascii?Q?dMMxPQPgs6qMGiy58C3hptyIdxJuDHxkpy4D/dKH/H8TNV0AbilND7kZeeBl?=
 =?us-ascii?Q?Zldrmpd3w3sfJ68hYQoXKLDYHq4GmMzHKXwRQWWvxUTmb1+yvmbiz8VWs9Dq?=
 =?us-ascii?Q?pslTrVNF4PsnkSBK4yEaW8Q5UtvyrJ+OPIosQ4EKAtJ/Zeay7da0uSgVLlXS?=
 =?us-ascii?Q?d5m/ztgTn0pBKNPNM9LqWh3vmDCUjlfzuoTEJkuwPw40nTWsKIYQzgXyU+5C?=
 =?us-ascii?Q?Pldh+C8GeoxLfzC1jxdmcCuALf84w+BlJT8MLfGIogLCyo4zO03n/aZb8uBp?=
 =?us-ascii?Q?mabISHBLkeXbUsdGtaz15cx+QgRpG8JDsAHDyMVNNL74Cf/1OdmQWnPrcYgE?=
 =?us-ascii?Q?bKM4xCxLrmosjr70M+WoaE3XskiOt2ZNGhhD9gkSLFCsHpl5GUaEiNC2Rya9?=
 =?us-ascii?Q?RWkWiMRDLmz6e5H2Mqoj5D3iJjwwAXec0BY0D7cDam7hsa+vNit+WU1QteCU?=
 =?us-ascii?Q?gSytEOTreJduQnS4Sm5iXo/a8mbIlBuZEWb/SHTkaeh0w7X2YvP0UIQXfpQp?=
 =?us-ascii?Q?pN6y14jUOs3/CKbt0FojB/9zdhvtdI0p6wU/NkeRQ3hPHp1BI99/bFndbYFb?=
 =?us-ascii?Q?OOo27nhcJ/hhtvTsdqLhnywyS2PPG4H50APPIuUTAw9IGGE16o+wmZ6AAOVl?=
 =?us-ascii?Q?mxsiB0TgcdSRJEO3p7dz+fk2ogD5HN+vBsDCzJH6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8463.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72d7e59-64e2-4c2a-ff66-08dc21ead09c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 23:25:58.5717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3k39Yr708B9N22RYyiLs3iPnJB4ZIQ+TYKcRcDe6hsAdUqf7F+kpY09qXx2JOBs6wrAOaqQunWLWTLYrGIqTWXKXRoLrfiEC5ZU/OqFhmHQ=
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
Cc: "'viresh.kumar@linaro.org'" <viresh.kumar@linaro.org>, "'linus.walleij@linaro.org'" <linus.walleij@linaro.org>, "'palmer@sifive.com'" <palmer@sifive.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'christian.gromm@microchip.com'" <christian.gromm@microchip.com>, "Corona, Ernesto" <ernesto.corona@intel.com>, "'zzyiwei@google.com'" <zzyiwei@google.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "Filary, Steven A" <steven.a.filary@intel.com>, "'rubini@gnudd.com'" <rubini@gnudd.com>, "Chen, Luke" <luke_chen@aspeedtech.com>, "'keescook@chromium.org'" <keescook@chromium.org>, "'arnd@arndb.de'" <arnd@arndb.de>, "'johan@kernel.org'" <johan@kernel.org>, "'vilhelm.gray@gmail.com'" <vilhelm.gray@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'Jonathan.Cameron@huawei.com'" <Jonathan.Cameron@huawei.com>, "'mika.westerberg@linux.intel.com'" <mika.westerberg@linux.intel.com>, "'axboe@kernel.dk'" <axboe@kernel.dk>, "Luck, Tony" <tony.luck@intel.com
 >, "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>, "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>, "'rdunlap@infradead.org'" <rdunlap@infradead.org>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'pombredanne@nexb.com'" <pombredanne@nexb.com>, "Castro,
 Omar Eduardo" <omar.eduardo.castro@intel.com>, "'federico.vaga@cern.ch'" <federico.vaga@cern.ch>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

When a need raise up to use JTAG interface for system's devices programming=
 or CPU debugging, usually the user layer application implements jtag proto=
col by bit-bang or using a proprietary connection to vendor hardware.
This method can be slow and not generic.
=20
We propose to implement general JTAG interface and infrastructure to commun=
icate with user layer application. In such way, we can have the standard JT=
AG interface core part and separation from specific HW implementation.
This allow new capability to debug the CPU or program system's device via B=
MC without additional devices nor cost.=20

This patch purpose is to add JTAG master core infrastructure by defining ne=
w JTAG class and provide generic JTAG interface to allow hardware specific =
drivers to connect this interface.
This will enable all JTAG drivers to use the common interface part and will=
 have separate for hardware implementation.

The JTAG (Joint Test Action Group) core driver provides minimal generic JTA=
G interface, which can be used by hardware specific JTAG master controllers=
. By providing common interface for the JTAG controllers, user space device=
 programing is hardware independent.
=20
Modern SoC which in use for embedded system' equipped with internal JTAG ma=
ster interface.
This interface is used for programming and debugging system's hardware comp=
onents, like CPLD, FPGA, CPU, voltage and industrial controllers.
Firmware for such devices can be upgraded through JTAG interface during Run=
time. The JTAG standard support for multiple devices programming, is in cas=
e their lines are daisy-chained together.

For example, systems which equipped with host CPU, BMC SoC or/and number of=
 programmable devices are capable to connect a pin and select system compon=
ents dynamically for programming and debugging, This is using by the BMC wh=
ich is equipped with internal SoC master controller.
For example:

BMC JTAG master --> pin selected to CPLDs chain for programming (filed upgr=
ade, production)=20
BMC JTAG master --> pin selected to voltage monitors for programming (field=
 upgrade, production)=20
BMC JTAG master --> pin selected to host CPU (on-site debugging and develop=
ers debugging)

For example, we can have application in user space which using calls to JTA=
G driver executes CPLD programming directly from SVF file
=20
The JTAG standard (IEEE 1149.1) defines the next connector pins:
- TDI (Test Data In);
- TDO (Test Data Out);
- TCK (Test Clock);
- TMS (Test Mode Select);
- TRST (Test Reset) (Optional);

The SoC equipped with JTAG master controller, performs device programming o=
n command or vector level. For example a file in a standard SVF (Serial Vec=
tor Format) that contains boundary scan vectors, can be used by sending eac=
h vector to the JTAG interface and the JTAG controller will execute the pro=
gramming.

Initial version provides the system calls set for:
- SIR (Scan Instruction Register, IEEE 1149.1 Instruction Register scan);
- SDR (Scan Data Register, IEEE 1149.1 Data Register scan);
- RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified number=
 of clocks.

SoC which are not equipped with JTAG master interface, can be built on top =
of JTAG core driver infrastructure, by applying bit-banging of TDI, TDO, TC=
K and TMS pins within the hardware specific driver.

Testing
These drivers are in use for the At-scale-debug solution mostly in the serv=
er space. We have been using AST2500 and AST2600 from Aspeed for over 4 yea=
rs, so this are working drivers.

Ernesto Corona (7):
  Add JTAG core driver
  Add binding for Aspeed SOC
  Add Aspeed SOC 24xx, 25xx and 26xx JTAG support
  Add ABI documentation
  Add JTAG core driver ioctl number
  Add JTAG core driver Maintainers
  Add AST2500 and AST2600 JTAG device in DTS

 Documentation/ABI/testing/jtag-dev            |   23 +
 .../devicetree/bindings/jtag/aspeed-jtag.yaml |   85 +
 Documentation/jtag/index.rst                  |   18 +
 Documentation/jtag/jtag-summary.rst           |   49 +
 Documentation/jtag/jtagdev.rst                |  222 +++
 .../userspace-api/ioctl/ioctl-number.rst      |    2 +
 MAINTAINERS                                   |   13 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |    9 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   20 +
 drivers/Kconfig                               |    2 +
 drivers/Makefile                              |    1 +
 drivers/jtag/Kconfig                          |   46 +
 drivers/jtag/Makefile                         |    2 +
 drivers/jtag/jtag-aspeed.c                    | 1666 +++++++++++++++++
 drivers/jtag/jtag.c                           |  387 ++++
 include/linux/jtag.h                          |   49 +
 include/uapi/linux/jtag.h                     |  378 ++++
 17 files changed, 2972 insertions(+)
 create mode 100644 Documentation/ABI/testing/jtag-dev
 create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml
 create mode 100644 Documentation/jtag/index.rst
 create mode 100644 Documentation/jtag/jtag-summary.rst
 create mode 100644 Documentation/jtag/jtagdev.rst
 create mode 100644 drivers/jtag/Kconfig
 create mode 100644 drivers/jtag/Makefile
 create mode 100644 drivers/jtag/jtag-aspeed.c
 create mode 100644 drivers/jtag/jtag.c
 create mode 100644 include/linux/jtag.h
 create mode 100644 include/uapi/linux/jtag.h

--=20
2.25.1
