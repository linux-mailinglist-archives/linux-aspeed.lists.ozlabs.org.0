Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F1557007
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 03:42:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT30J6TJxz3bsP
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 11:42:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NGpUL947;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.107; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NGpUL947;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2107.outbound.protection.outlook.com [40.107.255.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT3076dFfz3bkG
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 11:42:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buJ3KpIM2BE0+hxuDTFNFOlKcn5rP+3O5rDtbZ8Xn2XvMIJSlCvDfs2AiVLDdUlDrqfgztG10JqSNcGGdIzHrTaGz07Ns2yDv2NZINouNf4iYZSWa2dsZyRlwqhKYbzszbI9o54gFTPSsVni1Shbhs95qWCanWc5c6VdxbJbspssox1C6rpA33eMsTKfp4PJ4Dc+zLu9g+MONsk1lx4fLtRlahP4PNTeLvud1ZFG1GKQKyxSKxs2KN0XTli4NZ930nnNgjgERcV3JYiCi2TkzD6OhI7LkieKrNmhqc23Y14PwGx8OtGKnfIbbeExqerLFMNmC6vGDgt89lhL6lVlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LujPSXQZaWq4bzgbg5wJCklKM6h4hdHoLJRuUdI8UHs=;
 b=Ph3pEuIqKdqPgLiankLcU2SARXyEhngmGvjRj08Dt2c8HV+O3PQFP8JYaE0KvlokCNmISHddfIDMSDBa6ZAnvhhDvBzN70N6uQOIGSfq6Jb8nuU0zyI1F0F8MPv1YNQrRLqbP4dY2OiNjaEIbEYjbzTzO/QJYAcDM9ETAZ2dKwjGeSPMiLmTJtigdFq5aybRfeNcpjz/qoLKvJKtXTboTTXvqtXQiK63IhSK0pv+igpJUPKXCZEC222B+mVMctO1K/QPJ/+/5Dkg/mI7wSwbYaC1wLqBu/ku/cqjwObVKafcyPC9osf8UW7XSlLVktb4PecpSPNNyGPcdKnaJ/4/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LujPSXQZaWq4bzgbg5wJCklKM6h4hdHoLJRuUdI8UHs=;
 b=NGpUL947H0Q+6EKNkpJr6P2Rt9Q9ir/1s1NiJqkfNajQqmFFJ6OMSOtFdX2dEVzAGTDswgNvK+PknHocLKRhw634ka5YKq5Sl0z8e9o0DIadRlVnyfHLhyH+fvuovAC3NNmb7UnOLEd0LcIscl5jfDmE6ItxS1LuK2nGcwkwICL+IL5ZHaK9msFG7gLSLtWCGFEM+wgq06FBlXSiVIBlgQ3jnIGG8f8bRHGMrJGpAg2PYKrQcrhZ68TijQceoAk6zYTsAaG+4lgjGlvNhvlNEt9dM7PUF7S/HjRdCbm6QnezBLd9k1ofNlveCCLyZiGvqDG+HQwiIsYN9qmm7TID4g==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SG2PR06MB3790.apcprd06.prod.outlook.com (2603:1096:4:d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.20; Thu, 23 Jun
 2022 01:41:50 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 01:41:50 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index: AQHYhkeMr7IZN0wRcEahtwSU6oJwdq1cN3kA
Date: Thu, 23 Jun 2022 01:41:49 +0000
Message-ID:  <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
In-Reply-To: <YrMsU9HvdBm5YrRH@kili>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4f9dcd0-dcca-45c4-624f-08da54b98ac2
x-ms-traffictypediagnostic: SG2PR06MB3790:EE_
x-microsoft-antispam-prvs:  <SG2PR06MB3790C23F89A206B3DC35F1E380B59@SG2PR06MB3790.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0L5WRyNToplFY7kWscZMnTnSGQDo2Jh680Oa1kxnrtPUKalQcUGAwDCmPMJB/S5jUwU1IQJ6iNGkZSCR3k5JBTeVcPxMevUWA6445u2niR1zZSr6DoIzGoNwWo9AnO/jLygAraTZHJ4kuR5GJX82KHVg7FjOPsiQ4S/Ql6KM1YTDpIJNqyJ9lJ3+qDiVNk3dkCaJcjC+vyYEWRIRDjDpNHqNekoOvwJCMYEDQQYtJPbf8RnS1kzlkhEjMrYcT+zi1GBpl2rjGIjAYn7HhxoUBtbFPkfz5SQGhmW01FktSarhAxSqn6uEt4jcxwRiodyyOw0v5PjQRcFB3wVN95WM9U2QM8dGvjYvOcOQuXT2oQf0BMrxi8j7EHfMzoYHVDgMkRt415KhB/7wqOfR37ZoyaD/1u8mtSr7NIW7PhG/caArGKrKXboQe3TliQsmyfuh3WQymhLDbVj5jp52hsL3DaSoJYmZrKvQFQWDpzYDKHCs1UyxlFQ0jx8MT5FxJ6DXOoW2ocREVD13gYQKI+iPC7rStID2r6x7Nb1stR+pEOnqRmLEhnb4egmWqxi9wtjec9dKiraphNY+cr0AD5Pzw7M3BIk6fmULuWB4raR8dXkP07qtiLjh0LjM/sED55xSoNCclvgRXeifWkZvSGhZ88pp+Ec6S0AVAgg0IPboVAttrDMmEO5Px24bUXMqSw615U+nuboPbVWedjhPPbyBnyZXIY8XdgraEY3AtmhSPgKJUDK1SDTZt8sXA+9AUu1D7O7G4WptDXMSeMO0w4sT5g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(396003)(136003)(376002)(346002)(366004)(122000001)(76116006)(64756008)(316002)(5660300002)(55016003)(38100700002)(8676002)(54906003)(2906002)(186003)(6916009)(4326008)(66476007)(66946007)(38070700005)(66556008)(66446008)(33656002)(83380400001)(86362001)(41300700001)(52536014)(71200400001)(8936002)(7696005)(6506007)(478600001)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?3hd4KBKFYFOFk7fsSuqc62I3gqHheHV3bsBrtQzJjbMpPM/f8QrNQq1FrShy?=
 =?us-ascii?Q?kWgvPV7JEJgnynplptIINLSO6I+ITPEeHo1Am1DyWRNKzG1hletU4ZAc/j+h?=
 =?us-ascii?Q?/4prKQ/uWr8dM/2o0N3hIr04SIs05/nI61/81CZwI8OAy0/uiHgwIBLOEh2X?=
 =?us-ascii?Q?fonbGsaKCUXguh8GcqvPJPK1q+2dIvidaOEWfyOYceHpPAhK20kHrmkMHg67?=
 =?us-ascii?Q?TlPARk4zo4VxK936fs+P0wxWs1kGy826BQNmAEZ6zix4ltg2PKYuGqcYVvLN?=
 =?us-ascii?Q?KCSIiZ+f7cR1Vj91MiHquhEudM33pyH5q0t2dKj78WGmroR8XM/aCRMQUS80?=
 =?us-ascii?Q?xMjQSEqBYrrKq6xVzX/cm/VSUqZOg6esh6GfEH4cnScZUrHtdHkoTp7et4Rz?=
 =?us-ascii?Q?rJwusHnasXrDSVTIgu1VIAcCBuIFc6ufyXNJtjzEdV6z2MwcoCJ4PhzR/b7x?=
 =?us-ascii?Q?v9c2Y2DJhMayprHzaujHwkM10uEPP8lSfTgVjzub2QcRbITpLB4ik2lJF/RM?=
 =?us-ascii?Q?lrZBtZp/3S3FfolJ8+kqiO229ZYjGnLa5i4fysMMtgfu+f4MQnO0gQ3Ud9KN?=
 =?us-ascii?Q?CG32hVuOmJyrFbw6qAqrRiaqxzOwL8sIvkVGSJ7pgNMQwYqikw0r+1TB0RTw?=
 =?us-ascii?Q?FkAsiS3/VhPEuRqtnO3/E47fR0+JC3+Gh3pQL4G6EnUVgijty0Q2ZJl+WHEp?=
 =?us-ascii?Q?bNr/iLaWvUZBzAH4TPSSjYUKEf42zEkKH4a48KVszZFm9gvGtXk77OPAhZA9?=
 =?us-ascii?Q?zVHxBVe62XZKKOyU/sxz0vTWgyuuEtwV9pj9UeHBDdnoNVwPI33Mk5mke/RD?=
 =?us-ascii?Q?gSypGhnxQOmgnGu6yTqa/uCej1f8qlVTsiwHdWSd9werQltGoQ7hRTW8Ok5Q?=
 =?us-ascii?Q?7BHFfDLxG71kS/7WC1/bHMDP5YzRem26McbX/hXrYXpXstDNuD/C0XfaQihp?=
 =?us-ascii?Q?A5qiU8f1+OIhEeO41dHKEkHSekqABGtkDMiLj9q8W4WTI0FJYY9C27jHop/n?=
 =?us-ascii?Q?tQ4k/TJqOiHYL7qC6Vz0OsY1yI+CcVNczr0O8xAZYemYGl20PvXNR/0+2SPw?=
 =?us-ascii?Q?9F1hqA7NinuZnfwejneP9YU8lnEL+oCJOY2zZXrwnfSEH2VFeJb8JPkjnyGS?=
 =?us-ascii?Q?An5Ga5Ky3CsCXqR3lmdTylCwZNGqJ7WaZzoYu7bxFxj9FbzuTGzH8gGxxbhO?=
 =?us-ascii?Q?IlDTaj78r3oZnSw9y/oK44KQGGk8Ij/QJEHMbT5GEj7mbERFyIdGN6br7rih?=
 =?us-ascii?Q?oRGWK4zeDfnzfIgm+EiCLZvv95/4Fwjq43UG1mRvhEpjkZbT1OupPbEA2m7v?=
 =?us-ascii?Q?LtOB/RzUqha5UYSRak1LPr50B5e4CtBepPmjl/TDvyrXdE6213S+gUCw1Bc/?=
 =?us-ascii?Q?konH75+KWzuYJrTZ6P3nWla7Iji/GnLpby0pEiFskurrsX7oYxuj3GNK/Hsk?=
 =?us-ascii?Q?wc1tbFbuj5NlSxmFMBUFvaW3n8NoLSWhszQFEu8H4mcpzIe2JGE40z2pMQbu?=
 =?us-ascii?Q?89Y3T8R73w4d38sJ8ITPqmQprZ9KwelJxXGl5LZXKE0iFuy30VdBKO+NKFxb?=
 =?us-ascii?Q?3/Cswt/86/FLrrg0ahXRlkglVPECNTWeyvhbHK+r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f9dcd0-dcca-45c4-624f-08da54b98ac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 01:41:49.9399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4ShFDe7IH0Z7f/bI90N8RuIQZxnGLzXpUvyGZDcu4sGMBLodhfWqFCEzZQV9NObLBtG2FezK/QEiacFJjuCNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3790
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
Cc: Felipe Balbi <balbi@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> The bug is that we should still enter this loop if "tx_len" is zero.
>=20
> After adding the "last" variable, then the "chunk >=3D 0" condition is no=
 longer
> required but I left it for readability.
>=20

Use either "chunk >=3D0" or "last".
I think the former is more simpler.

> Reported-by: Neal Liu <neal_liu@aspeedtech.com>
> Fixes: c09b1f372e74 ("usb: gadget: aspeed_udc: cleanup loop in
> ast_dma_descriptor_setup()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c
> b/drivers/usb/gadget/udc/aspeed_udc.c
> index d75a4e070bf7..01968e2167f9 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -476,6 +476,7 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep
> *ep, u32 dma_buf,  {
>  	struct ast_udc_dev *udc =3D ep->udc;
>  	struct device *dev =3D &udc->pdev->dev;
> +	bool last =3D false;
>  	int chunk, count;
>  	u32 offset;
>=20
> @@ -493,14 +494,16 @@ static int ast_dma_descriptor_setup(struct
> ast_udc_ep *ep, u32 dma_buf,
>  	       "tx_len", tx_len);
>=20
>  	/* Create Descriptor Lists */
> -	while (chunk > 0 && count < AST_UDC_DESCS_COUNT) {
> +	while (chunk >=3D 0 && !last && count < AST_UDC_DESCS_COUNT) {
>=20
>  		ep->descs[ep->descs_wptr].des_0 =3D dma_buf + offset;
>=20
> -		if (chunk > ep->chunk_max)
> +		if (chunk > ep->chunk_max) {
>  			ep->descs[ep->descs_wptr].des_1 =3D ep->chunk_max;
> -		else
> +		} else {
>  			ep->descs[ep->descs_wptr].des_1 =3D chunk;
> +			last =3D true;
> +		}
>=20
>  		chunk -=3D ep->chunk_max;
>=20
> --
> 2.35.1

