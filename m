Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF55ED2FB
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 04:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McgHL0xqVz2xHF
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 12:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=E5XpI5O1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=40.107.117.79; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=bonnie_lo@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=E5XpI5O1;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2079.outbound.protection.outlook.com [40.107.117.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWtSy21Xzz303m
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 17:28:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZy4yvOK9BfyIs9Apu+J+XoQ8JKXR5bZ8M610xdt/vNFGA6JjbZR3FTKuOWMaSylNV10hYG9trBXidQb/9bxFsS+PAeNJPapFqZHpUQ+hDYA7p8YR27uZqPPPuIyMbzQL15uCczedNJB2WitDLs3n7hy6tfIeB7pA9BMrEFegEm6q0w60cJu4+I8DyiVmpitkGXn4EvESUC/BUax2h6M0rSvkhg/oDazLdhbkoJapLK7MeNsFf/rcT7H+XXgW104ZUtSMPd6zoQvUFubcspuH/74apngo1ZZuiokBs0ZcwGY63+D9lB3K63wiNRHRFYs2+6ECisenkundC7z+lO+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owVfruoHXspvsmu0Mz0GSrege0MiZRLmn3J2QzjshXM=;
 b=eu4Ca5JKse/AO0oi/5/wU6fGMT82d0rRXcpBUkKsrIKyMoVirrEYI26peH428M3s6f+Auw8AGhWYTZrAQgUmyCjfOfu/HP0sy6ym2jR+WLvQowqVh6Cz586sKrIlpKKXt2uk+r4iVkVIeNcV1QLfau7a6DM9gkYruM6p9DsIFOTvPzKQsjpXblachUxLL9Y1cnIDA391Aln5dERi221IzgVBdtCAyejFoWA2yRAa0Ck7Q6LJo5Gg5qaCkV0ArQ1epyUoz2JSYNjj4AvXBw5R8nmO/tw3C+B2ymX8XOpLDabX8hBFh908OM6Gtfk0FNejLkMFA7ftTr3OXcapsE8W2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owVfruoHXspvsmu0Mz0GSrege0MiZRLmn3J2QzjshXM=;
 b=E5XpI5O1bkKWq+7i5YVyxAwL4j/uvQA1v5AfU4A9TPez8Py3T9QNG8OJn+0MlvssiIQaN9vm3U5yifQVJTzzSCbX1HMDY+nWBUQiN4e9UqqQj/l2xG8NLfk2owoDWkemIangte64fDh1ER8QhKWbi0FDeXWThlQahsYSc3AjKPAr/vwEMi3txtpecnGHuGSR3WeQSQHqGZRBFTnu74OVQ8k8tBgNMDRKMI9qf5tf94lZVNw5LEN1+l7Yh/1LTU3ILXd+JyED3W8ItXIPSPnragsvz4M0DqmNEieQGI3LkAYmYuAINnEQZehkM/GM40AW//Ub9STzwv3Y77oOJZDGSg==
Received: from HK0PR04MB3105.apcprd04.prod.outlook.com (2603:1096:203:8e::20)
 by PSBPR04MB4039.apcprd04.prod.outlook.com (2603:1096:301:10::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 07:28:29 +0000
Received: from HK0PR04MB3105.apcprd04.prod.outlook.com
 ([fe80::6b9a:1628:86cd:af11]) by HK0PR04MB3105.apcprd04.prod.outlook.com
 ([fe80::6b9a:1628:86cd:af11%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 07:28:29 +0000
From: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes
 (AST2600) BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes
 (AST2600) BMC
Thread-Index: AQHYzJkFbVAJ0vWpP0qnfgFnd3u4Aq3n5eOAgAAFqOA=
Date: Tue, 20 Sep 2022 07:28:29 +0000
Message-ID:  <HK0PR04MB3105362597B1E8CBF897D0E3F84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
References: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
 <1b03d24e-7bd3-f912-b59b-f2199770e9d8@linaro.org>
In-Reply-To: <1b03d24e-7bd3-f912-b59b-f2199770e9d8@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HK0PR04MB3105:EE_|PSBPR04MB4039:EE_
x-ms-office365-filtering-correlation-id: 51bcd6d4-30b4-4537-1a30-08da9ad9b6fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZfSsoF3qHEWUoCRMtq/pvJBEoFhEoD8NSdP8LuH40waX0srKAey4uIDtY2KKy9eyHLsSUzOCF9tq9ZSE6NsEc3+vgSfDmZEd09hLyVbohwFFa7TA7CRXv7RhyoFL2aPM40jCyB31zJ8YoBPhFzAihVdGAG0i+Xn4iiMsfjU2B4vgrcarH30CHekLo03tcDdrN4pjvy+cywY2zF2wI8ap0U0WYWAJPZexjKVZ6sYDnKQlhW+df2q3t08p0RAbD6foxomHTNXc57ePvy9nsZGpHrneWSxSpnt30SxVRuGqvX3x1cxF5vNo8pZmsAuIhQ4L0JG1Fz0TT0RfMsf1rI6JL5hcbXyEUXzT1vyIcKA9DRvMzOf80bsWAkla8NRLnYZW+Un+MsCrLy8DRfKPOAlgwtLGBWK6xH8NlQHIhfTJd1TODwsmjeJDK+VK+VxzM4igQAqa36lNBdeeiD97++11JRTdomoleIPhh2kfylaSHVBUiKiZnMMd8thPdbs4v8ntppy8TWSej1gP4qj0SxOwIcedmVUfjq7vJnQUT1vK/YVOdlMJA679wzfItgwWPWpHDDQQM5Mohw+kFhTEWWjcr2KJhG+/l+/bMMNQJL9qPyNEzIM3X8WipnfOsvG4/0VxdHcYPOXbGsscSQijjl1X1RJxMgzMHdrCRc6kd7A4VXLfbnZ7y9ZbFQBrsnOdrqdN+1meXYv3D3iV8K2H8TMLDBP4mr0mIVlbhub8oWdg3J/t8aHnXAPiOpz0CSs4wxz0HV/pjMECsvitVOqIsjqM2Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3105.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(47680400002)(451199015)(55016003)(2906002)(122000001)(4326008)(8676002)(66476007)(66556008)(64756008)(66446008)(7416002)(38100700002)(316002)(8936002)(6916009)(52536014)(86362001)(66946007)(54906003)(33656002)(5660300002)(76116006)(186003)(478600001)(9686003)(38070700005)(83380400001)(7696005)(26005)(71200400001)(6506007)(53546011)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b09IT3V6Y1FISFBiY3h3Z2ZnaUlPNjFKZllON2lpRnpDQjJNTFdyY29FUHRx?=
 =?utf-8?B?UjhFR1kwMG0yZitNbEVGNjUvTmJ3alZlSWlnSExqYVFLWWd1bGVMdVRrcnZN?=
 =?utf-8?B?MUh4cXNZOFg2a3BMZjVxM1QwZEdMZXcvL1BkV2FhUlZqWDBiNE8rSTZ0RFRT?=
 =?utf-8?B?d2ZHcHdHU25xR0tUUkMyc01RYTRobjlBQTVGaFVoTEV2djF6VEJFYmhQRTRE?=
 =?utf-8?B?dEtJcEdRY0dUOUVBdmdLdUpxa01GemxYUDE0NytmNkhteUxHd2FLdWFvdDhJ?=
 =?utf-8?B?OG5ORWhka09EcTRwKzFMdzBIYUJla29uazVXU0xncHllN2dRb0k4QmlkcEpB?=
 =?utf-8?B?WHpsZjR3b0VSSERhOG5jaXUvUlUzSWhuRVpyZWxJOEFtbVJ1bVVHWkF0Ym82?=
 =?utf-8?B?eTZkeDgrNVMxakdnbWJVcC9aQU9FU3pzQU53am9yZmlQMDNoY2w0Q1pZUFdu?=
 =?utf-8?B?RURZMkYydURTVHJYdTBNZDlycTFNZy93eTR0c1huWExVQ3lVbm54QU5SMDBk?=
 =?utf-8?B?UTh6Q3lIekRVYnZxZDBPem82Tmpub3l3ZkZhQ21JS1dOTVBmUEdGTzM5Wjdz?=
 =?utf-8?B?d04vQWhZdlZnQWpCdjVJSnB0WFRKcEQ1dkpqTFM0eklMRWp4MW5zTWlkQlcx?=
 =?utf-8?B?TnliVXBWOUhWUjN3UXV3bSsvY3Q0YzFVNzhGWGgrdjBVMC93TSt0YzI5Tzg1?=
 =?utf-8?B?YStaWFBJSVFkcGxTcm52aHhaUE5vSlBhc2dCSzIrbXp2d0h0N2lDeGcxeGNq?=
 =?utf-8?B?TXc1czVERlFjMnV1eFpmSWVDSlNmNmRWR0pwMUZKMWs0MWwwZ1ZYV2E1dGlJ?=
 =?utf-8?B?eUpZZC8rdjBMTmVJdkh5YnRwZkJkaHVXTzZuNDYwVSs4clVGSGxMTGw5eUtN?=
 =?utf-8?B?d0RnRDF4Y3BaOFkxenMvMDQyTU9QTWZwU2tGYXdsczA2elNYZlRSTUNDdDhC?=
 =?utf-8?B?S1V1OWlWS0pqUFhTVDZxNVI5VGRubFpOZ1o5a25ZelZqYm9QNUtad1JCNkRT?=
 =?utf-8?B?M09sdFpWRER6Nk1XcnJsTUpLZTlMU2w2SENua2EyY1hsL0RKNXhVMzNEQWVE?=
 =?utf-8?B?VERwUWtOR0lsVkxqOE1BOFhEMjVIQTRleVBydGM2NW5SMi9ORExjZHNrU3c1?=
 =?utf-8?B?ZW55cUppNTNXaTZ0UmxJTytJWkxsM1pRVTZ1aFhUY0xvRUppb1E1cXhjb1pT?=
 =?utf-8?B?NUQ0bS8wWmJBT2NXYU9jeE9lc2h4NzFmb2tnbUZ3RkluSlA1MEIramlheVVY?=
 =?utf-8?B?RURmdmtOdjFjRkJQcHAwZVdEVlRya1g2d1huYTcxUnYxNWxEM3pzUXFsbVFE?=
 =?utf-8?B?cklCQ3dnYkQ4dUdEVkxqNTJnSUJHUFhla0NKcEp6N3l0cWZlMkNVWUU0NnNN?=
 =?utf-8?B?d0w2YmhjNDVXZi80QUhxYU5admtqR3hvR3FDZWxwZ25OV2IwSERPd2h2Qngr?=
 =?utf-8?B?VHJ3T08wVG52YzBmV2hHME1XV2lhWGg4MERqV3pMTThUZVpFMkYrSmV6RHRF?=
 =?utf-8?B?djVEQWdwdlFGTjlHejUvUEdMZDdhOER4cmhuOTNYcGZDWVduaExEVHZ5bXor?=
 =?utf-8?B?TUkxMlFvZ0VhYmZwS01WdGhQcE91ZExDOVRUVG9sMFZUWGcyNC9FRWpsMjVy?=
 =?utf-8?B?NnBZTWcyMkNaaFZaYWoyTzkyMGlCSGpoRUYwUURQMXR3Wk5PZStOZWpkYWVm?=
 =?utf-8?B?bWVIdmxCbWdzYSs3TkV6M09vc3NKRWtvWm9zaXBmYlpLR0tpcWpvU2ZKRE81?=
 =?utf-8?B?Zlo4WDdKUE9lbVFJSlJySGdwZklZbmhRUjMzN0V3K0ZxMHBiWW5SYW9iL01Q?=
 =?utf-8?B?KzFnRHZqSndTaDlmdUcxSVBxRklVMzFNWWZPMGhIRnlwY0ovYisxdUQxUCtS?=
 =?utf-8?B?RWI0TlpaaFRYSnM0REZNY2N2LzRTelhnbDg5bk43bHhDNm5mcnZQQVUxMGNR?=
 =?utf-8?B?RVZjSUpmVzk2M0ZBU25mLzZSZWV1VnM1dDNFT0J0MEJTbk5UOVVneXV0SGZE?=
 =?utf-8?B?bTdQSkJydTBwMjFkcTYvYlNkMllDWm5aZVVwRWpmUVBpWjlGUU04Z25uc0gr?=
 =?utf-8?B?R25uTTluS0ZPbkFRZ2QwWTFMblVmSDh4QnIyNVpZc2pyQ2M3d29DWVpmQ3RF?=
 =?utf-8?Q?hB/YYdweFtVwNzGQJS0DwkMP2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3105.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bcd6d4-30b4-4537-1a30-08da9ad9b6fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 07:28:29.4433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wOR1L7neCtB3HHi5ZR7ncWsqa68oYJadvdR/dEMsdA9BZVByQtR6lgu/hEVMJX18OFGkeCFRdnoPBgPuU84vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB4039
X-Mailman-Approved-At: Wed, 28 Sep 2022 12:20:27 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, "garnermic@fb.com" <garnermic@fb.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLA0KDQpJIGFtIHNvcnJ5Lg0KSSBoYXZlIHJldmlzZSB0aGUgRFRTIGFjY29y
ZGluZyB0byB5b3VyIGNvbW1lbnQgYW5kIHJldmlzZSB0aGUgc3ViamVjdC4NCkkgd291bGQgbGlr
ZSB0byB1cGRhdGUgdGhlIHBhdGNoIHRvIHlvdSwgc28gSSB1c2UgImdpdCBzZW5kIGVtYWlsIiBh
Z2Fpbi4NCkl0IHNlZW1zIGxpa2UgaXQgZG9lc24ndCByZXBseSB0aGUgb3JpZ2luYWwgbWFpbCBi
dXQgcmVzdWJtaXQgdGhlIHBhdGNoLg0KQ291bGQgeW91IGd1aWRlIG1lIGhvdyBJIGNhbiByZXBs
eSB0aGUgb3JpZ2luYWwgbWFpbCB0aHJlYWQgYW5kIHVwZGF0ZSB0aGUgcGF0Y2ggYnV0IHJlc3Vi
bWl0IGl0Lg0KDQpUaGFua3MsDQpCb25uaWUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4NClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyMCwgMjAyMiAzOjA3IFBNDQpUbzogQm9ubmll
IExvL1dZSFEvV2l3eW5uIDxCb25uaWVfTG9Ad2l3eW5uLmNvbT4NCkNjOiBwYXRyaWNrQHN0d2N4
Lnh5ejsgZ2FybmVybWljQGZiLmNvbTsgRGVscGhpbmUgQ2hpdS9XWUhRL1dpd3lubiA8REVMUEhJ
TkVfQ0hJVUB3aXd5bm4uY29tPjsgQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT47IE9sb2Yg
Sm9oYW5zc29uIDxvbG9mQGxpeG9tLm5ldD47IHNvY0BrZXJuZWwub3JnOyBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraStkdEBsaW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFtQ
QVRDSF0gQVJNOiBkdHM6IGFzcGVlZDogZ3JlYXRsYWtlczogQWRkIEZhY2Vib29rIGdyZWF0bGFr
ZXMgKEFTVDI2MDApIEJNQw0KDQogIFNlY3VyaXR5IFJlbWluZGVyOiBQbGVhc2UgYmUgYXdhcmUg
dGhhdCB0aGlzIGVtYWlsIGlzIHNlbnQgYnkgYW4gZXh0ZXJuYWwgc2VuZGVyLg0KDQpPbiAyMC8w
OS8yMDIyIDA0OjMwLCBCb25uaWUgTG8gd3JvdGU6DQo+IEZyb206IEJvbm5pZSBMbyA8Qm9ubmll
X0xvQHdpd3lubi5jb20+DQo+DQo+IEFkZCBsaW51eCBkZXZpY2UgdHJlZSBlbnRyeSByZWxhdGVk
IHRvIGdyZWF0bGFrZXMgc3BlY2lmaWMgZGV2aWNlcw0KPiBjb25uZWN0ZWQgdG8gQk1DIFNvQy4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogQm9ubmllIExvIDxCb25uaWVfTG9Ad2l3eW5uLmNvbT4NCg0K
RG8gbm90IGlnbm9yZSBjb21tZW50cywgYnV0IGVpdGhlciBpbXBsZW1lbnQgdGhlbSBvciBrZWVw
IGRpc2N1c3Npb24gZ29pbmcuIElmIHNvbWV0aGluZyBpcyBub3QgY2xlYXIsIGZlZWwgZnJlZSB0
byBhc2sgZm9yIGNsYXJpZmljYXRpb25zLg0KDQpTaW5jZSB0aGVyZSBhcmUgbm8gY2hhbmdlcyBh
bmQgeW91IHJlc3VibWl0IHRoZSBzYW1lIHBhdGNoIC0gTkFLLg0KDQooLi4uKQ0KDQo+DQo+IFdJ
V1lOTiBQUk9QUklFVEFSWQ0KPiBUaGlzIGVtYWlsIChhbmQgYW55IGF0dGFjaG1lbnRzKSBjb250
YWlucyBwcm9wcmlldGFyeSBvciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gYW5kIGlzIGZvciB0
aGUgc29sZSB1c2Ugb2YgaXRzIGludGVuZGVkIHJlY2lwaWVudC4gQW55IHVuYXV0aG9yaXplZCBy
ZXZpZXcsIHVzZSwgY29weWluZyBvciBkaXN0cmlidXRpb24gb2YgdGhpcyBlbWFpbCBvciB0aGUg
Y29udGVudCBvZiB0aGlzIGVtYWlsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQg
ZGVsZXRlIHRoaXMgZW1haWwgaW1tZWRpYXRlbHkuDQoNClRoaXMgbWVhbnMgd2UgaGF2ZSB0byBy
ZW1vdmUgdGhlIGVtYWlsIGJlY2F1c2UgSSB3YXMgbm90IGF1dGhvcml6ZWQgdG8gY29weS9kaXN0
cmlidXRlIGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCldJV1lOTiBQUk9QUklFVEFS
WQ0KVGhpcyBlbWFpbCAoYW5kIGFueSBhdHRhY2htZW50cykgY29udGFpbnMgcHJvcHJpZXRhcnkg
b3IgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZCBpcyBmb3IgdGhlIHNvbGUgdXNlIG9mIGl0
cyBpbnRlbmRlZCByZWNpcGllbnQuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGNvcHlp
bmcgb3IgZGlzdHJpYnV0aW9uIG9mIHRoaXMgZW1haWwgb3IgdGhlIGNvbnRlbnQgb2YgdGhpcyBl
bWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIGVtYWls
IGltbWVkaWF0ZWx5Lg0K
