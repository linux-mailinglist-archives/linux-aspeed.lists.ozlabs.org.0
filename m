Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332EE2EBBE9
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Jan 2021 10:55:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9l8c67YWzDqfG
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Jan 2021 20:54:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.118;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310118.outbound.protection.outlook.com [40.107.131.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9l8N3K7xzDqd3
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Jan 2021 20:54:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE0CSUkyeTgF1Cn0lDvhRKR1bquysq79MX93hcdUOlZffarMuMtVhoG0T/nlFe7zTq6sDi97tub5cdOOFVeWeSKmMI0DFvESIN+EVfgF7zCkQfwIwOXttUFxutAm8qrmuV18AbEa0z5RTa0f9AlmsjxbIv4/AfgJk99yMBqisoBP3Ccaf8TjRguGeGDJiWTu5RBlA4N62ZbfHcANGrtXWcsT92PIUEm6Au35fiyqyBFrYQOxXXt9aajV3BWg0IaasksoPPIcRvqROVjDkIUtT5PCXmrIEvLcDUYn28C4Sulc/gRi1DZ5s/oLxWwRYNtm5mek8r7dH5TO4RHjTAbAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiRP0cECQVCWJTWkJTbluaT+asK5PZ3X4TQUPYtvMjM=;
 b=XEJDyMbX4v5M+gArLXheLlwk+otZfSrqWlN6sBM+7K6civmFQnOZl9DkJL8zG32+yPpWySHdkVYsVQ+kW9JI3QQ/IAsAApMqnB/3BeDgsTgH9jj2q9gsEifiVok2QcmFD9PW6kGYBUtIDZh5qQfx5G0C9qw+mh3FjQfATGPsqKHpxqqff99/KdAeBaBbf8ObFhk9t2mEIceKMeOs/wgeDGuVUfl2naz7YPVmFbj5UqnyInWgkQrjBBptK41uOBq80UlIUFV4+DAGt6ebH9L3HWkEIFu8gsq6rP3R0EO/TCMdjIeEYTg21TyKXtlYbPjtVFZJPZlLWsAF73vx+aWkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2339.apcprd06.prod.outlook.com (2603:1096:203:4c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 09:54:30 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::116:1437:5d9a:16e9]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::116:1437:5d9a:16e9%6]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 09:54:30 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: John Wang <wangzhiqiang.bj@bytedance.com>, "xuxiaohan@bytedance.com"
 <xuxiaohan@bytedance.com>, "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>
Subject: RE: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
Thread-Topic: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
Thread-Index: AQHWzUMNmbahDDZWh0mpYVY7renfO6oaiJvQ
Date: Wed, 6 Jan 2021 09:54:30 +0000
Message-ID: <HK0PR06MB33807C054FCE9E355346E204F2D00@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08ec1f1e-921e-417d-81f4-08d8b2291021
x-ms-traffictypediagnostic: HK0PR06MB2339:
x-microsoft-antispam-prvs: <HK0PR06MB2339154829ED5C8A7F0DC87BF2D00@HK0PR06MB2339.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PFnsOGH00lg6aU4vYRXJJ/nJZ3fhU1FpV+BRh6zELVu1e7faFWe6tZ/QaEbtTxiD07shWnEKRCmsRccVoa8+X17RfyOwwXFPXyxdW8i0+R6kvaPMeqMZFqpMDRaVa2pO4Hk632qlgXteUU7brlqSqK34Zs6M1L01Prr18yWi3905mOPL95ihjVg3Q4Bu60VZJDH0sI/umu5/CNidWD3uuUimqluJu4cUUv3JQOB45SsEsjLivsn1LQ8kZgPOirRxdynZgplfcI8/5nlkS8thLiwurKlqETqI1Wde58mbAP9tDttYi3OkLzfo1elON7u+1McbnYq53Sth4oJL3XcaKQ2+/L924tJ8Qlj8Yyog9U67XbQ0530olajoJUaNj7G/Or14eLp093l1fz87Iaz9z0FHnVykKgG8ui2umkxGQwP63IftX7aCK20JcbuMgl4mjm7ulYU1o9Fx5vdYwp28Zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(376002)(396003)(136003)(346002)(33656002)(186003)(7696005)(110136005)(316002)(53546011)(76116006)(2906002)(55236004)(26005)(66946007)(54906003)(83380400001)(6506007)(966005)(8936002)(52536014)(478600001)(8676002)(71200400001)(4326008)(66476007)(55016002)(7416002)(66556008)(9686003)(66446008)(86362001)(64756008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?1jn03ALJDOVtFwa+Vhu1W9O19n7D3u2EAH+gy9aY9IrfPkFlbuZuxlcJvaPx?=
 =?us-ascii?Q?eyXLJvAyqeatZzQ9pd90m1dAflCxzusPsgVJYopb3xKVm9YdM+Yy/k9W609a?=
 =?us-ascii?Q?60eTNHiN7zJZIUZ7UnDt/c0h4EE+oNeBwKceAqHfHUghEJHbW7hGbUnNrvZv?=
 =?us-ascii?Q?iJV2rLWzfWVJ5qH4usB9eOEZY9R/H+N13KV8+uFiDvKAfuJ+yjzCnNEXsZ5C?=
 =?us-ascii?Q?LyYE1wscHeIhR7N6vi9fEFF4wQ9Z07g9Kvy+THdsDx+mKoTl13Lb5M0/pAAx?=
 =?us-ascii?Q?FWi9SIZ0yXpbFKFOVYXqekhnBxcy56L76vsq1NZ1ftRyiFhnQHg67gT5u8ST?=
 =?us-ascii?Q?QrYeJM/D6SCfweYzDQF/88XcKb8EhsaCiFJJk9CjDniYM0LwtT/6NuEomrIC?=
 =?us-ascii?Q?oN6CodTB1nSF+K7hBJ9hHfzJaDC3sp4/Jsy1fCtiAx4il0E8TImK0tmH46wl?=
 =?us-ascii?Q?xaC+lg5uo14F34pPlPb44SRO1eLhLxaTzDkKusTRdVI5u7S/weq3HP3t9fll?=
 =?us-ascii?Q?lpARPU139BqJDhReg7AkJ61O0ZSsDvumxJXKgE2cwdkaLu0yXDuSZWP9LE6j?=
 =?us-ascii?Q?5esJvw9hue/db/xZhFRM2w+IMOHous62bBgkkxRPKzWjTVUnd7g9vOHIpx5Y?=
 =?us-ascii?Q?LRWewT9Ily1mSzwDnI5x01OPFm2aHG65XfVHkXcfM0H9ib2XoI216VBvEle+?=
 =?us-ascii?Q?rU0TOudkF6Evp+LQ4ulMN0CgD1G5EQ3++XEAHgZpBwE9ZAEt6Ru1u4xTKKsk?=
 =?us-ascii?Q?9afxherRtewOoE687tMtpEv9U0YsMH5oPq4a0O8h2VpLGrKBg4guU9WzS1dE?=
 =?us-ascii?Q?J/sHZmtOhr+9yuwq1AGE20S3ucBvTFqcfOYG8IaM6GBp2lqWTdvcZb+5tnyN?=
 =?us-ascii?Q?9ABvSEj3Z6RcraJSQUiPwMWGEPyCWsGeWrQAvViGm643+bHx1d21cqRXULMn?=
 =?us-ascii?Q?WF2Nn8S+shVYhbdGJHi9YQweewxqxQfyQi8+dOygPyY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ec1f1e-921e-417d-81f4-08d8b2291021
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 09:54:30.5520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSFWATslxUJ0j33xUrpYlibdnug3yeiBB7eTUFoLlExANDq0VNi9wrJTw+f3X9tbPEHgO7GUzuglHST5shgfJciB+N2ptYRPIMvg937+RM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2339
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
Cc: Robert Lippert <rlippert@google.com>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Patrick Venture <venture@google.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello John, Joel, Jae,
	For this should be set LCLK to be CRITICAL it will fix LPC related driver.=
 (KCS/BT/SNOOP)
	I have send the patch before.=09
	https://patchwork.ozlabs.org/project/linux-aspeed/patch/20200928070108.140=
40-2-ryan_chen@aspeedtech.com/

Hello Joel,
	Will you consider this patch?=20
	Beside KCS/BT/SNOOP, UART1/UART2 will be most related issue for host side.=
=20


> -----Original Message-----
> From: Linux-aspeed
> <linux-aspeed-bounces+ryan_chen=3Daspeedtech.com@lists.ozlabs.org> On
> Behalf Of John Wang
> Sent: Tuesday, December 8, 2020 5:18 PM
> To: xuxiaohan@bytedance.com; yulei.sh@bytedance.com
> Cc: Robert Lippert <rlippert@google.com>; moderated list:ARM/ASPEED
> MACHINE SUPPORT <linux-aspeed@lists.ozlabs.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Vernon Mauery
> <vernon.mauery@linux.intel.com>; open list <linux-kernel@vger.kernel.org>=
;
> Jae Hyun Yoo <jae.hyun.yoo@intel.com>; Patrick Venture
> <venture@google.com>; moderated list:ARM/ASPEED MACHINE SUPPORT
> <linux-arm-kernel@lists.infradead.org>
> Subject: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC SNO=
OP
> driver
>=20
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
>=20
> If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC SNOOP blo=
ck
> will be enabled without heart beating of LCLK until lpc-ctrl enables the =
LCLK.
> This issue causes improper handling on host interrupts when the host send=
s
> interrupt in that time frame.
> Then kernel eventually forcibly disables the interrupt with dumping stack=
 and
> printing a 'nobody cared this irq' message out.
>=20
> To prevent this issue, all LPC sub-nodes should enable LCLK individually =
so this
> patch adds clock control logic into the LPC SNOOP driver.
>=20
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc
> chardev")
>=20
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> ---
> v2:
>   reword: Add fixes line
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 30 ++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 682ba0eb4eba..20acac6342ef 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -11,6 +11,7 @@
>   */
>=20
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/fs.h>
>  #include <linux/kfifo.h>
> @@ -67,6 +68,7 @@ struct aspeed_lpc_snoop_channel {  struct
> aspeed_lpc_snoop {
>  	struct regmap		*regmap;
>  	int			irq;
> +	struct clk		*clk;
>  	struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];  };
>=20
> @@ -282,22 +284,42 @@ static int aspeed_lpc_snoop_probe(struct
> platform_device *pdev)
>  		return -ENODEV;
>  	}
>=20
> +	lpc_snoop->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(lpc_snoop->clk)) {
> +		rc =3D PTR_ERR(lpc_snoop->clk);
> +		if (rc !=3D -EPROBE_DEFER)
> +			dev_err(dev, "couldn't get clock\n");
> +		return rc;
> +	}
> +	rc =3D clk_prepare_enable(lpc_snoop->clk);
> +	if (rc) {
> +		dev_err(dev, "couldn't enable clock\n");
> +		return rc;
> +	}
> +
>  	rc =3D aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
>  	if (rc)
> -		return rc;
> +		goto err;
>=20
>  	rc =3D aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
>  	if (rc)
> -		return rc;
> +		goto err;
>=20
>  	/* Configuration of 2nd snoop channel port is optional */
>  	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
>  				       1, &port) =3D=3D 0) {
>  		rc =3D aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
> -		if (rc)
> +		if (rc) {
>  			aspeed_lpc_disable_snoop(lpc_snoop, 0);
> +			goto err;
> +		}
>  	}
>=20
> +	return 0;
> +
> +err:
> +	clk_disable_unprepare(lpc_snoop->clk);
> +
>  	return rc;
>  }
>=20
> @@ -309,6 +331,8 @@ static int aspeed_lpc_snoop_remove(struct
> platform_device *pdev)
>  	aspeed_lpc_disable_snoop(lpc_snoop, 0);
>  	aspeed_lpc_disable_snoop(lpc_snoop, 1);
>=20
> +	clk_disable_unprepare(lpc_snoop->clk);
> +
>  	return 0;
>  }
>=20
> --
> 2.25.1

