Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD11E353B
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2020 04:11:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WvSr4kN1zDqP5
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2020 12:11:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=st.com
 (client-ip=62.209.51.94; helo=mx07-00178001.pphosted.com;
 envelope-from=philippe.cornu@st.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=st.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=st.com header.i=@st.com header.a=rsa-sha256
 header.s=STMicroelectronics header.b=IuvCEUoT; 
 dkim-atps=neutral
X-Greylist: delayed 1153 seconds by postgrey-1.36 at bilbo;
 Tue, 26 May 2020 23:42:51 AEST
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WZsR1n95zDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 May 2020 23:42:47 +1000 (AEST)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QDHsIC023863; Tue, 26 May 2020 15:22:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wQm2v0Z5VAQgV4xTo2zwfCmgV90iJzta4mQKFeoOBcE=;
 b=IuvCEUoT2isjEnlFiBuOp+ENWrK5REcb2viDxPg1CkUV/9OylPvwjza0XQvPK69H0Ptr
 kq3/2QvM4INWlK0y1F9GxBeUwmquz+5lz5HeF9xCHFhqeJDEQJzI77qtwu5t6wJjyFsD
 fQiK81ZpXfC5QEzBSVQWnYQUp+wIX5hkrXKtFeosLtvU3+iRfOj71yIkMznsdHKPIlyD
 H2O24f8B1/cNkQsByCVV8sw5rrp5O3zeGRHrhWXa5ui7i51ilD9C841TFYMcQUQAHdGi
 Tz1xN8X/+ubyIvg1tPJWEKh2t3N5NPgTsvTNvfw0Eb/zrmzd5dCIJ/NxSu4ppcdXu0X0 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1yxsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 15:22:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE2AB10002A;
 Tue, 26 May 2020 15:22:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C9042AEF26;
 Tue, 26 May 2020 15:22:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 May
 2020 15:22:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 May 2020 15:22:18 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "abrodkin@synopsys.com"
 <abrodkin@synopsys.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "james.qian.wang@arm.com"
 <james.qian.wang@arm.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "stefan@agner.ch"
 <stefan@agner.ch>, "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 "john.stultz@linaro.org" <john.stultz@linaro.org>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>, "paul@crapouillou.net"
 <paul@crapouillou.net>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "marex@denx.de" <marex@denx.de>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "benjamin.gaignard@linaro.org"
 <benjamin.gaignard@linaro.org>, Vincent ABRIOU <vincent.abriou@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "wens@csie.org" <wens@csie.org>, "jsarha@ti.com" <jsarha@ti.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>, "noralf@tronnes.org"
 <noralf@tronnes.org>
Subject: Re: [PATCH 17/21] drm/stm: Use GEM CMA object functions
Thread-Topic: [PATCH 17/21] drm/stm: Use GEM CMA object functions
Thread-Index: AQHWMEBP24K9tztXlE2wkAB9PsURFKi6P1KA
Date: Tue, 26 May 2020 13:22:18 +0000
Message-ID: <ee29b996-77ec-9ada-2e96-090399dc5383@st.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-18-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-18-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <93ED9A11ABEFE040B87BC6B2D4A9B569@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
X-Mailman-Approved-At: Wed, 27 May 2020 12:11:04 +1000
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

T24gNS8yMi8yMCAzOjUyIFBNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gVGhlIHN0bSBk
cml2ZXIgdXNlcyB0aGUgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBmb3IgQ01BIGZ1bmN0aW9uczsg
ZXhjZXB0DQo+IGZvciB0aGUgLmR1bWJfY3JlYXRlIGNhbGxiYWNrLiBUaGUgX19EUk1fR0VNX0NN
QV9EUklWRVJfT1BTIG1hY3JvIG5vdyBzZXRzDQo+IHRoZXNlIGRlZmF1bHRzIGFuZCAuZHVtYl9j
cmVhdGUgaW4gc3RydWN0IGRybV9kcml2ZXIuIEFsbCByZW1haW5pbmcNCj4gb3BlcmF0aW9ucyBh
cmUgcHJvdmlkZWQgYnkgQ01BIEdFTSBvYmplY3QgZnVuY3Rpb25zLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgfCAxMSArLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMN
Cj4gaW5kZXggMGY4NWRkODZjYWZhNy4uZDYyMzhjNzFmYWJmNiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5j
DQo+IEBAIC02MiwxNiArNjIsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJ2X2RyaXZl
ciA9IHsNCj4gICAJLm1pbm9yID0gMCwNCj4gICAJLnBhdGNobGV2ZWwgPSAwLA0KPiAgIAkuZm9w
cyA9ICZkcnZfZHJpdmVyX2ZvcHMsDQo+IC0JLmR1bWJfY3JlYXRlID0gc3RtX2dlbV9jbWFfZHVt
Yl9jcmVhdGUsDQo+IC0JLnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxl
X3RvX2ZkLA0KPiAtCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hh
bmRsZSwNCj4gLQkuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkID0gZHJtX2dlbV9jbWFfZnJlZV9v
YmplY3QsDQo+IC0JLmdlbV92bV9vcHMgPSAmZHJtX2dlbV9jbWFfdm1fb3BzLA0KPiAtCS5nZW1f
cHJpbWVfZ2V0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLA0KPiAt
CS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3Nn
X3RhYmxlLA0KPiAtCS5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsDQo+
IC0JLmdlbV9wcmltZV92dW5tYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92dW5tYXAsDQo+IC0JLmdl
bV9wcmltZV9tbWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwNCj4gKwlfX0RSTV9HRU1fQ01B
X0RSSVZFUl9PUFMoc3RtX2dlbV9jbWFfZHVtYl9jcmVhdGUpLA0KPiAgIH07DQo+ICAgDQo+ICAg
c3RhdGljIGludCBkcnZfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikNCj4gDQpIaSBUaG9t
YXMsDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NClJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3Ju
dSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KUGhpbGlwcGUgOi0p
