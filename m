Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEEA775134
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 05:06:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=XmuHq8I3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLFLr74XHz30JF
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 13:06:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=XmuHq8I3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::726; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=dylan_hung@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20726.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLFLh1pfFz2yV8
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 13:05:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoIooMhDLrsyleupf5bwKHiz1aUH7R9ywZPyHI/Avln9MzBHJe1x5YDRSXEDac5woO/dJVxIc3pxVwF+1bfGnpNX2lFqtJOu+bZGHWWzIrbQDempyZQs7o9Ey2NaLNTiTzi15F8yXZvzJ+gnfG34o5wElzCY6zSuq4CHlHKDWDjRoS5NbGdhfvL3vFkBC2MRHbiDY+UvePHcVE7TBhO5keCaJqd/XuvQ17IZV03dOQZ38oZvr9MAWPd6nCVaBGSP7c31a3HcdZB1r4hfbpXodZD2ZDWkfvHDmuSjgL992gek1LmfqLX/W9xNL5NAM2cL1m+MXVzA/ZZTgm9OkgN+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MoAQc8TW9BoFkVQT0lfNEB6p4didzhOlYqTKMcunCg=;
 b=isJcwSyU4vfrOfnqWHtvOycg/yFasdIxvrB/1TlzhP6Ghq2TZit0bbY41jZrH6e1fxoR3XUWhebhnZb8pwrowIw6gBrLsUqR210CZIUJtmi9Fb+yOr5WmMrHRn6M+7jbccUxYiSiLpfEjJylxbBAwqGO2QwZ4cuQTXXGhlvsskO16H4Vje3u9rzdT9nhelUJ+1t2DJBuwHZBraH766AFYumF6u8Nw1Yh4Jb0xTwrPem+Kzqmr2SLKwmcGGV3PBr5Z7EJEJ0jXvungY43yifdpr5nDp38cXa3cFEhIw0lJkIw1D9wR4fUSy7d60vYuQuAlxVPPiF/7BGReaymBeDetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MoAQc8TW9BoFkVQT0lfNEB6p4didzhOlYqTKMcunCg=;
 b=XmuHq8I3WysvLkYzMTV4NfLAg65wKHQmyZXgg5u/ZSR0JbTCfZzR3o89yc3iaa+XT8XPXqVFLyz54Xl+c31c+KgrHAd5KqvkJSG6kZj5hVkLVVJnn5QTeKodvvF8vc4JiDZaPh9PYm4CsKp2BuokceU78k0b1oRvYglmlNMKHhBzyUYQAgfbrGi4Td5NvR4jkSsCBFNYursIXUgoomc17YtBQNrigGAg/hQ4kheOmDjaNOz5MGgxDnl3dgZb7akByZ4Mw8ZcuOw1kyUpmzdmXtbG6LGPuCfuQFpjYOnmc1DjqXVv6kYWRAw0DH6LNlRNoogATv4fpWnGqcAcbyX/tQ==
Received: from TYZPR06MB6567.apcprd06.prod.outlook.com (2603:1096:400:465::12)
 by KL1PR06MB6579.apcprd06.prod.outlook.com (2603:1096:820:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 03:05:36 +0000
Received: from TYZPR06MB6567.apcprd06.prod.outlook.com
 ([fe80::3261:9707:fa4e:572f]) by TYZPR06MB6567.apcprd06.prod.outlook.com
 ([fe80::3261:9707:fa4e:572f%2]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 03:05:35 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] Add Aspeed AST2600 I3C support
Thread-Topic: [PATCH 0/3] Add Aspeed AST2600 I3C support
Thread-Index: AQHZyg78ndVj9Ombp0W1p1fw4rNeCK/hFv0AgAAs1eA=
Date: Wed, 9 Aug 2023 03:05:34 +0000
Message-ID:  <TYZPR06MB65674B8AA26D959254101A749C12A@TYZPR06MB6567.apcprd06.prod.outlook.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
 <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
In-Reply-To:  <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6567:EE_|KL1PR06MB6579:EE_
x-ms-office365-filtering-correlation-id: 8d61fbdc-71bf-4e84-cc03-08db98858075
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  F3kn/FkigG1ixMvUETOQ7db3qLeuU/TNMjEodYnXP5VVUsxi9MRw4q+fNOBy5voU6lDw0fnOMGWe8Q39iqUE1SBUnXSsa/+13G4Pob4Nq5uThEkzhfajykIWS3U+ytaDs9BUdC3Hiav/JY0T6Pb4iNVmSiWov+1TT/tszY5L+7Lc6Ts5nLodTmxHiGOQQw1BIgSN31Efg5ZECfpqZ+73EJ0FdkX1CHcYw7dqp8FE6b5XITOBjwOH7Al6PKnIZ2uZLViXmyuNzveMyny4i6RnjhqrlsMx56OlH7lDFaZt6Zenu2DPocjVRn2iSVfHGJNdUC8Oszpa1SDC1Y5qgSpkfxEo7kPE/75QucZDtTqNZSXfc/m1y5Osp+tBCpFPfoeNR4KqB3AIG9kBLNSRyfSnlSDgZKqKNxLA4wwhGrbmsAKXjo9qrrd71A2avyxvauQ3dkdiGK7iYGMVffAPUaZdLnMWrefeN5/wp1MnBwp9j9Nf2KtOAJnO0HT0u2Y0dFvBYEu0P7snhFgfL3bvQvb7IZlgOVO5qo8Z6uzxyghKIkkA0kd3KyL8JZevUd3aNJFHLnje2232+XUK1JutxgqfatX+250jn4hyQHjlslfs6NRuTpiDhEFEzuNAEt9eaYHt
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6567.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199021)(1800799006)(186006)(966005)(53546011)(9686003)(166002)(26005)(6506007)(33656002)(55016003)(66556008)(64756008)(66476007)(38100700002)(54906003)(110136005)(52536014)(7416002)(5660300002)(38070700005)(86362001)(41300700001)(2906002)(316002)(8676002)(76116006)(7696005)(66946007)(4326008)(8936002)(66446008)(71200400001)(122000001)(478600001)(921005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?HIWjHzoAu7tgCKojh8DTLcK0D/cnsJyVWk4Y99xn7M9Wm9ohtGS/D6QDzNea?=
 =?us-ascii?Q?y8Y7dbmjiAAK9ghHENJxKLmnXjX9/tbQIqsheEICQSl+UEnQc2p+bHprRZ5r?=
 =?us-ascii?Q?awOzIBvDFwU5Xteh+Z+1ksRyxv4a2oivptrCTxttai8MBHI9rP6qjBuTC+Tn?=
 =?us-ascii?Q?CCEvc4fNlJUpnSmbEgu6S/VZkhjAF6KyXCDPiWSWKnVS89wpLMUihqZRZfsR?=
 =?us-ascii?Q?F0VjpKIXYAb33d6lRvmaPato/8j8cxN5/0FAxwhoO89hYgt39ZpgsSvu+B/N?=
 =?us-ascii?Q?WYxK+opGOul5I12KcPpWj4Eu2xg+oYEvhz6iUed6mNsy5JmHzURQYESBPjHi?=
 =?us-ascii?Q?iuJwNEiaMXJzfmcSAVbq5HkqSM+UnZKDbT/J6y258g5aftEUoc/Os6PqgUmo?=
 =?us-ascii?Q?PR7HEFZUoWgPt7yV26ErzHGOG7x8DglPvR5lyEXXU+DBTj+g4RVFi4OFTs0D?=
 =?us-ascii?Q?36IaOwdO26TCDZB9kI9jUDUOfyzQot/ku49Be5dVEV4sKl04VThGVBtGPWSN?=
 =?us-ascii?Q?a+6fZMPtaaukTuYMGzfsv79xMYww7vLRPmTa11e+H76fBULNwfTgB+4pXpdG?=
 =?us-ascii?Q?orgR2PEk7GY16/+Hqg1n2fXZzoHKJRZ2iD+ZMAmp8cCh5jM0U1UPGM1FUlug?=
 =?us-ascii?Q?A8vif8PTxJcbHeAyVzSplNZlfirOyYgGhboJWODTJQxMbxiBQybwlSeSfvID?=
 =?us-ascii?Q?9W5mqc7MNp1JFJhOgXzKjASkcoZYd+fiXEn0PwmjiaLiBDRdh3NIIVOzEGXE?=
 =?us-ascii?Q?couiLHOM8NP93AVE7wN+0KAW5FqP7ghZYjwss17Be+QgbMzd8Bkqg6WhJHKo?=
 =?us-ascii?Q?B3PmytgWMfzKFkqe6U3MumEXfI1lhKftHAIg+tpgyq+EuHobycdvSj0usnim?=
 =?us-ascii?Q?gjjN4PKOs5IoFSUVW1DoFPdQ6qCVQwFRFGkGkBVCjsfuDFR9Y4tzI87i6R/L?=
 =?us-ascii?Q?J6tV1nm4j9bkDMeSnU+1s2C1zcq7oJ4Ol5loTqxwwM50/NatVVfvNuAcV5EE?=
 =?us-ascii?Q?osTjFI7ljPVV7sGKHEW8A3X9fvBMtYac09+Ub0zBOgL1HwhCH/n0zdoPXfPW?=
 =?us-ascii?Q?g1NULt6Sd1IhLogXCxx/ZgzFQOiW2dAR4swWM8TfQhfYTFUH9ir9jlzYut7F?=
 =?us-ascii?Q?iAPCdrZBByGyWX7klBJHg5g25Qg1gHpkQvGPjkZRyYxh1x/PQc70qT4Sh0oO?=
 =?us-ascii?Q?yoiDJrEtpH3ddcdM6ByW93ho1jRbackbLqjWRaC+S53tRfDz7yC92NBq2+lP?=
 =?us-ascii?Q?SjWp9g6gG/K1HazRCoglFMAuqf4gsZOQa+tRcOJDD+nCjAK0K866JDTRJIJc?=
 =?us-ascii?Q?HCDK7hpfRsfBRoguoYojqpaykv/44zHDBGZ981vAuzT40CRI7hDxnxDmgtgW?=
 =?us-ascii?Q?WzpWeF6ZAbjUW6M9b4nxMwxsOGX4MQXNGSFuPsKCVez2DQ5OzhssQ+t86dvt?=
 =?us-ascii?Q?9zqpY1uSk5VgeQUndRVudQcLAK0gJYD5b9BlfxGIchTiETPZKlBiJx54zvjk?=
 =?us-ascii?Q?dVC/55jbp2FRjPoHZzWLC/smC0ZT8KUg8K/TYJiZHZe2PmHRVSTjIKsz6FCK?=
 =?us-ascii?Q?XzMkTwwVrEY/HbJFRHKPUTE9i4rGh80yUnlSfDSMXlX6p3o0b5Mm+Gr1C4e5?=
 =?us-ascii?Q?og=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYZPR06MB65674B8AA26D959254101A749C12ATYZPR06MB6567apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6567.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d61fbdc-71bf-4e84-cc03-08db98858075
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 03:05:35.6074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8M8HOEJVh+PFFyU6a1224AWsiDNuqKT/dT5eDV9IVbnWyF+rx7TuqAHpKnsjCt8YnO4t/8mUj7rOwPaJ9FXxsR8j0nD4xehHQwtYjWDsp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6579
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "kobedylan@gmail.com" <kobedylan@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_TYZPR06MB65674B8AA26D959254101A749C12ATYZPR06MB6567apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

> -----Original Message-----
> From: Jeremy Kerr [mailto:jk@codeconstruct.com.au]
> Sent: Wednesday, August 9, 2023 8:08 AM
> To: Dylan Hung <dylan_hung@aspeedtech.com>;
> alexandre.belloni@bootlin.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; joel@jms.id.au;
> andrew@aj.id.au; p.zabel@pengutronix.de; linux-i3c@lists.infradead.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>; kobedylan@gmail.com
> Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support
>
> Hi Dylan,
>
> > This patch series introduces the necessary changes to enable I3C
> > support for the Aspeed AST2600 I3C controller. Specifically, it
> > addresses the missing pinctrl configuration and reset control for the
> > I3C functionality.
>
> +1 for the pinctrl changes for the I3C1 and I3C2 controllers (I'll
> review and ack separately). I have been testing on I3C3 and up, but just =
not
> with the HVI3C on 1 & 2, hence no pinctrl definition there.

Thank you for your review. I3C1 and I3C2 can only operate in low voltage (1=
.0V/1.2V), which is why there are no HVI3C1 and HVI3C2 pinctrl definitions.

>
> However, I don't think the other two are needed.
>
> For 2/3 and 3/3, you're adding a reset control for the global register bl=
ock
> within the per-controller driver, but we can already do that on a global =
basis
> with the existing syscon device. Hence this earlier change:
>

I followed your recommendation and verified that it worked on my end.
Should I resend the pinctrl patch as a stand-alone submission?

>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/dri
> vers/mfd/syscon.c?id=3D7d1e3bd94828ad9fc86f55253cd6fec8edd65394
>
> For this, I have:
>
>     &i3c {
>         i3c_global: i3c-global {
>             compatible =3D "aspeed,ast2600-i3c-global", "simple-mfd",
> "syscon";
>             resets =3D <&syscon ASPEED_RESET_I3C_DMA>;
>             reg =3D <0x0 0x1000>;
>         };
>
>         i3c2: i3c-master@4000 {
>             compatible =3D "aspeed,ast2600-i3c";
>             reg =3D <0x4000 0x1000>;
>             clocks =3D <&syscon ASPEED_CLK_GATE_I3C2CLK>;
>             pinctrl-names =3D "default";
>             pinctrl-0 =3D <&pinctrl_i3c3_default>;
>             interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
>             aspeed,global-regs =3D <&i3c_global 2>;
>             status =3D "disabled";
>         };
>
>         /* ... */
>     };
>
> - with no changes needed to any bindings. I haven't needed any other rese=
ts;
> are there per-controller resets specified in the HW docs you have?
>
> Does that work for you? If you'd like to test, feel free to use my sample=
 dts at:
>
>
> https://github.com/CodeConstruct/linux/commit/05cac24705fa62d2176ecbb
> bf15d955cfe86e753
>
> Cheers,
>
>
> Jeremy

--_000_TYZPR06MB65674B8AA26D959254101A749C12ATYZPR06MB6567apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:\65B0 \7D30 \660E \9AD4 ;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"\@\65B0 \7D30 \660E \9AD4 ";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"\65B0 \7D30 \660E \9AD4 ",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi J=
eremy,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Jeremy Kerr [<a href=3D"mailto:jk@codeconstruct.com.au">mailto:j=
k@codeconstruct.com.au</a>]<br>
&gt; Sent: Wednesday, August 9, 2023 8:08 AM<br>
&gt; To: Dylan Hung &lt;dylan_hung@aspeedtech.com&gt;;<br>
&gt; alexandre.belloni@bootlin.com; robh+dt@kernel.org;<br>
&gt; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; joel@jms.id.au=
;<br>
&gt; andrew@aj.id.au; p.zabel@pengutronix.de; linux-i3c@lists.infradead.org=
;<br>
&gt; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;<br>
&gt; linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org<br>
&gt; Cc: BMC-SW &lt;BMC-SW@aspeedtech.com&gt;; kobedylan@gmail.com<br>
&gt; Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support<br>
&gt; <br>
&gt; Hi Dylan,<br>
&gt; <br>
&gt; &gt; This patch series introduces the necessary changes to enable I3C<=
br>
&gt; &gt; support for the Aspeed AST2600 I3C controller. Specifically, it<b=
r>
&gt; &gt; addresses the missing pinctrl configuration and reset control for=
 the<br>
&gt; &gt; I3C functionality.<br>
&gt; <br>
&gt; +1 for the pinctrl changes for the I3C1 and I3C2 controllers (I'll<br>
&gt; review and ack separately). I have been testing on I3C3 and up, but ju=
st not<br>
&gt; with the HVI3C on 1 &amp; 2, hence no pinctrl definition there.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Than=
k you for your review. I3C1 and I3C2 can only operate in low voltage (1.0V/=
1.2V), which is why there are no HVI3C1 and HVI3C2 pinctrl definitions.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><br>
&gt; <br>
&gt; However, I don't think the other two are needed.<br>
&gt; <br>
&gt; For 2/3 and 3/3, you're adding a reset control for the global register=
 block<br>
&gt; within the per-controller driver, but we can already do that on a glob=
al basis<br>
&gt; with the existing syscon device. Hence this earlier change:<br>
&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I fo=
llowed your recommendation and verified that it worked on my end.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Shou=
ld I resend the pinctrl patch as a stand-alone submission?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><br>
&gt; <br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/dri">
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
ri</a><br>
&gt; vers/mfd/syscon.c?id=3D7d1e3bd94828ad9fc86f55253cd6fec8edd65394<br>
&gt; <br>
&gt; For this, I have:<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &amp;i3c {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i3c_global: i3c-global=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; compatible =3D &quot;aspeed,ast2600-i3c-global&quot;, &quot;simple-mfd&qu=
ot;,<br>
&gt; &quot;syscon&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; resets =3D &lt;&amp;syscon ASPEED_RESET_I3C_DMA&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; reg =3D &lt;0x0 0x1000&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i3c2: i3c-master@4000 =
{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; compatible =3D &quot;aspeed,ast2600-i3c&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; reg =3D &lt;0x4000 0x1000&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; clocks =3D &lt;&amp;syscon ASPEED_CLK_GATE_I3C2CLK&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; pinctrl-names =3D &quot;default&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; pinctrl-0 =3D &lt;&amp;pinctrl_i3c3_default&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; interrupts =3D &lt;GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; aspeed,global-regs =3D &lt;&amp;i3c_global 2&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; status =3D &quot;disabled&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ... */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; <br>
&gt; - with no changes needed to any bindings. I haven't needed any other r=
esets;<br>
&gt; are there per-controller resets specified in the HW docs you have?<br>
&gt; <br>
&gt; Does that work for you? If you'd like to test, feel free to use my sam=
ple dts at:<br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"https://github.com/CodeConstruct/linux/commit/05cac24705fa6=
2d2176ecbb">
https://github.com/CodeConstruct/linux/commit/05cac24705fa62d2176ecbb</a><b=
r>
&gt; bf15d955cfe86e753<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; <br>
&gt; Jeremy<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_TYZPR06MB65674B8AA26D959254101A749C12ATYZPR06MB6567apcp_--
