Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCD48FFB2
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jan 2022 01:06:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcXHw6Vtxz30DM
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jan 2022 11:06:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=r6xgFxPF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.113;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=r6xgFxPF; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2113.outbound.protection.outlook.com [40.107.215.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcXHm4PZ5z2xDl
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jan 2022 11:06:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpziPtDfo3RcjUDm8LY/pi7tsnrARNzDtr6VhR2DRLOIoyKhpMUlhb6qeBaQO5VJPazr5d8OauwX/XhMG3Tu8kxqfTEGp0Qyn/qPMNQxV+lGSi3j1+FxRXzNOiVaD5FuebkKkhgDlnMdX//OML7E7ENR7buhfK9g3KP1QLdaxDB900P7AVo4LteG3FokBxMsiN3WY2bVuGRa/IFjJ4P0OiE9H1on58BuIjhkiZPx5FIr0ZGPDXv7ceCYS+2Q2f2tT23TsWwPMb5rIU4LOFTQs/O8ooVzKqwy/NBbitqMyK3xrlObYJsrktxX1BYORbmT5ixM7aXcsvddPtHruWRDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=937ri3PaMU+3fcq6iW6WQkMSGBp/I38VK8aW0SxsYYc=;
 b=Mv2sb5qFh6cd4LHDcgqYs0bRaNVcBWx/b0NYTft66lIe5R4mC1WT/q1+MZGEHFCCTBSLoZYrbMOcEbvYYqhWyyUQX9wqSYB4+K0+XslHAqw0hzNDi586qZSGfnpoae+n6waIj0AjTqRi4R+8pnQF5PUu95KjV6eqxY6uyYsOnKzBwaRL8O38tpkL6sqHrjuS+GjQQnZIJwTcWhxhoccwZj1o0zzZdNgrW9HjzhMGofNwIlSvXWLyL0g+OMdrEgaUbb3OPVMJELUiXKP/CtbAgQXiY2DskRpuGluTtoIX23Ja9NmrgKa4sgAnWxIuZbjXmlp4ubHgRw43n/NEv2hGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=937ri3PaMU+3fcq6iW6WQkMSGBp/I38VK8aW0SxsYYc=;
 b=r6xgFxPFIE1FGAnzRmUyo5EGnGot9ub+wUkH2bcHLfqrRhGJHxBG8v7eZfNQ8Wm7jgtUst5Gt209QALjKzK6wT6+02H3t5tYMaYtQXgQV1NeCYAYGJXcnkeDDy2Za0eNVI9s7vIr0FS8p6w06kj23ij4bax0C9V1oR3MR7eCK8AkN3jCvF2ZXmLccqULwKRe1VFl0UrvLHJ5PEVId9VgoSsHXUWg4GBRmyiiHdvOW/dn/J+p69rVotzacZ4a9lSEpTKv8Xg96a1J4r1eCvsGOA26RHTVcvQsph49O/XOIqUxGkgtze9Tsq+nc32HvRTZA1pfEsWJbDVQ4jOTNrheyg==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB3747.apcprd06.prod.outlook.com (2603:1096:203:b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 00:05:48 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c963:5e43:78ba:f666]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c963:5e43:78ba:f666%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 00:05:48 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Miaoqian Lin <linmq006@gmail.com>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Vernon
 Mauery <vernon.mauery@linux.intel.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Patrick Venture <venture@google.com>, Olof
 Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
Thread-Topic: [PATCH] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
Thread-Index: AQHYCRIhy+5/zXGjeEuswTKn9whozaxmWTew
Date: Mon, 17 Jan 2022 00:05:48 +0000
Message-ID: <HK0PR06MB377975CCF8230EB9FE35EC6A91579@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20220114064357.18562-1-linmq006@gmail.com>
In-Reply-To: <20220114064357.18562-1-linmq006@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d275b6d7-6095-4e75-6d56-08d9d94d1db1
x-ms-traffictypediagnostic: HK0PR06MB3747:EE_
x-microsoft-antispam-prvs: <HK0PR06MB3747F36E86C139E3312E2B0A91579@HK0PR06MB3747.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZQtP2jKNIzjw+n9uVb6AdqSLTIDR8SWgnfTs7WMUgQpKwZxfIqaJ731Ey6TwjfQ7M2jmJSGZpLsJhU3LLTu2m8EKPhdrWrSxFNqIWcDuXrUoHhhla6tyeZJV1jOrvmw13LvPb0UHykgRd15gB3MfgwZfbiJN+d3QxNUHLxu7WYP57lrzrAXSIl2wG9oE8wp2SadBk6oQlA2ZRlPtfqScXNdqa5fo8oX7bQup9KC3n1+3I42VRs50ZCB2+DZ0YBiDZDiqe6cA6aavfya3OW2XwZEbnMN2o8Ly5jNK7POrbHSJxjKepAJ5vuaAjbCLanyBrmJ0ZvfQtBgdcjd5KDT0swF78+x4QjZyJyAtkkMYDv6ylod3lLpPRuePNXRYXKINYoudRpmqf5Rq0NotSUyWrMEfhu8RmC4joyEz3wvZ7e3hMct4gyMYmPO/UsFMHhvvc+qBapmL6HYd7CPRcwICljqqeuJNKspsJhWburZQHMclT1StvrcyhvkWYr/bVjA4hh9BgrR1kvXmKZNvBP6qV5ABsqIhVCaV82x5+MCJ+FzYJuuYPOmyRdy+zoLttjoUVySwyfvAFDyHJhhC8EoMzCGxcCuj6dwuQY1PknijnwwqF14UM/r/fw/7dsLX8rYdugeMWnBxxnQTCyvYsxPtqWQIOD13ISgaEoVMluMbNqEs/DH6NoaYqEuH/m8iTv0A42GvlfiOu8+CyGD03uf0EosuprbXnNTUfnDqKxJhdXQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(39830400003)(366004)(26005)(8676002)(6506007)(186003)(55016003)(33656002)(9686003)(71200400001)(508600001)(76116006)(66946007)(66446008)(66476007)(38070700005)(66556008)(52536014)(83380400001)(8936002)(110136005)(64756008)(86362001)(921005)(316002)(7696005)(5660300002)(2906002)(122000001)(4744005)(7416002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnU1TWtMaVg4L01kQzJSS1pFRUVuYUtMR3lPdWRVeUp0TUxGekZYai91RGcv?=
 =?utf-8?B?MU94V1UwU2pNbFNsWlQycWV3L3dmTW0yKzJXaXAvOFVsVzB2YjgrbnRGMkV5?=
 =?utf-8?B?bWRkVCtKdmIxazVqdk9HYUJ3c0RFelBoUFRCZTR3SUhFVmJ3L0xocC9tYktq?=
 =?utf-8?B?ekFxa2svVC96Q3ZuS1BKQk1LZ2JUaC9IV2d3RDBPQ0dBYWhyQk5MSGplRFJq?=
 =?utf-8?B?V21UY3E4TFpjRkR3NFJwM1NpMVA3YnJZMDVUenU4WVQ2UnVPL1QwM2E4RWl2?=
 =?utf-8?B?ejJ2YnBtWHhHUkYzaEhiMWUybS9tSUpPc2k5T0FSQVphSHV6eTdGejFIbklB?=
 =?utf-8?B?d294OGNJdldtRGRjWkRsbW5uaU5kUnVQOXBxcjk0OG1TZ0tTV0VMMGFhaHRL?=
 =?utf-8?B?SzUrcHVDQSswTGp2MkNNS1VyZWJxRCtaOHdCK0s2OXlRcno2YkxTNjlvZFdj?=
 =?utf-8?B?eDR6NjdoWmhYN3VqYWhKVXRFY01Hd0FzNFdVL1dhNmtPZ3pIVkdnSEo0WGRy?=
 =?utf-8?B?cVczWFk3STFVSlV1UWVRWXlwMFNNOXpXMzF3b3E1ZDcyMHkxY0lKU2tvODdh?=
 =?utf-8?B?ekYyY3pKWnlwcHZoWXpZTzNrZ0U3YWNEZ3ZxQnU3ZldZdThyYkxkczd5S1BC?=
 =?utf-8?B?NXV2K1RMVXJPWnZGalZYOU1PZ3o2RUpPL2h2b1JveVo4Q20xdXRCT0pVUDRK?=
 =?utf-8?B?Skswei9ERzBvQWdoZUx2OE5Xa09qTkUxWHVPNnBmeVdqTTBqN01XQS9xNXlM?=
 =?utf-8?B?UFN2US9NRGQ5a2dPZ1hOT09GdllUa0NQZFlnUFZFVEhweURMK3oyY1h1L2J6?=
 =?utf-8?B?eFFGNWdGRTcrVmdEVUtudmFuVXVZcVQybXFuZms4UEpHQmdramUyZ3BWTUVt?=
 =?utf-8?B?aEhBM05ySjBQQ2o0ZTByT0MyenU4NFAwTit5MDlrQnU3czNRZ0xZTndLTWlJ?=
 =?utf-8?B?MnhGUVk0QlFUNHo4RlM5SDlWUGxTMmRoNUJ6V3BkazRUY0ErNlgrMEFlMDZJ?=
 =?utf-8?B?S2FYZ0tLemVaUWJMR1lVY3RHeUFvQ3ZUeTdNWUlrVmpXNjVEWGNkQkZHUThp?=
 =?utf-8?B?WEFjZ0MzUkxxQm1SME1aQnI0MElCMU1Ibmd0Ty8wWE40L1lEL3p6QUVRbXEz?=
 =?utf-8?B?U0U2WFMrcnFCNnJGV2x5ejg2LzVRdGU3WTdwL3BjTGhWTUdTbkZQZzk1U3Jz?=
 =?utf-8?B?M0cvSjhuN2RKNngrTjhGRTVOcU93UjJKNFp4S2tkbFJUWVo2dUNDQUVLYldx?=
 =?utf-8?B?Tm50dUxaQkpheldDUkcxemcxNmcrQW1DSnY2d2VEUVgzVDF0MXFKeWJRM1Q2?=
 =?utf-8?B?ZGpQdlZTUWY1TWlJQU5wTXpraVFwQzkrTnhQQUxWTjZvVHZnZTk4OFpNMW51?=
 =?utf-8?B?SitVWUYwVzhyNng3RHFrZjZUR0pjNGYvZjlia2ZYaVRjRUc2NEFVWmozRHZy?=
 =?utf-8?B?Q1g2b1Z1VTNxb1d4SDZicnBkV2ZUNzd1UDJoc2ZhOUpZVjNRSDRmejlpaWF1?=
 =?utf-8?B?ZEFINkZNWlcyeEZ3aXlTVVZ5a1pDdlpQaE10VGhaZlRlUTZmaHE0ek1BdGdC?=
 =?utf-8?B?NUR1dzBCaEZjZFRQbktOTU1QYkkwc0ZXNjUrMWV5SlFDUElWeDd6VmV6bnVw?=
 =?utf-8?B?UUwyKzVSVFBIRGlhc0VBa2FOcm5ORmJDaW5YNzhJVGlBVHl6WUk2U0hyOFR0?=
 =?utf-8?B?U1BNa09OZHVPMWFUeC9MdVQ2eC9XUFBWU0xVQ05rWm4xSEZjamFrVnh1Q0lH?=
 =?utf-8?B?Tk11WWtTTlA3MjNTR25DY3plRUhFVmZnMWpBcC9WbDgzYmZMVjY3cThGZWVI?=
 =?utf-8?B?Z1NDR3Bucm41cHhtRTZPVk9QczZ6czZ4K3o5dk1ISURtSmk2RHZhUUt5WUNi?=
 =?utf-8?B?Wkt6WTMxTER4N3hiSGpieUtNcFArSTV4Rjc3YjlzK28yRHl6VmRwNkNDTFB6?=
 =?utf-8?B?NnBjUnhnZUtuVjJ0eGFibDVhdFl0dEk3OXBTNGlsTFlYcGM5ak1IbjRsM0pE?=
 =?utf-8?B?SWVrczFsQkJYdG5KM1F2TDl2cDVRQzdqNHhGeVFTR1RESWtiU2l5SlhoT1NE?=
 =?utf-8?B?cC95eGZ3d3RlaUhhK1RFcTBpbjVlaFNiU3dDSWxsWTlPeERVR1llbWc3Tnpp?=
 =?utf-8?B?Ti82Y2xVdnNpWkFBK3JFOHBJYXY1anRQalRjZGsrSG4zODVBTUJyZG9LVDkr?=
 =?utf-8?B?MVp3Q2pIZWIvZjhnTS9zMWV5dW1JdVFpKzBBZjkvL2hMMEFTMDNMbW82TndL?=
 =?utf-8?B?aHJpUUd3cFpnUVVVMjVFSGVmaURBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d275b6d7-6095-4e75-6d56-08d9d94d1db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 00:05:48.3043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mjNiI9RYul2p/qoyYsjFVLDoUjB5QnilL9L0tfA5hreWYjAjozQwELBbdSubsLqX1QtdEQCpICupH2lTbOu2Q0hTEeLdCcRT9Lr118Zirw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3747
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBNaWFvcWlhbiBMaW4gPGxpbm1xMDA2QGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBKYW51YXJ5IDE0LCAyMDIyIDI6NDQgUE0NCj4gDQo+IHBsYXRmb3JtX2dldF9pcnEoKSByZXR1
cm5zIG5lZ2F0aXZlIGVycm9yIG51bWJlciBpbnN0ZWFkIDAgb24gZmFpbHVyZS4NCj4gQW5kIHRo
ZSBkb2Mgb2YgcGxhdGZvcm1fZ2V0X2lycSgpIHByb3ZpZGVzIGEgdXNhZ2UgZXhhbXBsZToNCj4g
DQo+ICAgICBpbnQgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gICAgIGlmIChp
cnEgPCAwKQ0KPiAgICAgICAgIHJldHVybiBpcnE7DQo+IA0KPiBGaXggdGhlIGNoZWNrIG9mIHJl
dHVybiB2YWx1ZSB0byBjYXRjaCBlcnJvcnMgY29ycmVjdGx5Lg0KPiANCj4gRml4ZXM6IDUyNGZl
Yjc5OTQwOCAoInNvYzogYWRkIGFzcGVlZCBmb2xkZXIgYW5kIG1pc2MgZHJpdmVycyIpDQo+IFNp
Z25lZC1vZmYtYnk6IE1pYW9xaWFuIExpbiA8bGlubXEwMDZAZ21haWwuY29tPg0KDQpSZXZpZXdl
ZC1ieTogQ2hpYS1XZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KDQpUaGFu
a3MuDQo=
