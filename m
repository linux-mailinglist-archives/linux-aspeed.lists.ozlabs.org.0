Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B669E688DE9
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 04:26:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7LfP3kShz3f6B
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 14:26:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=PyknT/6J;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::71a; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2071a.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Lf600m7z3ch9
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Feb 2023 14:25:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyyqECNlH8jcCuiCVpoHdj6PdE9pZblYtKN/xDwgNas8Wl10PUl2f5+J1mzVL+Y65xH6+80YzjTSE462afttZhx6nzTEr9BEY4reuOGaVzxilFeuAQOPIrt34IB3MGZKM3hprxtm9Lp/7tktFlPiRM09eSDoWoUpKErTibRrtcJaXce2Erhrs3krGyl97VYrI/UH56AZ7QXoBnvfZQh7J9yo9d6hR/w31olZXY0NDqGi7xTqZog/4Tfh+9Ix49ve6Dumr8dpy7aZRfhr6GGUmqbCRf7MMKU2yIoJJWlz6AdjcFXAg2ANnMBBZ4PsMagK2n6PcZS0Pq/acXUIGxeM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN3jda9UtAUSPpxOxp7qtvHNx520NR20pavp5mySuDk=;
 b=VQQDN6iYYA//TCTNZ6phmtpGYuO3/mQIYlzGMhIQK7ECbhdcxLS0NC3PYISFNySh08cHMt7WSKi86lSSp85z6QHJ6wEvw2rLhLlSMzSnS+l7PZR4V7HLJGIMStc40T9O7Iwn64qHlfavj8p9SGpqgloZEg69ZOmGpbgO7qtjW+ps5GrN0SoPqN0gK93z3TaFa7R08i16R2Me2rbE+CFpkZm/VYpTkXwsQlO8NfAWK8sfCeEIjkMQzb0Dlp717b56csxssr8zAfWii+nLIsDppmpxTDNw0zfP+e+BuJyvDMLxgY4TCSLgOXuYQ9NNGo5aLdmAPharagoCJdh5DbCQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN3jda9UtAUSPpxOxp7qtvHNx520NR20pavp5mySuDk=;
 b=PyknT/6Jic3uhwSh5jGD8gElvnDtM0k8TuFcQC7ckLSUUlhCi8n2Tv5C42IZfs5VrI8End6jLBpvPTQnsbYDYaV2TIjiRcj6yn2VayPvdPOV9Yz46mcd0HUmpKY7CFwlKnHfGpzmJKYBuLCk07njmBmvNS5iIsWjEsTUsDSYPrbcxRfu6oef+KPJoIlfWeaFf0OESPHlH/CY5KRCQI8MlPgAl+fFd8FR71uQ3/3sJDI2FBR8QYw2DEIbfWlLZkKiDoz9fMyj0V9Wkta5MWNdhn85qa8yXB2t/qA5n+Xw4GzNGECF04WBNNUHeKZcZgnCSVm/o6a3CA0L0Yj6gw4bhQ==
Received: from SG2PR06MB3207.apcprd06.prod.outlook.com (2603:1096:4:6b::9) by
 SEYPR06MB5671.apcprd06.prod.outlook.com (2603:1096:101:bd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.8; Fri, 3 Feb 2023 03:25:24 +0000
Received: from SG2PR06MB3207.apcprd06.prod.outlook.com
 ([fe80::bfa0:771c:8258:c299]) by SG2PR06MB3207.apcprd06.prod.outlook.com
 ([fe80::bfa0:771c:8258:c299%4]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 03:25:24 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Dhananjay Phadke
	<dphadke@linux.microsoft.com>
Subject: RE: [PATCH v2 -next] crypto: aspeed: fix type warnings
Thread-Topic: [PATCH v2 -next] crypto: aspeed: fix type warnings
Thread-Index: AQHZNtSCfrVHr/nxikWgl/rP0lzNB668chqAgAAEc4CAABk4oA==
Date: Fri, 3 Feb 2023 03:25:24 +0000
Message-ID:  <SG2PR06MB32070328ACE15F44F32BCD3580D79@SG2PR06MB3207.apcprd06.prod.outlook.com>
References: <20230202070345.191514-1-neal_liu@aspeedtech.com>
 <e2dd4a02-12cb-de5e-4b64-9d6a4a1ad316@linux.microsoft.com>
 <Y9xowUpO+Y7M0hho@gondor.apana.org.au>
In-Reply-To: <Y9xowUpO+Y7M0hho@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3207:EE_|SEYPR06MB5671:EE_
x-ms-office365-filtering-correlation-id: 0c11c09a-0874-4c35-3d39-08db059649d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OA5Ui1YLc5aprfuhzBDf0Dzj17tADOdiRbT1etafnpebxnomKcjgT+PLs/cwaMCUordxnO6Fqo2Ea04Z9+c1yfejqOI/IYy1KdqIXKlw8dDVfwajKCnucTwLJlJRQKV0F9YJfY7w990/wrCFuomoxBgzmxVC2ya7r2geYdGZghiVaze6qGpfLbUJ8MRToEPW3tpEMheCS9djwB9RS6gaonk8FTI9PwDzW2Xw0jHZZLSi9ZKEyO0vjUW0ShzmJcIFGiXdy2v0iD0vfPINS75ELkryxf9f5D9VWFNE3dfhGHh+Ig0ceJ3JfqInpjmTi0gR41iWgK3YTlRlN2Y+sSRLuPnxh3dmhAlp4O9L6Yt148xx1gnY3gyQhVZYcA/648Cy3Btgh0F7uYNi8ZqYMqBMHu582i9n+QRT/F3SJSd8zcs+V5D9yK7GNp35IuwfwBG7o3dGrIX6nqQGeY31kqx4LoICl2Al/ZxcWXr/2gbJyJdsuU8a9N59H1sX6i0lES83wQNxmqrsVRVFbx8ldV7qn3QsySkzgSWwysKHaaDX2XmNGDMvwbHTBQuxjYw6AIelaYt+As7+f3Qc2UZkbNDw4/4kt4jjWIUt/OSwqLPw+Skck63DSMB4GLr7pzSG9WMd3BFArtNdzgNJMBPKEpYWTA4ORYtNK6UgImK/9aEwZjB/Sf0DYLyLTpTGsf2hTPvsDnPgLkmoBveLt728QDLmGQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3207.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39850400004)(346002)(366004)(396003)(451199018)(54906003)(110136005)(52536014)(8936002)(316002)(86362001)(478600001)(122000001)(6506007)(71200400001)(33656002)(7696005)(38100700002)(38070700005)(186003)(9686003)(5660300002)(26005)(55016003)(2906002)(83380400001)(66556008)(66476007)(66446008)(66946007)(64756008)(41300700001)(76116006)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?SjtEiFvYok46UZXVGIsp4Kl+qC8ZzxfG2jDtvDfIEM3LuwH2UwCamwR2kxuK?=
 =?us-ascii?Q?+4dX4E4RN4t+RM47DH8b/r0TWosdXW/B1g9ntvUSrpOB7x7MEIY1+Ywsuw76?=
 =?us-ascii?Q?V9TlUPYXSDMLI4P+yUbxs5l3XTVxXOHryyFKuPx4S+Tbvm2PK8z4sBeiA97b?=
 =?us-ascii?Q?0iorvZGrwcJ0vveUnp2jAK5xz/gGuK9to/U9VXNwbHpdhZcpFCxa/i86lJqH?=
 =?us-ascii?Q?S5NzCS7nHdHKCi6eC+n9JIokP03Wegls8XsW5a5NYvMxHmvKi/6MbZQfgEQR?=
 =?us-ascii?Q?VHhLsRLRs2kGEDo3B+1x7vV6WBLYiMkwAh37wPZb0ypBAIumEb+mn1ymBys5?=
 =?us-ascii?Q?00nLdsQSwNWN1ZbSUi+e7X9cJcdjfuVgRQDuHs8VUfOAV6lFvtZn+QEE7MHu?=
 =?us-ascii?Q?n5WXlJ+KmPrRi+TqvU76TyOjBz/tijV2Kd+i+ZH4hvuC08Mffwb2kS5+q+V3?=
 =?us-ascii?Q?C/5JtJydxIaxbhRqOA0d+VlLUR0HWA+sEvSFvA0mcymfdC/JWWRteDzFAyRD?=
 =?us-ascii?Q?Kfpw46zEdcfaMqFVypvF4cP1RsHVKqjzmgTsYMCDiieeFwXv9pt2l4ptR3eT?=
 =?us-ascii?Q?+2S6GAxSnkV5JGpSABdgab4oNbr5QbcEmBtywrZaXnGHJ1K+4EYSD0+L8IjI?=
 =?us-ascii?Q?MTc3AE9Updvz6ul/F8z/C9iYbsSbfK8OfYcILYqTr6EtySNaAg7/RLD1IVqX?=
 =?us-ascii?Q?jMQTdZ5mUUmz9zFIFTLp6pQTp8hC1qZsifgRrjH5o0FLAZmzh2dCzCzXqVYP?=
 =?us-ascii?Q?C0wQ4g0jbgKkzcbwpMQ23m+fDCDZ362CqeviB0bWduX/AeR7rEB3CNEh3uPi?=
 =?us-ascii?Q?RL6KVNdcn1ygphxJvw6a+/8hnBBYf3ANOtXRtpdQO4RJMOzkjS9nHtzC3Eog?=
 =?us-ascii?Q?ugeo2KINLwTJB03w29bzbHTPM0t/CnIIIjXEnePDlzXVM0Ik8bQB1uN66hw2?=
 =?us-ascii?Q?sQ3xjaKh8onlBlqYVyCEQxAK/vqprNT8TdDCFwbxzLXhiamf4+U40PAaiU3A?=
 =?us-ascii?Q?S9yNFuQ6/d4h1ujWWxiMXwYbTdHX3WFygpXwrjCfb89FBN6U0bXLt3BqmAZ2?=
 =?us-ascii?Q?FoVTxyvcqMb8yRQu0PccawquO8CbUMe0VUvKnKtuIuWC+U5WHqSQ7heLuQ3o?=
 =?us-ascii?Q?vLUFqYMPdxzmtLKnSC7C9QSm0ogUSn10yU/zv21gHP5vAu3btzGQK6Fl3Do9?=
 =?us-ascii?Q?ZbeT0BswgYud/nk6hxiEC8P+4nLwAs9JSi/7rDrt7hNMF0F7HfzXAuTSACj0?=
 =?us-ascii?Q?zUZqEe8sp4F46/TOCEYaNW6Hq4bBxM3Q1NiY2y5cBizcwbGU7k3MNRhouwFP?=
 =?us-ascii?Q?iUctw820qInYxf7gbt0DK8rWsqheZnDTskX0LSrJR4+2pWsp7GyyhIlJ8hdD?=
 =?us-ascii?Q?s30tOw2dd9qdFG81h8KKUu/+Pgx3i7tykP0EHEoBvvSZswn1QXmABviI9ORg?=
 =?us-ascii?Q?Z5rNtLw2OdV6KxFGO0Q6FQyyNJQUcZMyQzrFAkPTzlQpLoAwD1isBQfMqyKp?=
 =?us-ascii?Q?V5CGifJeTT0PtBbe7LFBA0awneEuXrNviC57aG+iHDkRxEKQoGJrsjwOSrnG?=
 =?us-ascii?Q?MMDSp4CRwUrUgzyuw0Hc/QE+EkL31L9z+R8vDQkF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3207.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c11c09a-0874-4c35-3d39-08db059649d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 03:25:24.4820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVUbBEFt2YyhYylldIHCLE+Tgr3Rp4pW5d2LWgQ0c+9sN9x5PVKNxA3Layx8ZpcRugLERWif+FVaWBCrG+nshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5671
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "David S
 . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > > diff --git a/drivers/crypto/aspeed/aspeed-acry.c
> > > b/drivers/crypto/aspeed/aspeed-acry.c
> > > index 164c524015f0..f2429e699d14 100644
> > > --- a/drivers/crypto/aspeed/aspeed-acry.c
> > > +++ b/drivers/crypto/aspeed/aspeed-acry.c
> > > @@ -252,7 +252,7 @@ static int aspeed_acry_rsa_ctx_copy(struct
> aspeed_acry_dev *acry_dev, void *buf,
> > >   				    enum aspeed_rsa_key_mode mode)
> > >   {
> > >   	const u8 *src =3D xbuf;
> > > -	u32 *dw_buf =3D (u32 *)buf;
> > > +	__le32 *dw_buf =3D (__le32 *)buf;
> >
> > All callers are passing acry_dev->buf_addr as buf, can just change
> > that type to __le32 * and deref here directly?
>=20
> As buf is already void *, the cast can simply be removed.

I'll just remove the cast. Thanks for your suggestion.

> >
> > >   	int nbits, ndw;
> > >   	int i, j, idx;
> > >   	u32 data =3D 0;
> > > @@ -302,7 +302,7 @@ static int aspeed_acry_rsa_ctx_copy(struct
> aspeed_acry_dev *acry_dev, void *buf,
> > >   static int aspeed_acry_rsa_transfer(struct aspeed_acry_dev *acry_de=
v)
> > >   {
> > >   	struct akcipher_request *req =3D acry_dev->req;
> > > -	u8 *sram_buffer =3D (u8 *)acry_dev->acry_sram;
> > > +	u8 __iomem *sram_buffer =3D (u8 __iomem *)acry_dev->acry_sram;
> >
> > u8 cast seems unnecessary, readb takes (void *) and using "+ data_idx"
> > offset below anyway.
>=20
> Either way a cast is unnecessary as (void __iomem *) converts to
> (u8 __iomem *) just fine.

I'll just remove the cast too.

-Neal
