Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33BF2B2A
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:47:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z9420R9zF3jj
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:47:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=178.15.145.194;
 helo=mailgate1.rohmeurope.com;
 envelope-from=prvs=82120a2474=matti.vaittinen@fi.rohmeurope.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
X-Greylist: delayed 911 seconds by postgrey-1.36 at bilbo;
 Tue, 05 Nov 2019 22:09:29 AEDT
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by lists.ozlabs.org (Postfix) with ESMTP id 476n494BwQzF3XL
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Nov 2019 22:09:26 +1100 (AEDT)
X-AuditID: c0a8fbf4-183ff70000001fa6-9b-5dc154d30e3a
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 1C.45.08102.3D451CD5; Tue,  5 Nov 2019 11:54:11 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 11:54:06 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Subject: Re: [PATCH 00/62] Add definition for GPIO direction
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8VmiA
Date: Tue, 5 Nov 2019 10:54:06 +0000
Message-ID: <98b0fcbae31f548d42264c91b1b853d71167607c.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <25949A246E0DB248848B1397A8FF864E@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0wcZRSG/Wa+mR0oS4YtyFdsm7iaGrW2gv44am36o03GaqtYjUYldJCR
 RWEhu0vTNk2kt5BdhEKK6TICtcjGciuwiyLbLoXthZZegHAptGBdAS0YLgZIuaozrC38mXnm
 vOc97/lxhqN1OVwEl2i0SCajmKRnA3Hj2fmalzo+aIp5eSr7FagZvIGgs91LgbuDg6wjpyjI
 nDhFQ2XWFQxThS0YOo87EVzMukTD3NhlDfi63oXSPAy9h89TMN+6SMMxuRhD2bf1GIZcAxTk
 LfxIgXOgm4Gj5bdpcJ1eQGCbK6Whw13AwnclJzD095ch+Gl4jAJb9yAD1imZhQeVdxi4VjKN
 wFdagKHAcQ1D0WIlA2PDH0OD6yYFk+MXGWj6cxRDu72VhqF8FwuLdU4MGaWdSlv5IIK22V4K
 HtSGQ5/LxYC94jyCWXcRhnu5JxFkjTtY8Pw6ibZFCV0Zbo1QPXmEFcZ7jmsE+f4tVrDPF2PB
 3RghZE56aaFe7tcI7X9fpQVnmZUV+rovsELR9WjBVfK10Go/g4SciVGlPONA7639ZNWWONGy
 b09ignHz1r2rDH2dRVRqNrN/vnMap6MFbEMBHOFfJT2lpykbCuR0fBcic0PjrP+jGZH63GnG
 hjiO5bcQW69GxVD+NVLTHqK20PzDMNLxWw+rDlqttNw4ehapHMq/Scrvu1g/R5EZTwGlMuaf
 JY3pLUus5XeT6tq2pSV0/HZyt9m7xAH8DmK/ZF1ixK8j1vSxpX6aDyfOPx4y/qV5UnKhlfZz
 GBke+Of/up54Zn1Y3ZPmnydV7s1+6zby88wY4+enSV6mT+NfIYRczx/EOehJeUWCvOyWV7jl
 FW55hft7xJQhkiwmJiWIFilyk0lK22RKMSQrr89Tkp3If9tTv6B/vW95EcUhL1rDUfow7cbX
 G2N0wXEp8QcMotkQa0pLksxeRDhaH6ptt3tidNp48cBByZTySHqKw/pw7XO+3Bgdr2Z9JUmp
 kumRupbj9ER78/2mGF2ISUqQ9n+RmGRZlikuQB0eGBFqlozxkklMsxhi1fOINSv3oUpBSu4P
 exS71pwqJitVv7UFRXI5w4XFNHe50KE874x7HLQOG1OMUkS4VqsaeNVgSDM+jhtB4RzSr9Ya
 VDVI+c0fTxtRgigl6J2BBjXIIi5LEenoZFLV3N1TQxs37BPXN0fvzX4ioCKsxyH7KoLPmC3B
 ddKh9Z6MAJQQpP89eLG2xxu0rq74sDGqwmw9t6YoT5LNrrh43VVq/vboR8+80XzCvstRdqvp
 s7a/XqzJunLo4PYPz1V7o6ls49ad1p0TxwardudvuPf2lw1N34xMfBqyo69xV7Eemw1i5Au0
 ySz+B97DnWejBAAA
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:02 +1100
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
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQpPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTI6MDkgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gVGhlIHBhdGNoIHNlcmllcyBhZGRzIGRlZmluaXRpb25zIGZvciBHUElPIGxpbmUgZGly
ZWN0aW9ucy4NCg0KQXJnaC4gU29ycnkgcGVlcHMuIE15IG5ldyBjb29sIHBhdGNoIHNjcmlwdCBt
ZXNzZWQgdXAgdGhlIG1lc3NhZ2UtaWQNCmhlYWRlciBjYXVzaW5nIHRoZSBtZXNzYWdlcyB0byBu
b3QgYmUgbmljZWx5IGdyb3VwZWQgaW4gb25lIHRocmVhZC4NClBhdGNoZXMgYXJlIG5vdyBhbGwg
c2NhdHRlcmVkIGFyb3VuZCB5b3VyIChpbilib3hlcyA6Lw0KDQpJIHdvbid0IHJlc2VuZCB0aGUg
c2VyaWVzIHVubGVzcyByZXF1ZXN0ZWQgdGhvdWdoIC0gc2VuZGluZyA2MiBtYWlscyBpcw0Kbm90
IGZ1biAtIHJlY2VpdmluZyB0aGVtIG1heSBiZSBldmVuIGxlc3MgZnVuLi4uIA0KDQpTb3JyeSBv
bmNlIG1vcmUNCi0tTWF0dGkNCg==
