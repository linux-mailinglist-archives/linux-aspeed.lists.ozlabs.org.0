Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 198DB5612FB
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 09:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYV0s6L78z3cFm
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 17:13:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=a32cLAdl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.120; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=a32cLAdl;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2120.outbound.protection.outlook.com [40.107.215.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYV0h2h4Jz3bmK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 17:13:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOvprfUiNpowUf04VrBncQCv0SW0Ay+LivrLXxI1XPuNL/5fBhdPq/Vg3VpxzuQu8RUhSzqEXXlY7ZLdK4bseMbFcZZwR3lhxVn/0cXInNQjCujRHfMHujZbYgBWaPCEswm4GZuIxleczw4v2kwEcTvbgXl5aeVM29cGo+xeAiso1JfITErX8RET0YNM1oxeKRGV2NdQaA+XXV50UKAe7SmqYD/tCzyf0804JIABrR6B0HVKzdNtGfqJ0+77NHn4Qxt9EmjPZ8VedgjTZD3zNNiWdpiuLMY4qOnwVGHCwmpBW9Myfdn4TY56rbXW8iIj7FdxnOG+ai+6GpI+hOvW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M11JwyG8NCm0c0Qh2aZZg3zFcQ43FZ+XUh27/z+6HL0=;
 b=brje8+x4HV6kaEKu2hZSjda/usAr5MLyBGuoF/qkZL2TzRoiEx1iTGrG9NRGhNU0VyBjArhO4ypo5pUgEaTlRxZ/JR8FHmFtZ8PsdA22U14aiMRwYzIcwUdZ8/mVpZLfWevlE38lQ16XhrkB+DO9ECCs+C2prYpXhqZKB9Dk/Lxexv2/MCCKuWR4SlZWlEbMKQv/YcIQ43RlmcMgDD9w2U0jC/LUEDXNML3NgfuUG6RSU5VOzunTuKPzxG1PdrWHYU80SRDAb5PxkXE4rjFjLlLYmYh4wsOQRHb+ZnjB/j/LOOsgzvAbnHBeieZs3LMTQ/uvPrxdgzuuQA5iALakGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M11JwyG8NCm0c0Qh2aZZg3zFcQ43FZ+XUh27/z+6HL0=;
 b=a32cLAdlr4SdT+kVw7V5bLkNUoUskpgsWIC95hVPSt2AhnEtg1h4qhTlPO4qlIfG0TVR4zOXglJiP3XDTOYHXCf1FfEFbZTThOjn9stghq4+5UAUi5+2hoHYvsTlar4aCO2VGQ+Xb0LCv701N/TeGv4xp3VhDqUtFdGVfDy1YxA/4cUBLmoimfN1QaAhGugP+7iVobpsZVyu4Ggy9clZduXpuZq3sM5gC7NV71FY1R+9qZR4mT4EnhBSZcp9yNpKFxIbFyF43h7LV2B+7VeoPWJe4kUs76XLRh/3BveinMUdgCyJz8rdhWiH/9osF5gKL7xJEFJbhWeVqMfc6b9M+w==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SI2PR06MB4268.apcprd06.prod.outlook.com (2603:1096:4:158::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 07:12:45 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 07:12:45 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>, Corentin Labbe
	<clabbe.montjoie@gmail.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Randy Dunlap <rdunlap@infradead.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Dhananjay Phadke <dhphadke@microsoft.com>, Johnny
 Huang <johnny_huang@aspeedtech.com>
Subject: RE: [PATCH v6 2/5] dt-bindings: clock: Add AST2500/AST2600 HACE reset
 definition
Thread-Topic: [PATCH v6 2/5] dt-bindings: clock: Add AST2500/AST2600 HACE
 reset definition
Thread-Index: AQHYi5zbaZG1KB8jMkyqmWLIEIl0Mq1mRV0AgAEBVVCAAAY3AIAAOnNg
Date: Thu, 30 Jun 2022 07:12:45 +0000
Message-ID:  <HK0PR06MB3202A31CD5731DE84210904A80BA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220629094426.1930589-1-neal_liu@aspeedtech.com>
 <20220629094426.1930589-3-neal_liu@aspeedtech.com>
 <c24d0e6d-d9ba-68c5-b1c8-13ad31d39ec8@linux.microsoft.com>
 <HK0PR06MB3202B894962013238CB93B2880BA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <845139cd-f2df-3204-8639-297da145fec1@linux.microsoft.com>
In-Reply-To: <845139cd-f2df-3204-8639-297da145fec1@linux.microsoft.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ef15678-3133-4fd8-7925-08da5a67ee40
x-ms-traffictypediagnostic: SI2PR06MB4268:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  R01NnyTAs1jeRagOtmI/gXRUoOdd1gYEUfw0Vxxs6KFY/tdt7DEzXYLF1r3l+vRMDOEfptsv+YikgcBNQWlbiwecMTsry3YOPT9PI4WcQT5y5YEdMIbC5eoFmiRU0WsikqdKceoEM2EUwxAmWpS0D5APYv7fMeTLteTJvfN0CICTcQ3s/4GrfljkNTp0Obq3gscK2YyqZadLJp07N4AQMpavyV74THITAX1bwMQn/xJAa0LrNVNGrvcPXfBoyyI7pMfYqxlp5MQHubi9Pdt9BQcrz/iyz5sWS5XkRIfk3lm9DBksvMB5J7Q7Jt5YuO+OeDSClPhlkQtF/RSfj+4aBZSewaMlzZif7SVT9bL7i4vOQF86k+j2wqjIlx/QLpWN9vmncyfngYXYdsoS6xJtRDLq3rIR7Ds+TZ0vqj9214Ijhw+3vzTyR1pEEpXC3SIw5C4/qG4BgpI7GN4dMciPC5cVdU9mYoBcaznMu1XsGrWFgtBExvXOyjbYs56v3aweJ2IGMFyJ6dMxe2ibu1WSOL4ZjOxL0SMcYLzWhaNojwJRishJ0Nn0WGyP42Jn4Bt5Vy80jjz+cF07454DHAM43l+GefIk4A40solLAKsFv6kSto8izkFtKfCtp7PaRaqB8tMz3FhmwEH0tOchBF4kJSSxfrIR99Ey5i6oosb0SZK2nUAgrouqxnbysWfwJsMMMDWr6zVr3bKASJmNcd6Q3Dj0Pqeih6AxFftDcAOkdXMuVkKbC570EGA4cIvqhxjfQQ8S/6Us30ietH6J//5rNSj14L0xObiffBC+afHuAP0KhhDloylqmrjioDXzpibtf1Lk7HaBtkNzKVOC4xtISgHDBa55yTXsj/zaw4XrzqHswM/NltlKIGsCMTXrP6z2
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39840400004)(396003)(376002)(366004)(136003)(346002)(33656002)(86362001)(41300700001)(53546011)(26005)(83380400001)(9686003)(38070700005)(186003)(122000001)(921005)(38100700002)(6506007)(7696005)(71200400001)(966005)(110136005)(66476007)(66556008)(54906003)(316002)(76116006)(66446008)(64756008)(4326008)(8676002)(66946007)(478600001)(52536014)(2906002)(5660300002)(7416002)(8936002)(55016003)(6636002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFpUbkdqYk44akMreVh5WUhsQjQrbFJDamxyQURTK0loaHhaYjZhbWZ4bitB?=
 =?utf-8?B?RVh4ZVdVVzlscGNEZ29tbk4wMWlmZFJsNlR4YnhjSXZ6OW1UaEYwZUp4U0dP?=
 =?utf-8?B?UGRJOGJ5TW9PeFEwci96WlArVUdFZE1BU2RMYWVGV0JpMDl0TnFRcU9yWkk0?=
 =?utf-8?B?S0VKRE90S1hSUUJaMU0xNXBOci9CQnZzZXpFM0ZjZTEvWkhSbVNFLzNUQ2RV?=
 =?utf-8?B?VTBKMklMRENkMEI2Nmt0RjVRSk5HWml2OE5xeG1IVUV1cW1nK01ocndCN0tI?=
 =?utf-8?B?L2RDU0QyZFR6WmN6TWpOVkUxdmlJOUo4SjkzVVRndlpKUVlITHlta0V2NklF?=
 =?utf-8?B?eWdGb2VBajY1QjA1dHZ5bUNpQjR4dnpTUHVFd0UrSkE3NHNSbzRLYXdTa2w4?=
 =?utf-8?B?S0VhQVl4UkZmcGxxMXRXWVR3K0RHOW1HbFRuTHg1Uko0SDFpNXRvdnhsUDF3?=
 =?utf-8?B?VW95K2lYQXNSYnZRWHpaQ1I1NWhNa1JUcWR5dU1zMytER0lHU09uUTNRZWYv?=
 =?utf-8?B?bVRkRTE0bGVkcXc3aTl5RFVHSDBrb2VLazl5NGh4UTFBRWNjME5aZ2g2eFRk?=
 =?utf-8?B?aXZCWGRaMTR3cUd0cUpIY0h1Q3NvR1BNd0pONFIwV1dwTVRuWkpxbDluUmkv?=
 =?utf-8?B?aElNN3B5RmJQUEtsL3VpYTNLSmJqYjltczhqL0FObSs2YWlXTG9PZTJ2TzJD?=
 =?utf-8?B?ZHg4b1hNQ3VQMlNXTmF0RGU1Wi9pUDdNS1pqM1RGeEoveDk2ZzkvV0NMMEtR?=
 =?utf-8?B?TWx3RTI0eW93clA4aHdUSHRFTVhXc0h5cEpiUlMzNk1hbDh5bEpGbTdTVS8y?=
 =?utf-8?B?NnQ3V2h3Mmx3aVNRRUZWUXBjRXQ3S3RTYjNuTEIycTV3eFEvNE01Q04vU2ow?=
 =?utf-8?B?M3hVdXNOWjFWTlhLVm1RTDhKeUYwbHlYQ2VtelZrN1FNVlI1VDZnSGx3QjU3?=
 =?utf-8?B?eXhkeFdXUC9XZFRwTDAwb3hlRG5yWWNPbXJuaE1aSjExdUZ5S0dDdVFUcEZR?=
 =?utf-8?B?MnFxWm1qY2hUbDdGdjNMQm1Va2NoQmcrc3dmYXE5emZJNExoNVNnV1djME05?=
 =?utf-8?B?RVZvZVhmcitWOG5EOWdSU2Q5REhlRGd0UHBxTFhYWHkrWnBYL0g3dGhac1Ay?=
 =?utf-8?B?Z0FubVVQOEM5VXpOMk5ZbFRGd1dtTDlUSnFDNkNBL2QxblhvMGFVNEdGUmxH?=
 =?utf-8?B?MUt0RHUrMExUQk0zN2pCR0FaMVd5WVpHL2VHQU9DbjNNMElNbXUrL1MxZEMr?=
 =?utf-8?B?L2s3TkpOZEhMdXNVK0FhSE9Hd2h1U1doN2R3VjEreGU5TENuUloyaVFpWis5?=
 =?utf-8?B?M2tFVDNRVnhFaXNPcG1nZkorL21JVGFMcDM4N1QraUdacUdIZjMyc29MNkc5?=
 =?utf-8?B?ZXRmUFVWVFFWQWdRdzVRbURrM05nRXR2OW1HanJ3dDBMTVJXOG4vWDJHMnVC?=
 =?utf-8?B?TUV4VmpVV0R4Ym9BK3ZFcitSZFkrVnZsQTZyOWZCb1RJMDEvbzBibWdoQ1FT?=
 =?utf-8?B?c0ZEblZlS0dZdk5RMmJLc2tYaTF4NlhVL3N6QkxjOVJtTnFNaVJXVzk5RUdp?=
 =?utf-8?B?ZUx4eFdzWGF0Zjlqa2RteHc1OXJ0VC83VDF0SEhSNzQ3Q2x2M2pOSk45dUY4?=
 =?utf-8?B?ZkgrN3ZsMy84aG9XbmlrT1FJNXNIYXBKYU1IZXd4cUVFOGJyaU9HYXFLVUZa?=
 =?utf-8?B?dEJDWXgxUEphUXpIUWhvMzlIR2gwRTFiSUQ1cjhla0V3VTZhMUxldGY5SHRh?=
 =?utf-8?B?aTM5OTRhS2kzTFhGWDN0b0p1Sk92bmphWlNha0tBM0xvWGxDc1g0NjVYcGc0?=
 =?utf-8?B?a042cmRlSm5kcFFVcUlWMCtlQ2d2eDlXZDFkVTFCUGtuRmdnT0t3SmxNVWlC?=
 =?utf-8?B?WjRFR2tLbW9yZzFobEJ2SXhhMnI3TzBmOVJRZU9MRVY0MUdwenp6UXdMS0dJ?=
 =?utf-8?B?Tm5TMGt0bTQxLzNza1BZTUt4allNTUtyV1RMdDVVT2dyakdkL1dmV3RTWS95?=
 =?utf-8?B?NzI5WmdZWFRmS1dpRElYdmtUK0VDZW5ldnMraGI4TkYzdk0vVDR3SFlyWnJT?=
 =?utf-8?B?aHZ4aS9VYUpKakRJd3BOMnA3dVhabnYxRW9lSWRPZEN6eHdaOGZKanppMS9N?=
 =?utf-8?Q?3Hn7Y9Y47Z+ehIJ3/KyCxtwB0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef15678-3133-4fd8-7925-08da5a67ee40
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 07:12:45.1524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YzdchoErhYxlRKuaJp3amFw71I21AqENqYRPZ5M4TSkNV9/OeczJrGnFSxQ5NzhocWzDK/md37oqxmpdHO9rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4268
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiBPbiA2LzI5LzIwMjIgODoxNyBQTSwgTmVhbCBMaXUgd3JvdGU6DQo+IFsuLi5dDQo+ID4+IE9u
IDYvMjkvMjAyMiAyOjQ0IEFNLCBOZWFsIExpdSB3cm90ZToNCj4gPj4+IEFkZCBIQUNFIHJlc2V0
IGJpdCBkZWZpbml0aW9uIGZvciBBU1QyNTAwL0FTVDI2MDAuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogTmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29tPg0KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogSm9obm55IEh1YW5nIDxqb2hubnlfaHVhbmdAYXNwZWVkdGVjaC5jb20+DQo+ID4+
PiAtLS0NCj4gPj4+ICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLWNsb2NrLmgg
IHwgMSArDQo+ID4+PiAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2su
aCB8IDEgKw0KPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPj4+
DQo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hc3BlZWQtY2xv
Y2suaA0KPiA+Pj4gYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FzcGVlZC1jbG9jay5oDQo+
ID4+PiBpbmRleCA5ZmY0ZjZlNDU1OGMuLjA2ZDU2ODM4MmM3NyAxMDA2NDQNCj4gPj4+IC0tLSBh
L2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLWNsb2NrLmgNCj4gPj4+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLWNsb2NrLmgNCj4gPj4+IEBAIC01Miw1ICs1
Miw2IEBADQo+ID4+PiAgICAjZGVmaW5lIEFTUEVFRF9SRVNFVF9JMkMJCTcNCj4gPj4+ICAgICNk
ZWZpbmUgQVNQRUVEX1JFU0VUX0FIQgkJOA0KPiA+Pj4gICAgI2RlZmluZSBBU1BFRURfUkVTRVRf
Q1JUMQkJOQ0KPiA+Pj4gKyNkZWZpbmUgQVNQRUVEX1JFU0VUX0hBQ0UJCTEwDQo+ID4+DQo+ID4+
IE5BSy4NCj4gPj4NCj4gPj4gSSByZXBsaWVkIHRvIG9sZGVyIHY1IG9mIHRoaXMgcGF0Y2gsIGJ1
dCB0aGlzIHY2IGFsc28gbG9va3MgaW5jb3JyZWN0DQo+ID4+IGFzIHBlciBIVyBtYW51YWwuDQo+
ID4+DQo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMjA2
MjkwMzIwMDguMTU3OTg5OS0xLW5lYQ0KPiA+PiBsX2xpdQ0KPiBAYXNwZWVkdGVjaC5jb20vVC8j
bTAwMGJkMzM4OGIzZTQxMTE3YWEwZWVmMTBiZjZmOGE2YTNhODVjY2UNCj4gPj4NCj4gPj4gRm9y
IGJvdGggQVNUMjQwMCBhbmQgQVNUMjUwMDoNCj4gPj4gU0NVMDRbMTBdID0gUEVDSS4NCj4gPj4N
Cj4gPj4gSXQgd2lsbCBiZSBiZXN0IHRvIHJlZmFjdG9yL3NwbGl0IGFzcGVlZC1jbG9jay5oIGlu
dG8gc2VwYXJhdGUgZmlsZXMuDQo+ID4NCj4gPiBIaSwgYmFzZWQgb24gQEtyenlzenRvZiBtZW50
aW9uZWQsIGNoYW5nZSB0aGVzZSBkZWZpbmUgaXMgbm90IGFsbG93ZWQgZHVlDQo+IHRvIGJyZWFr
aW5nIEFCSS4NCj4gPiBTbyBhbm90aGVyIHdheSBpcyB0byBkZWZpbmUgYSBuZXcgdmFsdWUoaW50
ZXJmYWNlKSwgYW5kIHdlIGNhbiBjaGFuZ2UNCj4gZHJpdmVyJ3MgaW1wbGVtZW50YXRpb24uDQo+
ID4gSSBrbm93IHRoaXMgaXMgbm90IGludHVpdGl2ZSB0byBoYXJkd2FyZSByZWdpc3RlcidzIHZh
bHVlLCBpdCBhbHNvIGNvbmZ1c2VkIG1lIGF0DQo+IHRoZSBmaXJzdCB0aW1lLg0KPiA+DQo+ID4N
Cj4gDQo+IFRoaXMgaXMgbm90IFNXIEFCSSBpc3N1ZS4gRWFjaCBjb250cm9sbGVyIGluIHRoZSBk
ZXZpY2UtdHJlZSBuZWVkcyBjb3JyZWN0IGNsb2NrDQo+IGFuZCByZXNldCBwYXRocy4gYXNwZWVk
LWNsb2NrLmggaXMgc2hhcmVkIGJldHdlZW4gZzQgYW5kDQo+IGc1IGR0c2kuIE5vdCBzdXJlIGhv
dyB5b3UgcGlja2VkIGJpdCAxMCBmb3IgSEFDRSwgaXQncyBmb3IgcmVzZXR0aW5nIFBFQ0kNCj4g
Y29udHJvbGxlci4NCj4gDQo+IFNlZSBkcml2ZXJzL2Nsay9jbGstYXNwZWVkLmMsIHdoaWNoIEJU
VyBpcyBkdXBsaWNhdGluZyBzYW1lIHN0dWZmLg0KPiAgICAgICAgICBbQVNQRUVEX1JFU0VUX01J
Q10gICAgICA9IDE4LA0KPiAgICAgICAgICBbQVNQRUVEX1JFU0VUX1BXTV0gICAgICA9ICA5LA0K
PiAgICAgICAgICBbQVNQRUVEX1JFU0VUX1BFQ0ldICAgICA9IDEwLA0KPiANCj4gRldJVywgdGhl
IHJlc2V0IGJpdCBmb3IgSEFDRSBhbmQgTUlDIGFyZSBpbnRlcmNoYW5nZWQgZm9yIEFTVDI0MDAg
YW5kDQo+IEFTVDI1MDAgKGF0IGxlYXN0IGFzIHBlciBIVyBkYXRhc2hlZXQpLg0KPiANCj4gU28g
dGhpcyBpcyByZWFsbHkgZml4aW5nIHdoYXQncyBhcHBhcmVudGx5IGFscmVhZHkgYnJva2VuLg0K
DQpBY3R1YWxseSwgIkFTUEVFRF9SRVNFVF9NSUMiIGlzIGp1c3QgYW4gaW5kZXgsIHRoZSByZXNl
dCBiaXQgaW4gU0NVIGlzIGJpdCAxOCBmb3IgYm90aCBhc3QyNDAwIGFuZCBhc3QyNTAwLg0KU28g
d2UgaGF2ZSB0byBhZGQgdGhlIHJlYWwgcmVzZXQgYml0IGluIGRyaXZlcnMvY2xrL2Nsay1hc3Bl
ZWQuYywgd2hpY2ggd291bGQgYmU6DQoJW0FTUEVFRF9SRVNFVF9IQUNFXSA9IDQsDQoNCkkgd291
bGQgc2VuZCBhbm90aGVyIHBhdGNoIGZvciB0aGlzIGNoYW5nZS4gSSB0aGluayBpdCBjYW4gYmUg
aW5kZXBlbmRlbnQgd2l0aCB0aGVzZSBwYXRjaCBzZXJpZXMuDQpTbyBubyBuZWVkIHRvIGNvbWJp
bmUgdGhlbSBoZXJlLg0KDQo=
