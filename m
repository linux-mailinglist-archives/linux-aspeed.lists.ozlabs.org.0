Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE486A058A
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 11:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMpWs0QLKz3cMx
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 21:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bbqDUdng;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::72c; helo=outbound.mail.protection.outlook.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from outbound.mail.protection.outlook.com (mail-sgaapc01on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMpWT1Lxmz3bhD
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 21:03:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr1PIhZuiHUwf81z3tPgmpO9HCYc+Wfgaf3AAbz5HgUSYvnz0VXGr4MijGAral/iWe5TW/RwCYrlBiY67fYU6uAw4Ce/tpbREayWczHMP30MJpooKF1DBKidIqATNgiDW1s/bJoTMHXPpJwtjlyhs2LYZ3Ek2Yr38wXHkVmbbR2yBiHhKbzQzvSPA0nXLLFh+4mRGKXxOWcjwb5TJCPgbr8/LsQs1dwVFqQ/zW8rjZ1qcc2bJu2VcEBokVlJpFY7xKVsFWqOlYHwCl43JAc7MEUO5vnTwa0kdKHc/CdKvfF/LJUlf9VCf1YoMXMwOpSzfQqKxnUvQaMAou2EHy7Vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xePivo76slhm/FHC2mOz0J0KWwc2sAolOSNfueFmTx8=;
 b=ahfX9Qb0X5UnOqL1ZY0ohtGjVMIzaCnZpDqbcVE4fKO0tCD26BgEDeljlkwhwxpdrCTKoihjwS/aNL7EPB3XUiVGPUPJLgO+Ya5QXyzTivbDGcluYHrxO3yBCzseKLRUz3uukcXbVmHyrLIpDwRQd9fUaRrSsgcYlK1HuN94so9qlQOI+RYq1nX6PWzOOnRQqb3C9aproyYYP10q76islY8Az4uqV9/Spc5deF0ck6O3XiDIex8GDFJGeAx+2dUNtkhFahkkivRIOPgPSMtNz77mF4LZD5You08sQZZbzC2KOY5Wk/EUxCh8j6YOziZvTrbp7XVaMsFUcRFpEhDzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xePivo76slhm/FHC2mOz0J0KWwc2sAolOSNfueFmTx8=;
 b=bbqDUdng8UXDjM2Kzais0QiOCwtCqhE+h2JfB75QbXrxVG0I+e8ZRjs0iUkNxrmKDiS3+FJJUiN8wOTe2YxFuwMtmVeuUn7K1s+jbA0ExVuThSODVG/6Bl8pK1edBZlRb9fK0qb5U2W80CfMTqGrBiut4vSYqVNvF/PVyDr+78IOPPuwF7Z2yFd2mJ/2g0vwdUZjdRHd8jOTLdj1nuE/tWU/7mM+iTt6bQ6DNZT+k2o/HlIDMaYBzJs7RfSARpUmzGU2zD5RkbZ6g6MKWLU1wYaZr249to2XlfjoKLRfFi3bqUnNCDxvLOINBhVkp0Yc1XM5PX8zlC/RwvdW+f3UGA==
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com (2603:1096:404:97::16)
 by PUZPR06MB6145.apcprd06.prod.outlook.com (2603:1096:301:11a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.13; Thu, 23 Feb
 2023 10:03:07 +0000
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::b113:70f9:7dc9:543f]) by TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::b113:70f9:7dc9:543f%5]) with mapi id 15.20.6134.017; Thu, 23 Feb 2023
 10:03:07 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: RE: [PATCH] crypto: aspeed: add error handling if
 dmam_alloc_coherent() failed
Thread-Topic: [PATCH] crypto: aspeed: add error handling if
 dmam_alloc_coherent() failed
Thread-Index: AQHZR2UEmwUd7xLHKkqpcsYXnTB2vK7cRKwAgAAIfEA=
Date: Thu, 23 Feb 2023 10:03:07 +0000
Message-ID:  <TY2PR06MB321384F7F9A2539E1F6231F880AB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
References: <20230223085830.605202-1-neal_liu@aspeedtech.com>
 <Y/cypg7zsGcs+szk@gondor.apana.org.au>
In-Reply-To: <Y/cypg7zsGcs+szk@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR06MB3213:EE_|PUZPR06MB6145:EE_
x-ms-office365-filtering-correlation-id: fadc823e-d694-4210-9d8f-08db15852991
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VGAM8m3FGmcwio8UXGzXHbICw/8aYdfFsljl7WiA7c+Xl5hbzXpB5mslRpJP9ao9O5/CSWV0QJKAjhwTJsWVy8n0RzoEl+0o+A3zU1+Chnst2jj5fJVFjDFl3np6YBtvozBzuwqJxHfo/nv0aQcIF8xzPtDdQq+/P8juQ+Z+gD1HGKjlIbo2VFnk/6GS1AMchgIUt8u+KnPQ7HWsLVnpZi5tPniIwmuOYaLfdO7tJAlbGD/1rasX4fm4plTx90b1ZhV1zdRTdlSmHqckJcXA1KYczxZpxFLw0ZpH0ztzm1eMfR3+EayUL932ETywCCh6c3OLr+cTQC5k/M+/KCC4IWoICmIWm1Tz2+UdRNQV/lin1pOFoXVipNraQIgkDP4y83yvfHYc0uE9BB8LE/vsODGs0u8/ybUQcXH0YC6l1DhiA3p7G5ZOukuvJqO/pyeK+1aEe+Q1M+yVWK6kd6mvv8U9mdPRNE17jmcbz0nEEpSvscV72fA3f6tWLrSDAOPmnJkzFfpxd+bKgIia0LsCUll1/3LBlPc+Qye+SrEgGa3vfoz3tQCn3Gm1yEL9BM+Kg//cAZW/wGgQ4YX1wJCgroBw+dBT+J8tpyoqoCdwUeqsQbM+EDn1DvS+RtG3M63bk4F5QpJGn8jLBrn75JPq5MVeFkYxERgqUeIz1Yv/v2FqXWTp50AXJLvw7VjYeugyWc8+uP+r3XlCGdbaNCstEA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR06MB3213.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(136003)(39850400004)(366004)(451199018)(71200400001)(186003)(6506007)(7696005)(83380400001)(9686003)(316002)(66946007)(76116006)(8936002)(52536014)(122000001)(5660300002)(66446008)(66556008)(4326008)(41300700001)(64756008)(66476007)(8676002)(2906002)(38100700002)(6916009)(55016003)(38070700005)(86362001)(478600001)(54906003)(26005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?OB8lMe7euk/Uo0Hk+nfs+FOgvlNfntr32G4XaompbUf8n2O8FOOBrZAnv4az?=
 =?us-ascii?Q?iW+L2YS97a9j2rjwbz7tdNqB5cWjInSZJ21mPuvSdQ9rpbfxA15gvrYL2sOT?=
 =?us-ascii?Q?SrKLluXBvZZ6fjL4vDeTu/fIIemtZyf46+EITL/CXhW3Igfn+gCv60cxjXlZ?=
 =?us-ascii?Q?AYG8Ga6mMfxZ+yYCSXHGT4JNrwaRUrmUs+0hcOgfryIlgY3EBq+tBCifrY3T?=
 =?us-ascii?Q?H5e8tWw37rmn1xI1PTMaQSmZnK+7+jAl7HUsokY8k4a17JxysowvBNQ5HWHN?=
 =?us-ascii?Q?xXTZvf2lG1iRkXRDBsp1BqsvnIG32F9yPjvf/4uTc9iAl2HQGdiKU0ApQSd9?=
 =?us-ascii?Q?RJfhH/ykMpdZ16pLLgExwH23qhuv+gdPXxFRYqfo0rqm2RZyvc+TUhPceme/?=
 =?us-ascii?Q?fNYggeSB3mxHz7eQfYXkblaruxwv7bXDI/QeEgmNClnxQ9fRSO8mbALyd8QY?=
 =?us-ascii?Q?xyHch5nIIzCP9c9ClzMFTU5XAEPAfqbf1H0t1c/ukm/lYPfyC/ju4X2rZsrB?=
 =?us-ascii?Q?U1Xm5YcqPdShf83dV4oaoHUh/OKdGn7tlvCHu4iPtX5bvLQ14cqG7/5yEi3a?=
 =?us-ascii?Q?U3F8QrwjwqKIjsElCnGKE0eXW44gmxxYM/+mlEwBPMFUWjdOcp7ThfT8PraS?=
 =?us-ascii?Q?0ao9u89PwjusKxIPG/k6eC771lXRZzILXxeOBXqy8SIaFrnTMEnTtvrdUqRN?=
 =?us-ascii?Q?9Yv7NTA1ST4tJLzGRrG6H6o2OJ87peQ4nmCTnmZ0QRSASPQLkRJAkNP8U+1W?=
 =?us-ascii?Q?cSYFUMWJE3ypdnNZNC/O8l8f5yjKCnDWGDOUWj0dQYf9OLXwxJMRZdhS/ZRi?=
 =?us-ascii?Q?8y8gQgW6zDB9mTWicN7n9tvyeyYe27isKBMK4CXd6lc/Ts7dxImlbZHkGjDe?=
 =?us-ascii?Q?wMTSYDN+aZ64+YOmZ/5p2h26PBw/xNahGzHO59zAy7FDSt4WB4vzEltGnOFC?=
 =?us-ascii?Q?Du8/GYD6BoyqiyXs1TNO6kTZ+P4xS7R852ZEsTt8VGey7wHkEV1lCXqgPcKR?=
 =?us-ascii?Q?7++KhyonoSY2KtM9jQjdiHbIXNvSGfxzXZj74cblD/Sr1cIb9FdLFgk+bUnX?=
 =?us-ascii?Q?jM0N0mC1vSOIld56CZM+dGofoAzfcla6zVeQ5vHI6PjjUqE+Y7SwMNA+f0Ua?=
 =?us-ascii?Q?zHgjz/KmhX2ZP6hq48uAbWqrGdCOCaaPPznmx13aYRZQEntz1LNIF06YSvkx?=
 =?us-ascii?Q?ugi1BqhgKze8nXxAXlmwJXm5advKsWmIBuYyomvthJ6j9iOWYTkeDcowNsfe?=
 =?us-ascii?Q?SEz1vdNHNIVRp+C2eGZbv1FbaGlYjzuiyQluewK86A1aWOrwuu92HkQKADV9?=
 =?us-ascii?Q?sRIpDltnAFl7hAACmPH3pWLcgwlQGZRXjWqg01F1/YtTWb8mmQPNe5eBB6xA?=
 =?us-ascii?Q?W4j8tWT6n8YJE4XWStqoAppZ28cJQRDhVl3pN3XVz4OU3f2ZXBx9NPZ7B3A3?=
 =?us-ascii?Q?5yYL/HKVKsi06I3JzokZh5Q8JjhZR9ChwhkVCn7XpEC/xFII9FMsnOzcKksl?=
 =?us-ascii?Q?LjxSAWNQPkjnajG7je02+I58M8CPBaiL2a5yLy6grEKVfQj+WbjVBat3aZPb?=
 =?us-ascii?Q?5RDfDcGOs14Qn39UGKV0kTJpmZTrRpDIDaZv+BD/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3213.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadc823e-d694-4210-9d8f-08db15852991
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 10:03:07.4831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJH1pYF9I3JV/3jks5ZOie61+yyyj3RUbgJewNwUXXMOsUZMxZ/dF8MA3myCUNFOsOt2T1yMc5btkbQ0OgikOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6145
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S
 . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> On Thu, Feb 23, 2023 at 04:58:30PM +0800, Neal Liu wrote:
> > Since the acry_dev->buf_addr may be NULL, add error handling to
> > prevent any additional access to avoid potential issues.
> >
> > Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> > ---
> >  drivers/crypto/aspeed/aspeed-acry.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/crypto/aspeed/aspeed-acry.c
> > b/drivers/crypto/aspeed/aspeed-acry.c
> > index 1f77ebd73489..85733e418c9e 100644
> > --- a/drivers/crypto/aspeed/aspeed-acry.c
> > +++ b/drivers/crypto/aspeed/aspeed-acry.c
> > @@ -782,6 +782,11 @@ static int aspeed_acry_probe(struct
> platform_device *pdev)
> >  	acry_dev->buf_addr =3D dmam_alloc_coherent(dev,
> ASPEED_ACRY_BUFF_SIZE,
> >  						 &acry_dev->buf_dma_addr,
> >  						 GFP_KERNEL);
> > +	if (!acry_dev->buf_addr) {
> > +		rc =3D -ENOMEM;
> > +		goto err_engine_rsa_start;
> > +	}
> > +
> >  	memzero_explicit(acry_dev->buf_addr, ASPEED_ACRY_BUFF_SIZE);
>=20
> Please remove this memzero in a follow-up patch as dmam_alloc_coherent
> returns memory that's already zeroed.
>=20
> Thanks,

Okay, thanks for the information.
