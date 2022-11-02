Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED4616022
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 10:43:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2MQV0Mvvz3cM6
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 20:43:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hi6ABgfc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.119; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hi6ABgfc;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2119.outbound.protection.outlook.com [40.107.215.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2MQG4rZwz2ywV
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 20:43:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEpTS3BQiJnaPZxe514fVm5xVSwE97VzU1/Wqar9tLue18KPUf/X4IX1G1v2C2QfUV0v113zjS8euRPdhpZUXd1iSAad8W9wLOfZgq3/B96IKvtKHauzXwNaOgv62aijXLJS1ISjvuExIB7+PhY2Zzyis5ueJBlg4ZK6fstER5MJeZ8Z579rTBKU8/tVlq2Lvry6TVv7esMn0S0I4plk+Cpo7K3JifNg9z7zPqd8HG6fdv8CMft1OdAuI5E/aOu9pKoR20YaqaLdPyGFyQ2AMsV7DzlgUZSuFaG9dMFeQWnkGFX4EALP8DYtqeoUALVHkHvgDne2co5eV7GJZInfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O63s0xAslaAdnALEW5GvyF7Ua3VAeWGbaGo+IIG1bYo=;
 b=czMUCNb9qccJzl8Fg977YXb0gpPuPdDe6ISay7R7SNo/BS+dNwe79HeDkmX1dDLmi4QcjylPXFZj+Ow+5Z8tyJyrMXz8XppVC4HiK0WS4LLQyPDX/43yk4ztHqGdXXVHnoi5g3gsdKvcYIRo4sfEnbjGVaOy9btFN28w6ifFq5/u2rg19UssSZ/7+oVKO8gTw1Z0wl5CEa31gkAbNqSI2SkCSVbbtgqzF1Ld9Yu7M/6T3C7BJ4J8VSaHQ2225rDUKYKsZRjq2K1wIDU0GKRtfVZ+6bUUfvxh64GsSR07EglwDzLxo2zRLQQjN9nWJCjZVj3nwduNtIMCfDCI8nE6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O63s0xAslaAdnALEW5GvyF7Ua3VAeWGbaGo+IIG1bYo=;
 b=hi6ABgfcGjT6wcwf/5jeoZXCD53Glp6qYwGS1MFgPewKk/vCSBjkzWf5IcDIG/2/gSPHMLOMowyT/Upb8q7pFu54+kGITjWbqhGlHEnN2awfVo8znOOLM7RpR4akHJjUEjhiLq5ENlgaaPy5D90Uf6cc+xOnX1ulBnioP6ZpxaNDE6YgRd04CvOjCGeBhYaTkCC2XRfMng6zMlSSHgo3fmkVcNJL5ZAy858OsmevMoi8VQnhX0F/a0To5SAc4pTTqNecPxxQIN9aXEBb8v0Yu2QL9qs90Fqw+WTDpVeLq3GMzG5oH6YxoX5Jqb1kMi82TWJ3j+ANOf2mZuR+tBMYJA==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Wed, 2 Nov 2022 09:42:56 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::dd5d:e720:e00f:831]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::dd5d:e720:e00f:831%6]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 09:42:55 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [v3 3/3] hwmon: Add Aspeed ast2600 TACH support
Thread-Topic: [v3 3/3] hwmon: Add Aspeed ast2600 TACH support
Thread-Index: AQHY7pXwP4hgXsCTc0uFdcCd9dGwvq4rYDwAgACHq4A=
Date: Wed, 2 Nov 2022 09:42:55 +0000
Message-ID: <B823C23A-6FF5-41C6-B461-C4F8D6A00F55@aspeedtech.com>
References: <20221102083601.10456-1-billy_tsai@aspeedtech.com>
 <20221102083601.10456-4-billy_tsai@aspeedtech.com>
 <74726285-ae5a-459d-7b83-31025e47ea03@wanadoo.fr>
In-Reply-To: <74726285-ae5a-459d-7b83-31025e47ea03@wanadoo.fr>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.66.22101101
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|KL1PR06MB6259:EE_
x-ms-office365-filtering-correlation-id: 661900ea-8eac-4de8-3d3e-08dabcb69e9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  T21xqOIfp2/G6xwqjaU/z3ltByHbZZ9HDyuhpqqlfrL94xtoDzDAYrjdcE/Xsa/WNWsdM2uE86TSqnDfpTYsefFTl1o2WSWBhd8sHH2DYQQAKBwKtJOMrrkurFE2VyXpV8FLAvZJandNHE0u/9c0p86Avbb3OVHd2bMofxvPUQ7K/mV9cATjgLrCbCO94s5YNg3PkfRA1/U81hp0AOSmJ0R/T35qNMHHj0MVmaBTQzNUgWha7rxhWPDabRROm906hM7SPIdTtui1GYw8t10ihFpLIJihX1g79nkqguGNbXD0543AXPtB2SxwHM5HYm8/fSgBxxYBKBGlI6eraedwWFzasnCS4J+xeH731VvEUKOPb0DWkqXeS8eiLHHzKEH2BsQA8j2pzQbMrkTg+QS4EopCw9kMXDylADL/1b27SjkFF8fJ5EWYjDhpofYbQir+RuMCfeM1MuQledwt5jPA6GLY69724SvOD3o/aE6E0XeAOmIyvae/OwTJfMEwZEVvPN8AN1X7qMSwIwK/Ze9dF7/Sk/f7c/zPLQ9xwJmy4AHxwp40ElrtT0wp9RSdDm+fwL588U2z+RRX12Jts2F+JTPjrL9vZ70EBIyisKGY9CyaVMsGCH6/BDxDPJrTVjvhnFDdiDaPhIkg424Pxp8UqjsYkUVYIpNEJh3cSSv80ho3h9ittGZJEEGS3d2tLoA4Y28sgwxRpv7IHXhs7vL/wxj6Yv9ES3wIfw00MDmzMgchTxrBEuwGsK1SS3b49FHk/MBfhXDT/XoLBcjRttvCLsHAhQshXaztd6geR2ugvfw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(396003)(366004)(136003)(376002)(451199015)(86362001)(36756003)(186003)(33656002)(2616005)(38100700002)(122000001)(26005)(6506007)(66574015)(6512007)(2906002)(7416002)(5660300002)(8936002)(41300700001)(83380400001)(54906003)(38070700005)(66476007)(316002)(66556008)(478600001)(64756008)(6486002)(71200400001)(66446008)(6916009)(4326008)(66946007)(76116006)(91956017)(8676002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NzFBMlQ2eGIrNCs3cVMrdFJEaGhkZkxrYkxudmdJRHV2MVVhRW5Pd2toN1Ay?=
 =?utf-8?B?OUVtSklYSTNqZDRTUlZ5VHkxeURXdWw4d2owTXIvMWkzdzMwQnBOM3M4NExw?=
 =?utf-8?B?U2FMMzZqcjhuYmhyTVVaSUhTR3h5ZWRGTGpCckludGF1MmFkeWkwTkU1Wkh5?=
 =?utf-8?B?TWZnS1pVbzRyaDlkclVrcWNHd2s5SDBYbElRREMrYUdvaUh1ZlZObUZsWlB4?=
 =?utf-8?B?SVp6MXVvQlhNWE92VDgzZUczSmxCL3hxTi8wQzUwUVRRSm9pYWV6THl3OUUx?=
 =?utf-8?B?cklqMEI0YnlIdGQ5dVFycnFUOEg4UXo3ZFBndTIyekJlbC8yb1Uxa0hkOGdS?=
 =?utf-8?B?Nk9qZ3pGZW9FSnkrUVQwY29tcThGUmlLV1ErZktvclNJNm0rbTZnQUh5N1hu?=
 =?utf-8?B?aU1aUG4xbXB5a3FKaVBxemZsUU1CYWxIZHdZSkpuRXpXVmlGMUxYeVZSR3h5?=
 =?utf-8?B?RVpyeW04RTFkbDQxK2ZBL0lzOUNCSHZzc2hHQm01SXJYWXpnTEloa0NvclRX?=
 =?utf-8?B?cHhiNEhyRjBNTGV5eEJ6a3ZRMHdsWUZyZlVtVjU3TVRlWEozdm45MEhhN3lW?=
 =?utf-8?B?bFNTNDJxR3JqNHE4bkg2NWhEVXNJM1c1RlFLK0pSeERqTDdLRVlsOEpvdlJa?=
 =?utf-8?B?bHpZUXhDbXZRemNGMncyZjdqUkkzUkhtK3JJV1c0NzZLRDZ6cFlCalFBZDFR?=
 =?utf-8?B?RDhpekJCOVl4VndHZUw3MGxrMWJwTk4rMWNsUWFZTW9IUERmYXR3bzMyL3kw?=
 =?utf-8?B?eVo5czk4VmRJT05TaG9MTThBLzNPZ2NSVHIrSE9iS09ob00wbHFQcWtWS0pm?=
 =?utf-8?B?YjhhclFDbFdsajRESTE0T0gwbitYMGt3Qythby83ZGw0bkt3emo2SkFOOEJm?=
 =?utf-8?B?ZEVEdzRsT09pck1UWlJYUktYOHZpbnpRY1lNbkRWNXpoNWVGZEVBZll4dm9i?=
 =?utf-8?B?S2JhNUdDWHpIVU5LZVczRmlUNW9GMDlqQmJ6c1BUMU9mOWpnQTJxYlNRS0o1?=
 =?utf-8?B?Vm11Q3FBWENrcEtxN29lUU9vWUpISS9sZ0xoOElRVnNsa1FiN2JWSkIycHpz?=
 =?utf-8?B?T1psZzRKZzY5UkJyWXF5UnI2MVB4OFRzT2NXbmVOUkMyLzB5SXpvUjFrTk10?=
 =?utf-8?B?aTBpMXRicUZUaFpiOGlTaWRUQXl2emJFR2UwTnhoSjhQZWwyamlsb000Sk5Y?=
 =?utf-8?B?MktFV3hZc05acmorejArVVJ2UXYzSVQ0c280d3hVbGc5eHVIZVo3RUw5Tnh5?=
 =?utf-8?B?VjV2eGd4R2l6Nnp2TUFyUzdCQWlRZVFkU0o5dmJoaEZUZlRkOGErY0tUZVA0?=
 =?utf-8?B?VTNVWWNIbjJVM3daOGpTNWdXdnA2MExCdTNhWjdISEdxL20wL3VLbkJpTm5q?=
 =?utf-8?B?V0k3Ujk0YWZPRjRldXE2MFhHYXN0RkxPamVCRFZLYUZjVUloVDBCNXBzVzE4?=
 =?utf-8?B?QnVuRVZkMFJ3NTVEdWExSVFUL0lSTk1kenFqNWRjb3lZUXM5WE0vcnBmdUF1?=
 =?utf-8?B?M0tqbE91SGVvdjJFZEk4RjVzT2x0UTFhejNXbTBzeUNsR3dSOEdidGtqMUVB?=
 =?utf-8?B?QTlGRUFpdUV6YmVXY2lRQVFuc2syTktVS2paNHd5cjV4RS8wa3FJalpEdUdL?=
 =?utf-8?B?Q1plZUhzcndUMVAxVVF5U2ZTTnk0QjBhbnpTMjdmUVdqTEhVSG8xVzVIMTFq?=
 =?utf-8?B?RmJvZWZHTmpIbnB4Y1R1M2lTQ1phcy9hU0RrN0VUMUFmbGViUGpkampHN3J3?=
 =?utf-8?B?OGwxY2tyOEovN0czNCszTEhUc1FiU0xyWWt6R1MzY2tSWnEzQXRRVTlZZ2tz?=
 =?utf-8?B?TWpIaVdsNlppeW04cTZaTzRWNFo1Z2FoQUxDZ0xwRFRQMTZaTDYraTE2ZGUy?=
 =?utf-8?B?ZThtUWVHSnJXVGZVRGhhQnU5eThrU0VocVp6dHJ6RmcvYm5xQitiSDNXR3Uv?=
 =?utf-8?B?dEI4QTljSmdHVjdnMHN0ajJaNERFdTBwY25GU2VXZTJCTXZlUHpFU3htQmRM?=
 =?utf-8?B?VEZNV3lEUU85cnpwcEx3aEw2ZkRuWGxEUXR3SnNRYWN0WmVEN09PbVNlOG5T?=
 =?utf-8?B?dHQyem16ZnFYYTlGczdFaXhyTExJR1VDUkozZktGSzJ3czJsNWJmaHRNOC9l?=
 =?utf-8?B?bUNrOXQ1NHJCY1ROdTIyMTFjUWttaDdFQkVvZWMrTEs5QjJZUTZFVVFMZ0Uz?=
 =?utf-8?Q?C+oQYeDwlUDZmXrp7OLJBxw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09BDA027023A234AA8605216D347CD7B@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661900ea-8eac-4de8-3d3e-08dabcb69e9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:42:55.7364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSfVKaowHWhOHK/PeKYTOO5DBnWcY5tlAHzljycHIYzvHbaqQlCvW9XW1ycBOJkxfxnLI047mL2DPU+b5bjZ37xlerFPpRr5SvZHRq8Ze9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "garnermic@meta.com" <garnermic@meta.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgQ0osDQoNClNvcnJ5IEkgbWlzcyBpdDsgSSB3aWxsIHdhaXQgb3RoZXIgY29tbWVudHMgYW5k
IHNlbmQgdGhlIHY0Lg0KDQpUaGFua3MNCg0KQmVzdCBSZWdhcmRzLA0KQmlsbHkgVHNhaQ0KDQrv
u79PbiAyMDIyLzExLzIsIDU6MzcgUE0sICJDaHJpc3RvcGhlIEpBSUxMRVQiIDxjaHJpc3RvcGhl
LmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6DQoNCiAgICBMZSAwMi8xMS8yMDIyIMOgIDA5OjM2
LCBCaWxseSBUc2FpIGEgw6ljcml0IDoNCiAgICA+IFRoaXMgcGF0Y2ggYWRkIHRoZSBzdXBwb3J0
IG9mIFRhY2hvbWV0ZXIgd2hpY2ggY2FuIHVzZSB0byBtb25pdG9yIHRoZQ0KICAgID4gZnJlcXVl
bmN5IG9mIHRoZSBpbnB1dC4gVGhlIHRhY2ggc3VwcG9ydHMgdXAgdG8gMTYgY2hhbm5lbHMgYW5k
IGl0J3MgcGFydA0KICAgID4gZnVuY3Rpb24gb2YgbXVsdGktZnVuY3Rpb24gZGV2aWNlICJwd20t
dGFjaCBjb250cm9sbGVyIi4NCiAgICA+IA0KICAgID4gU2lnbmVkLW9mZi1ieTogQmlsbHkgVHNh
aSA8YmlsbHlfdHNhaUBhc3BlZWR0ZWNoLmNvbT4NCiAgICA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCiAgICA+IC0tLQ0KICAgID4gICBEb2N1bWVudGF0
aW9uL2h3bW9uL2luZGV4LnJzdCAgICAgICAgICAgICAgIHwgICAxICsNCiAgICA+ICAgRG9jdW1l
bnRhdGlvbi9od21vbi90YWNoLWFzcGVlZC1hc3QyNjAwLnJzdCB8ICAyOCArKw0KICAgID4gICBk
cml2ZXJzL2h3bW9uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCiAgICA+
ICAgZHJpdmVycy9od21vbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQog
ICAgPiAgIGRyaXZlcnMvaHdtb24vdGFjaC1hc3BlZWQtYXN0MjYwMC5jICAgICAgICAgfCA0NzYg
KysrKysrKysrKysrKysrKysrKysNCiAgICA+ICAgNSBmaWxlcyBjaGFuZ2VkLCA1MTUgaW5zZXJ0
aW9ucygrKQ0KICAgID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9od21vbi90
YWNoLWFzcGVlZC1hc3QyNjAwLnJzdA0KICAgID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9od21vbi90YWNoLWFzcGVlZC1hc3QyNjAwLmMNCiAgICA+IA0KDQogICAgWy4uLl0NCg0KICAg
ID4gK3N0YXRpYyBpbnQgYXNwZWVkX3RhY2hfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCiAgICA+ICt7DQogICAgPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7
DQogICAgPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsICpjaGlsZDsNCiAgICA+ICsJc3RydWN0
IGFzcGVlZF90YWNoX2RhdGEgKnByaXY7DQogICAgPiArCXN0cnVjdCBkZXZpY2UgKmh3bW9uOw0K
ICAgID4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwYXJlbnRfZGV2Ow0KICAgID4gKwlpbnQg
cmV0Ow0KICAgID4gKw0KICAgID4gKwlucCA9IGRldi0+cGFyZW50LT5vZl9ub2RlOw0KICAgID4g
KwlpZiAoIW9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAiYXNwZWVkLGFzdDI2MDAtcHdtLXRh
Y2giKSkNCiAgICA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwNCiAgICA+
ICsJCQkJICAgICAiVW5zdXBwb3J0ZWQgdGFjaCBkZXZpY2UgYmluZGluZ1xuIik7DQogICAgPiAr
DQogICAgPiArCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VS
TkVMKTsNCiAgICA+ICsJaWYgKCFwcml2KQ0KICAgID4gKwkJcmV0dXJuIC1FTk9NRU07DQogICAg
PiArCXByaXYtPmRldiA9ICZwZGV2LT5kZXY7DQogICAgPiArCXByaXYtPnRhY2hfY2hhbm5lbCA9
DQogICAgPiArCQlkZXZtX2tjYWxsb2MoZGV2LCBUQUNIX0FTUEVFRF9OUl9UQUNIUywNCiAgICA+
ICsJCQkgICAgIHNpemVvZigqcHJpdi0+dGFjaF9jaGFubmVsKSwgR0ZQX0tFUk5FTCk7DQoNCiAg
ICBIaSwNCiAgICB0aGUgZXJyb3IgaGFuZGxpbmcgaXMgc3RpbGwgbWlzc2luZzoNCg0KICAgIAlp
ZiAoIXByaXYtPnRhY2hfY2hhbm5lbCkNCiAgICAJCXJldHVybiAtRU5PTUVNOw0KDQogICAgQ0oN
Cg0KICAgID4gKw0KICAgID4gKwlwcml2LT5yZWdtYXAgPSBzeXNjb25fbm9kZV90b19yZWdtYXAo
bnApOw0KICAgID4gKwlpZiAoSVNfRVJSKHByaXYtPnJlZ21hcCkpDQogICAgPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+cmVnbWFwKSwNCiAgICA+ICsJCQkJICAg
ICAiQ291bGRuJ3QgZ2V0IHJlZ21hcFxuIik7DQogICAgPiArCXBhcmVudF9kZXYgPSBvZl9maW5k
X2RldmljZV9ieV9ub2RlKG5wKTsNCiAgICA+ICsJcHJpdi0+Y2xrID0gZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoJnBhcmVudF9kZXYtPmRldiwgTlVMTCk7DQogICAgPiArCWlmIChJU19FUlIocHJpdi0+
Y2xrKSkNCiAgICA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwcml2LT5j
bGspLA0KICAgID4gKwkJCQkgICAgICJDb3VsZG4ndCBnZXQgY2xvY2tcbiIpOw0KICAgID4gKw0K
DQogICAgWy4uLl0NCg0KDQo=
