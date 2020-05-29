Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E066B1F28EE
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:03:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr1T0yjXzDqSV
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:03:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=analog.com (client-ip=148.163.135.77;
 helo=mx0a-00128a01.pphosted.com; envelope-from=alexandru.ardelean@analog.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-analog-onmicrosoft-com
 header.b=oMhko7lg; dkim-atps=neutral
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YNKr2n1gzDqZL
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 May 2020 21:55:10 +1000 (AEST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TAxrAT026418; Fri, 29 May 2020 07:08:42 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 by mx0a-00128a01.pphosted.com with ESMTP id 316wp8brjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 07:08:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHk+n904bo3KoBm7gE5qhev6sa4ZhebXu6kSU5l/aa/PNLFvAOeGmreY+JwpA0qYIPS2VScCxB3dop6P+jEkENcAJM9V/ePVhQK/Z5hbfqw2UMAfOVRPiwUUQziuYhAX+flyvOn4bS9i8QNoV+eNdAlMb/22NNK03ScTY/vMbMNwz95m6KgczUehdroBlMyF8e2ETnvUiTdVS1632fHtsugxtrgm2xTGxkSLct/BBhxytJ42ZwNxqCUt2Bgr0eez3cicD9qWKYqfihgtGV964GmR/ZhiPlMDYvJlTjmUlar2gvZo/NxGk9Ibrmt6stlhFG+RtC5E8RRvWE9IjurHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BweM9eA1kr78dAafyPIy5UypVpgM5fs7nVfSvD3PuY=;
 b=JheeoFz5DnPPhkoddIqvSUQVQe0eQAnWtDSmvPfjS7fgdD23FBEzSc+ko1OahEH7pvW25xGYovVniCeCSWlJqKRGhdKZz3ZX6Z4bUki+V4d3SCczmlXEWW0IORnqjajeDysw2WuRnfPVmT3QXXWegBH9f53EC/IgVAxOUe+ODOXkHy5fWnSuQOGYJt/BaFqLeUsmb2Wv54dOECSWxcGzzDwcXpHzBLUDz1QQGunE2+T1uYvjvYuqgn1GgjzxCHUVyiEQmyQf5gZUHw3jpKZz7MGyjnzP7XWAKKMDHxsqI38cmw4ZbwXElBSbVzPmqNq7rCZxYJOEwVC3NlHecQuqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BweM9eA1kr78dAafyPIy5UypVpgM5fs7nVfSvD3PuY=;
 b=oMhko7lgwTTwwLeXMm+E0ttRv00/adq0Mf0aSy1TzgjLZfN8whssGUgRnnWppVmpGliK+/31lK99lz2oUwnhjY5UWp1FVSTxWHd0/Dhw2AItOTCQaPKZQ7gc11I7QjIadwmcGMou9rwwPpCujZ+Yr1JOLs82At+gUjosUOB8yXM=
Received: from BYAPR03MB4407.namprd03.prod.outlook.com (2603:10b6:a03:c5::24)
 by BYAPR03MB4582.namprd03.prod.outlook.com (2603:10b6:a03:c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 11:08:39 +0000
Received: from BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::18cb:6059:b74f:73a0]) by BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::18cb:6059:b74f:73a0%7]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 11:08:39 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "johan@kernel.org" <johan@kernel.org>
Subject: Re: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Thread-Topic: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Thread-Index: AQHWMBQTKJFuUy7W6E2X8purierYqqi+5C4AgAAOtAA=
Date: Fri, 29 May 2020 11:08:38 +0000
Message-ID: <05500c815f4881a6aa86c809c5ac53e8af3f3e91.camel@analog.com>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-4-alexandru.ardelean@analog.com>
 <20200529101608.GC19480@localhost>
In-Reply-To: <20200529101608.GC19480@localhost>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e6543637-aa9e-4673-dbf6-08d803c0a3f1
x-ms-traffictypediagnostic: BYAPR03MB4582:
x-microsoft-antispam-prvs: <BYAPR03MB45829E414C05156BB5960DCFF98F0@BYAPR03MB4582.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pvy3gsIQUEU12Ty6pkWokVypxBGcELJ34XKnn9quFT0hVs+UFf+JaTdWXbHEQb28X4FtEOQlDw6/CX0LvFFF/znh6Osh367zhQJWNjGhOsfTUGKC2mmrceD1NX1yP++0oTKFThJFKwaLLpO/NN/MBbjQ4ZUE1frBzKNvjNSzaHL//sXmzDYEFHb9jqRxEsqAjNs6gJnGNN2xWXRSnpPMVwSr2+020nKkGDUAGgSgqXu5wRnB+k0dRF9DWd4sIK65Aq8EuAsU3p1T+qPuO4I69T5CTkHVmPaqakNy9bO44aqnZy/IT0XwsWVtzF0PHHHge4ylgmqi3FwYo1XAiCgq7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4407.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(396003)(136003)(366004)(39860400002)(376002)(91956017)(66556008)(54906003)(4326008)(316002)(76116006)(66446008)(6506007)(64756008)(8936002)(6916009)(2616005)(83380400001)(8676002)(6512007)(7366002)(186003)(66946007)(66476007)(478600001)(26005)(86362001)(71200400001)(6486002)(36756003)(5660300002)(7406005)(7416002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nDFaIjJOTh/KO2gQZICr1bGxEqH/m4+iduILwhoFJ86cF2vzlXtribqRbYIC70dpldg9ZHq/pWc6LNPs3yqQD05k6g31M9H2m45ZorRMpMGq+aIPHqx1kgvDMNXrZoNK7FRT1NBzDXbp+wt5EcgeS+Pf88NNRVEuY6d7Q0H+kJq4XpuGLVx3NDhjcW+bMIfzbbVHLabwnq0IZy9tZNy++mv3ZAVoLqbds8mYLgfw+f5EW6XlijisUKF6sMZB965+fiNDGc4fI4PbUpuxgby/qsWNBv6IuVlg+gXYJ/lSlBmdv4mJdoM1+Z8U4efm5u7IbNILO/RB+fdfDB+fYe0ubQu5hw4VPwEGqxspzdJLX5k2P2tLsa+SJXArk2hmShBucRosHg7il25VNde5uU0NSIlsg6a2Q3ETUePISTUD2fWba7s9YSwthor8698bWoZLhw+ruS7tOo43kY7ul6thmHFOnjBh42pnfz7lzGQIgq4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6D081712A43FD4B9CD4A682AA944F89@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6543637-aa9e-4673-dbf6-08d803c0a3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 11:08:38.7175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SW+hVDmgLYi3/thy6Uk0Na0lBfw/jLF/wpJ1LCkcRXYxWJ/unGYyJQb7EVTXm6HS/hs4SLD06hC7otcCx85V7QZDg0MSDuqwfVvKhmXSgbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4582
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_06:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 lowpriorityscore=0 cotscore=-2147483648
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005290088
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:42:14 +1000
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
Cc: "milo.kim@ti.com" <milo.kim@ti.com>,
 "tomislav.denis@avl.com" <tomislav.denis@avl.com>,
 "dan@dlrobertson.com" <dan@dlrobertson.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "fabrice.gasnier@st.com" <fabrice.gasnier@st.com>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "tduszyns@gmail.com" <tduszyns@gmail.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "kgene@kernel.org" <kgene@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "slemieux.tyco@gmail.com" <slemieux.tyco@gmail.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jikos@kernel.org" <jikos@kernel.org>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "vz@mleia.com" <vz@mleia.com>,
 "rmfrfs@gmail.com" <rmfrfs@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ak@it-klinger.de" <ak@it-klinger.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "coproscefalo@gmail.com" <coproscefalo@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "syednwaris@gmail.com" <syednwaris@gmail.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "songqiang1304521@gmail.com" <songqiang1304521@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "ktsai@capellamicro.com" <ktsai@capellamicro.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "peda@axentia.se" <peda@axentia.se>, "jic23@kernel.org" <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIwLTA1LTI5IGF0IDEyOjE2ICswMjAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6DQo+
IFtFeHRlcm5hbF0NCj4gDQo+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDExOjIyOjA3QU0gKzAz
MDAsIEFsZXhhbmRydSBBcmRlbGVhbiB3cm90ZToNCj4gPiBUaGlzIGFzc2lnbm1lbnQgaXMgdGhl
IG1vcmUgcGVjdWxpYXIgb2YgdGhlIGJ1bmNoIGFzIGl0IGFzc2lnbnMgdGhlIHBhcmVudA0KPiA+
IG9mIHRoZSBwbGF0Zm9ybS1kZXZpY2UncyBkZXZpY2UgKGkuZS4gcGRldi0+ZGV2LnBhcmVudCkg
YXMgdGhlIElJTyBkZXZpY2Uncw0KPiA+IHBhcmVudC4NCj4gPiANCj4gPiBJdCdzIHVuY2xlYXIg
d2hldGhlciB0aGlzIGlzIGludGVudGlvbmFsIG9yIG5vdC4NCj4gPiBIZW5jZSBpdCBpcyBpbiBp
dCdzIG93biBwYXRjaC4NCj4gDQo+IFllYWgsIHdlIGhhdmUgYSBmZXcgbWZkIGRyaXZlcnMgd2hv
c2UgY2hpbGQgZHJpdmVycyByZWdpc3RlcnMgdGhlaXINCj4gY2xhc3MgZGV2aWNlcyBkaXJlY3Rs
eSB1bmRlciB0aGUgcGFyZW50IG1mZCBkZXZpY2UgcmF0aGVyIHRoYW4gdGhlDQo+IGNvcnJlc3Bv
bmRpbmcgY2hpbGQgcGxhdGZvcm0gZGV2aWNlLg0KPiANCj4gU2luY2UgaXQncyBkb25lIGNvbnNp
c3RlbnRseSBJIHRoaW5rIHlvdSBuZWVkIHRvIHVwZGF0ZSB0aGVtIGFsbCBpZiB5b3UNCj4gcmVh
bGx5IHdhbnQgdG8gY2hhbmdlIHRoaXMuIA0KPiANCj4gQW5kIGl0IG1heSBub3QgYmUgd29ydGgg
aXQgc2luY2UgYXQgbGVhc3QgaW4gdGhlb3J5IHNvbWVvbmUgY291bGQgbm93IGJlDQo+IHJlbHlp
bmcgb24gdGhpcyB0b3BvbG9neS4NCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQpJIGd1ZXNz
LCBpdCBjb3VsZCBtYWtlIHNlbnNlIHRvIGRvIGhlcmU6DQogICAgICBkZXZtX2lpb19kZXZpY2Vf
YWxsb2MocGRldi0+ZGV2LnBhcmVudCwgLi4uKQ0KDQpDdXJyZW50bHkgaXQnczoNCiAgICAgIGRl
dm1faWlvX2RldmljZV9hbGxvYygmcGRldi0+ZGV2LCAuLi4pDQoNClRoYXQgd291bGQgbWFrZSBp
dCBzbGlnaHRseSBtb3JlIGNvbnNpc3RlbnQuDQppLmUuIHRoZSBsaWZlLXRpbWUgb2YgdGhlIG9i
amVjdCB3b3VsZCBiZSBhdHRhY2hlZCB0byB0aGUgcGFyZW50IG9mIHRoZSBwbGF0Zm9ybQ0KZGV2
aWNlLCB2ZXJzdXMgdGhlIHBsYXRmb3JtLWRldmljZS4NCg0KQ3VycmVudGx5LCBhcyBpdCBpcywg
dGhlIGFsbG9jYXRpb24gW29mIHRoZSBJSU8gZGV2aWNlXSBpcyB0aWVkIHRoZSBwbGF0Zm9ybS0N
CmRldmljZSwgYW5kIHRoZSBJSU8gcmVnaXN0cmF0aW9uIHRvIHRoZSBwYXJlbnQgKG9mIHRoZSBw
bGF0Zm9ybS1kZXZpY2UpLg0KSSdtIG5vdCBzdXBlci1mYW1pbGlhciB3aXRoIHRoZSBpbnRlcm5h
bHMgaGVyZSwgYnV0IGRvZXMgdGhpcyBzb3VuZCBhIGJpdCB3cm9uZz8NCklzIHRoZXJlIGEgY2hh
bmNlIHdoZXJlIHRoZSBJSU8gZGV2aWNlIGNvdWxkIGJlIGRlLWFsbG9jYXRlZCwgd2hpbGUgcmVn
aXN0ZXJlZD8NCg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8
YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaWlv
L2xpZ2h0L2xtMzUzMy1hbHMuYyB8IDEgLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC9sbTM1MzMtYWxz
LmMgYi9kcml2ZXJzL2lpby9saWdodC9sbTM1MzMtYWxzLmMNCj4gPiBpbmRleCBiYzE5NmMyMTI4
ODEuLjBmMzgwZWM4ZDMwYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lpby9saWdodC9sbTM1
MzMtYWxzLmMNCj4gPiArKysgYi9kcml2ZXJzL2lpby9saWdodC9sbTM1MzMtYWxzLmMNCj4gPiBA
QCAtODUyLDcgKzg1Miw2IEBAIHN0YXRpYyBpbnQgbG0zNTMzX2Fsc19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ID4gKnBkZXYpDQo+ID4gIAlpbmRpb19kZXYtPmNoYW5uZWxzID0gbG0z
NTMzX2Fsc19jaGFubmVsczsNCj4gPiAgCWluZGlvX2Rldi0+bnVtX2NoYW5uZWxzID0gQVJSQVlf
U0laRShsbTM1MzNfYWxzX2NoYW5uZWxzKTsNCj4gPiAgCWluZGlvX2Rldi0+bmFtZSA9IGRldl9u
YW1lKCZwZGV2LT5kZXYpOw0KPiA+IC0JaW5kaW9fZGV2LT5kZXYucGFyZW50ID0gcGRldi0+ZGV2
LnBhcmVudDsNCj4gPiAgCWluZGlvX2Rldi0+bW9kZXMgPSBJTkRJT19ESVJFQ1RfTU9ERTsNCj4g
PiAgDQo+ID4gIAlhbHMgPSBpaW9fcHJpdihpbmRpb19kZXYpOw0KPiANCj4gSm9oYW4NCg==
