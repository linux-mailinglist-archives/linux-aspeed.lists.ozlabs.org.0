Return-Path: <linux-aspeed+bounces-2451-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0C1BDB915
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Oct 2025 00:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmSwW2Q8bz2xdg;
	Wed, 15 Oct 2025 09:06:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.202.115.85
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760442195;
	cv=none; b=YTXUMYVHvQXCLYd4gD38QOhJzB8nSyHz0rqbhz2LKdiHiLt8jaukpdOtHoUAqgd2h3yAQaZWvcEgZkm9qH8EJWgl4G5zEGdnarWXPK6mtuXK2dbtYNQdDqYsYvjSKN0AanULaSjcrWvUohZtDFGs6zxweQ7xLZsugjl9REJMys8/HsQgyIVOPLiphw4h8fQKr8HM0ETasApdM0SSBhCczSFUjtjWXq2GSCKhE7Y60W31rHojqE+DWZ/Zd529xV4jh4dMS8HnmN0wX1C1m+zeDxL7c4RPveDq3dtfUgTyH2FbiZ2vJb2G/sDYLB0GKtRzSnuOezw5GEe+5V/I+7/PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760442195; c=relaxed/relaxed;
	bh=adqYrNWFl2N/LQ0a3Bo+x82zSIbur7eZDAVIJhR6css=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WhVBQp6Pla2XWSWbnIo/8fsTVR7g3QatvEyBZM3qu8nmFiHi5q6y6D7KrkB/m6wR549FgOEOyKIFK2CFjwCucFga5XjJeqekzewuV/qGREwFqjQ+pdJiTulrJNX0voFCIYW5cPPek71Twz+tupG2cA1m114OMMiDs1Q2z7ctVn/On2uq7gCkw4t4eb/jUDmpbGyHIbBy8tUZOwogLn4Sr24ApBBWPxR0VlGD4gprOVkN2Tdi+z4BFysYbCP0uJnvGDmSXpIjPpzJAWFkKhALwItodlAO/5JTay4nhW9oYZYJAnsArHCwxWf4+zZCUCLSK/KNdr0puvXT7CHdDdhojA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass (client-ip=111.202.115.85; helo=baidu.com; envelope-from=lirongqing@baidu.com; receiver=lists.ozlabs.org) smtp.mailfrom=baidu.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baidu.com (client-ip=111.202.115.85; helo=baidu.com; envelope-from=lirongqing@baidu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1215 seconds by postgrey-1.37 at boromir; Tue, 14 Oct 2025 22:43:13 AEDT
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmC5Y5vpRz3bW7
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Oct 2025 22:43:11 +1100 (AEDT)
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Lance Yang <lance.yang@linux.dev>, Petr Mladek <pmladek@suse.com>
CC: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, David Hildenbrand <david@redhat.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, Stanislav Fomichev <sdf@fomichev.me>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	"Russell King" <linux@armlinux.org.uk>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>, "Jonathan Corbet" <corbet@lwn.net>, Joel Granados
	<joel.granados@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, Phil
 Auld <pauld@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, "Pawan Gupta"
	<pawan.kumar.gupta@linux.intel.com>, Simon Horman <horms@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, Florian Westphal
	<fw@strlen.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kees Cook
	<kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Paul E . McKenney"
	<paulmck@kernel.org>, Feng Tang <feng.tang@linux.alibaba.com>, "Jason A .
 Donenfeld" <Jason@zx2c4.com>
Subject: =?utf-8?B?UkU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdW3YzXSBodW5nX3Rhc2s6?=
 =?utf-8?Q?_Panic_after_fixed_number_of_hung_tasks?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF1bdjNdIGh1bmdfdGFzazogUGFu?=
 =?utf-8?Q?ic_after_fixed_number_of_hung_tasks?=
Thread-Index: AQHcPPm0jtT8NfwTvU+HoV1DLPkLbbTBfbMw
Date: Tue, 14 Oct 2025 11:18:17 +0000
Message-ID: <38af4922ca44433fa7cd168f7c520dc9@baidu.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
 <3acdcd15-7e52-4a9a-9492-a434ed609dcc@linux.dev>
In-Reply-To: <3acdcd15-7e52-4a9a-9492-a434ed609dcc@linux.dev>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.127.72.24]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.50.48
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+Pj4gQ3VycmVudGx5LCB3aGVuICdodW5nX3Rhc2tfcGFuaWMnIGlzIGVuYWJsZWQsIHRoZSBr
ZXJuZWwgcGFuaWNzDQo+ID4+PiBpbW1lZGlhdGVseSB1cG9uIGRldGVjdGluZyB0aGUgZmlyc3Qg
aHVuZyB0YXNrLiBIb3dldmVyLCBzb21lIGh1bmcNCj4gPj4+IHRhc2tzIGFyZSB0cmFuc2llbnQg
YW5kIHRoZSBzeXN0ZW0gY2FuIHJlY292ZXIsIHdoaWxlIG90aGVycyBhcmUNCj4gPj4+IHBlcnNp
c3RlbnQgYW5kIG1heSBhY2N1bXVsYXRlIHByb2dyZXNzaXZlbHkuDQo+ID4NCj4gPiBNeSB1bmRl
cnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBwYXRjaCB3YW50ZWQgdG8gZG86DQo+ID4NCj4gPiAgICAg
KyByZXBvcnQgZXZlbiB0ZW1wb3Jhcnkgc3RhbGxzDQo+ID4gICAgICsgcGFuaWMgb25seSB3aGVu
IHRoZSBzdGFsbCB3YXMgbXVjaCBsb25nZXIgYW5kIGxpa2VseSBwZXJzaXN0ZW50DQo+ID4NCj4g
PiBXaGljaCBtaWdodCBtYWtlIHNvbWUgc2Vuc2UuIEJ1dCB0aGUgY29kZSBkb2VzIHNvbWV0aGlu
ZyBlbHNlLg0KPiANCj4gQ29vbC4gU291bmRzIGdvb2QgdG8gbWUhDQo+IA0KPiA+DQo+ID4+PiAt
LS0gYS9rZXJuZWwvaHVuZ190YXNrLmMNCj4gPj4+ICsrKyBiL2tlcm5lbC9odW5nX3Rhc2suYw0K
PiA+Pj4gQEAgLTIyOSw5ICsyMzIsMTEgQEAgc3RhdGljIHZvaWQgY2hlY2tfaHVuZ190YXNrKHN0
cnVjdCB0YXNrX3N0cnVjdA0KPiAqdCwgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQ0KPiA+Pj4gICAg
CSAqLw0KPiA+Pj4gICAgCXN5c2N0bF9odW5nX3Rhc2tfZGV0ZWN0X2NvdW50Kys7DQo+ID4+PiAr
CXRvdGFsX2h1bmdfdGFzayA9IHN5c2N0bF9odW5nX3Rhc2tfZGV0ZWN0X2NvdW50IC0NCj4gPj4+
ICtwcmV2X2RldGVjdF9jb3VudDsNCj4gPj4+ICAgIAl0cmFjZV9zY2hlZF9wcm9jZXNzX2hhbmco
dCk7DQo+ID4+PiAtCWlmIChzeXNjdGxfaHVuZ190YXNrX3BhbmljKSB7DQo+ID4+PiArCWlmIChz
eXNjdGxfaHVuZ190YXNrX3BhbmljICYmDQo+ID4+PiArCQkJKHRvdGFsX2h1bmdfdGFzayA+PSBz
eXNjdGxfaHVuZ190YXNrX3BhbmljKSkgew0KPiA+Pj4gICAgCQljb25zb2xlX3ZlcmJvc2UoKTsN
Cj4gPj4+ICAgIAkJaHVuZ190YXNrX3Nob3dfbG9jayA9IHRydWU7DQo+ID4+PiAgICAJCWh1bmdf
dGFza19jYWxsX3BhbmljID0gdHJ1ZTsNCj4gPg0KPiA+IEkgd291bGQgZXhwZWN0IHRoYXQgdGhp
cyBwYXRjaCBhZGRlZCBhbm90aGVyIGNvdW50ZXIsIHNpbWlsYXIgdG8NCj4gPiBzeXNjdGxfaHVu
Z190YXNrX2RldGVjdF9jb3VudC4gSXQgd291bGQgYmUgaW5jcmVtZW50ZWQgb25seSBvbmNlIHBl
cg0KPiA+IGNoZWNrIHdoZW4gYSBodW5nIHRhc2sgd2FzIGRldGVjdGVkLiBBbmQgaXQgd291bGQg
YmUgY2xlYXJlZCAocmVzZXQpDQo+ID4gd2hlbiBubyBodW5nIHRhc2sgd2FzIGZvdW5kLg0KPiAN
Cj4gTXVjaCBjbGVhbmVyLiBXZSBjb3VsZCBhZGQgYW4gaW50ZXJuYWwgY291bnRlciBmb3IgdGhh
dCwgeWVhaC4gTm8gbmVlZCB0bw0KPiBleHBvc2UgaXQgdG8gdXNlcnNwYWNlIDspDQo+IA0KPiBQ
ZXRyJ3Mgc3VnZ2VzdGlvbiBzZWVtcyB0byBhbGlnbiBiZXR0ZXIgd2l0aCB0aGUgZ29hbCBvZiBw
YW5pY2tpbmcgb24NCj4gcGVyc2lzdGVudCBoYW5ncywgSU1ITy4gUGFuaWMgYWZ0ZXIgTiBjb25z
ZWN1dGl2ZSBjaGVja3Mgd2l0aCBodW5nIHRhc2tzLg0KPiANCj4gQFJvbmdRaW5nIGRvZXMgdGhh
dCB3b3JrIGZvciB5b3U/DQoNCg0KSW4gbXkgb3BpbmlvbiwgYSBzaW5nbGUgdGFzayBoYW5nIGlz
IG5vdCBhIGNyaXRpY2FsIGlzc3VlLCBmYXRhbCBoYW5nc+KAlHN1Y2ggYXMgdGhvc2UgY2F1c2Vk
IGJ5IEkvTyBoYW5ncywgbmV0d29yayBjYXJkIGZhaWx1cmVzLCBvciBoYW5ncyB3aGlsZSBob2xk
aW5nIGxvY2tz4oCUd2lsbCBpbmV2aXRhYmx5IGxlYWQgdG8gbXVsdGlwbGUgdGFza3MgYmVpbmcg
aHVuZy4gSW4gc3VjaCBzY2VuYXJpb3MsIHVzZXJzIGNhbm5vdCBldmVuIGxvZyBpbiB0byB0aGUg
bWFjaGluZSwgbWFraW5nIGl0IGV4dHJlbWVseSBkaWZmaWN1bHQgdG8gaW52ZXN0aWdhdGUgdGhl
IHJvb3QgY2F1c2UuIFRoZXJlZm9yZSwgSSBiZWxpZXZlIHRoZSBjdXJyZW50IGFwcHJvYWNoIGlz
IHNvdW5kLiBXaGF0J3MgeW91ciBvcGluaW9uPw0KDQotTGkNCg0K

